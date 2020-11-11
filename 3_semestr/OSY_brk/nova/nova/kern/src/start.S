/*
 * Startup Code
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

#include "memory.h"
#include "selectors.h"

/*
 * Initialization Code
 */
.section .init

.globl                  __start
.globl                  __serial_base

/*
 * Multiboot Header
 */
__boot_header:          .long   0x1badb002
                        .long   0x0
                        .long  -0x1badb002

/*
 * Global Descriptor Table (GDT)
 */
.align                  8, 0x90
__boot_gdt:             .word   0
                        .word   __boot_gdt__ - __boot_gdt - 1
                        .long   __boot_gdt
                        .quad   0x00cf9b000000ffff      /* Kernel Code */
                        .quad   0x00cf93000000ffff      /* Kernel Data */
                        .quad   0x00cffb000000ffff      /* User Code */
                        .quad   0x00cff3000000ffff      /* User Data */
__boot_gdt__:

.code32

__start:
                        // GET SERIAL PORT BASE ADDRESS
                        mov     0x400, %eax
                        cmp     $0, %ax
                        jne 1f
                        shr     $16, %eax
1:                      mov     %ax, __serial_base

                        // SETUP BOOT PAGE TABLE
                        mov     $0xe3, %eax
                        mov     $KERN_PDIR, %edi
1:                      stosl	// store %eax to the memory at %edi and add 4 to %edi
                        add     $0x400000, %eax
                        cmp     $LOAD_E, %eax
                        jb      1b

                        mov     $(LINK_P + 0x1e3), %eax
                        mov     $(KERN_PDIR + (LINK_ADDR >> 20)), %edi
1:                      stosl
                        add     $0x400000, %eax
                        cmp     $LINK_E, %eax
                        jb      1b

                        // INIT PAGING
                        mov     $0x698, %edx
                        mov     %edx, %cr4
                        mov     $KERN_PDIR, %edx
                        mov     %edx, %cr3
                        mov     $0x8001002b, %edx
                        mov     %edx, %cr0

                        lgdt    __boot_gdt + 2
                        ljmp    $SEL_KERN_CODE, $__start_paged // above 3 GiB

__start_paged:          
                        // LOAD SEGMENTS
                        mov     $SEL_KERN_DATA, %ecx
                        mov     %ecx, %ss
                        mov     $SEL_USER_DATA, %ecx
                        mov     %ecx, %ds
                        mov     %ecx, %es
                        mov     %ecx, %fs
                        mov     %ecx, %gs
                        mov     $STACK, %esp

                        jmp     1f

.text

1:                      call    init
                        mov     %ebx, %eax // pass multiboot info as first parameter to bootstrap()
                        mov     $(KSTCK_ADDR + PAGE_SIZE), %esp
                        jmp     bootstrap

.section .initdata
__serial_base:          .long 0
