/*
 * Execution Context
 *
 * Copyright (C) 2009-2011 Udo Steinberg <udo@hypervisor.org>
 * Economic rights: Technische Universitaet Dresden (Germany)
 *
 * This file is part of the NOVA microhypervisor.
 *
 * NOVA is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * NOVA is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License version 2 for more details.
 */

#include "bits.h"
#include "ec.h"
#include "assert.h"
#include "cpu.h"
#include "ptab.h"
#include "multiboot.h"
#include "elf.h"
#include "string.h"

Ec * Ec::current;

mword Ec::break_min;
mword Ec::break_current;

// used for idle() and root_invoke()
Ec::Ec (void (*f)(), mword mbi) : cont (f)
{
    regs.eax = mbi;		// Store MultiBoot Info to user-space eax register
    regs.cs  = SEL_USER_CODE;
    regs.ds  = SEL_USER_DATA;
    regs.es  = SEL_USER_DATA;
    regs.ss  = SEL_USER_DATA;
    regs.efl = 0x200;           // IF = 1
}

void Ec::ret_user_sysexit()
{
    asm volatile ("lea %0, %%esp;" // Load address of crurrent->regs
                  "popa;"          // Restore all registers from there
                  "sti;"           // Enable interrupts
                  "sysexit"
                  : : "m" (current->regs) : "memory");

    UNREACHED;
}

void Ec::ret_user_iret()
{
    asm volatile ("lea %0, %%esp;"
                  "popa;"
                  "pop %%gs;"
                  "pop %%fs;"
                  "pop %%es;"
                  "pop %%ds;"
                  "add $8, %%esp;"
                  "iret"
                  : : "m" (current->regs) : "memory");

    UNREACHED;
}

void Ec::idle()
{
    for (;;)

    UNREACHED;
}

void Ec::root_invoke()
{
    // Bootloader passed us the "Multiboot information" data
    // structure. Among other things, it contains the physical address
    // of the user space application we want to execute.

    // To access the data at physical address, we have to "map" them
    // to virtual memory. Ptab::remap() creates a temporary mapping of
    // one 4 MB page.
    Multiboot * mbi = static_cast<Multiboot *>(Ptab::remap (current->regs.eax));

    if (!(mbi->flags & Multiboot::MODULES) || (mbi->mods_count < 1))
        panic ("No multiboot modules\n");

    // Copy module desciptor to local variable
    Multiboot_module mod = *static_cast<Multiboot_module *>(Ptab::remap (mbi->mods_addr));

    // Get ELF header from the binary
    Eh *eh = static_cast<Eh *>(Ptab::remap(mod.mod_start));
    if (eh->ei_magic != 0x464c457f || eh->ei_class != 1 || eh->ei_data != 1 || eh->type != 2 || eh->machine != 3)
        panic ("No ELF");

    current->regs.edx = eh->entry; // Initial eip (see sysexit instruction)

    unsigned count = eh->ph_count;

    Ph *ph = static_cast<Ph *>(Ptab::remap(mod.mod_start + eh->ph_offset));

    for (unsigned i = 0; i < count; i++, ph++) {

        if (ph->type == Ph::PT_LOAD) {

            if (ph->f_size > ph->m_size || ph->v_addr % PAGE_SIZE != ph->f_offs % PAGE_SIZE)
                panic ("Bad ELF");

            mword attr;
            if (ph->flags & Ph::PF_W)
                attr = Ptab::PRESENT | Ptab::USER | Ptab::RW;
            else
                attr = Ptab::PRESENT | Ptab::USER;

            mword virt = align_dn(ph->v_addr, PAGE_SIZE);
            mword phys = align_dn(ph->f_offs + mod.mod_start, PAGE_SIZE);
            mword fsize = align_up(ph->v_addr % PAGE_SIZE + ph->f_size, PAGE_SIZE);
            mword msize = align_up(ph->v_addr % PAGE_SIZE + ph->m_size, PAGE_SIZE);

            while (msize > 0) {
                if (fsize == 0) {
                    void *page = Kalloc::allocator.alloc_page (1, Kalloc::FILL_0);
                    if (!page)
                        panic ("Not enough memory\n");
                    phys = Kalloc::virt2phys (page);
                }
                if (!Ptab::insert_mapping(virt, phys, attr))
                    panic ("Not enough memory\n");
                phys += PAGE_SIZE;
                virt += PAGE_SIZE;
                msize -= PAGE_SIZE;
                fsize -= fsize ? PAGE_SIZE : 0;
            }

            // Zero .bss
            if (ph->m_size > ph->f_size)
                memset(reinterpret_cast<void*>(ph->v_addr + ph->f_size),
                       0x00, ph->m_size - ph->f_size);

            Ec::break_min = Ec::break_current = virt;
        }
    }

    // Allocate one page of memory for user space stack
    void *stack = Kalloc::allocator.alloc_page (1, Kalloc::FILL_0);
    if (!stack)
        panic ("Not enough memory\n");

    // Map the stack page at address 0x1000
    if (!Ptab::insert_mapping (0x1000, Kalloc::virt2phys (stack),
                              Ptab::PRESENT | Ptab::RW | Ptab::USER))
        panic ("Not enough memory\n");
    current->regs.ecx = 0x2000;   // Initial esp (see sysexit instruction)

    ret_user_sysexit();

    UNREACHED; // Tell the compiler to not generate function epilog
}

void Ec::handle_tss()
{
    panic ("Task gate invoked\n");
}

bool Ec::handle_exc_ts (Exc_regs *r)
{
    if (r->user())
        return false;

    // SYSENTER with EFLAGS.NT=1 and IRET faulted
    r->efl &= ~0x4000; // nested task eflag

    return true;
}

static const char *vec_desc[] = {
	"Divide error",
	"RESERVED",
	"NMI Interrupt",
	"Breakpoint",
	"Overflow",
	"BOUND Range Exceeded",
	"Undefined Opcode",
	"No Math Coprocessor",
	"Double Fault",
	"Coprocessor Segment Overrun",
	"Invalid TSS",
	"Segment Not Present",
	"Stack-Segment Fault",
	"General Protection",
	"Page Fault",
};


void Ec::handle_exc (Exc_regs *r)
{
    printf ("Ec::handle_exc %s (eip=%#lx cr2=%#lx)\n", vec_desc[r->vec], r->eip, r->cr2);
    printf ("eax=%#lx ebx=%#lx ecx=%#lx edx=%#lx\n", r->eax, r->ebx, r->ecx, r->edx);
    printf ("esi=%#lx edi=%#lx ebp=%#lx esp=%#lx\n", r->esi, r->edi, r->ebp, r->esp);

    if (r->vec == Cpu::EXC_TS && handle_exc_ts (r))
        return;

    panic ("unhandled kernel exception\n");
}
