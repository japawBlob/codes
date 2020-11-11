/*
 * Central Processing Unit (CPU)
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

#pragma once

#include "compiler.h"
#include "types.h"

class Cpu
{
    public:
        enum
        {
            EXC_NM      = 7,	/* No Math Coprocessor */
            EXC_TS      = 10,	/* Invalid TSS */
            EXC_GP      = 13,	/* General Protection */
            EXC_PF      = 14,	/* Page Fault */
            EXC_AC      = 17	/* Alignment Check */
        };

        ALWAYS_INLINE
        static inline mword cr3()
        {
            mword cr3;
            asm volatile ("mov  %%cr3, %0" : "=r"(cr3));
            return cr3;
        }

        ALWAYS_INLINE
        static inline void flush ()
        {
            mword cr3;
            asm volatile ("mov %%cr3, %0; mov %0, %%cr3" : "=&r" (cr3));
        }

        ALWAYS_INLINE
        static inline void flush (mword addr)
        {
            asm volatile ("invlpg %0" : : "m" (*reinterpret_cast<mword *>(addr)));
        }

        ALWAYS_INLINE
        static inline void preempt_disable()
        {
            asm volatile ("cli" : : : "memory");
        }

        ALWAYS_INLINE
        static inline void preempt_enable()
        {
            asm volatile ("sti" : : : "memory");
        }

        ALWAYS_INLINE NORETURN
        static inline void shutdown()
        {
            for (;;)
                asm volatile ("cli; hlt");
        }

        ALWAYS_INLINE
        static inline void cpuid (unsigned leaf, uint32 &eax, uint32 &ebx, uint32 &ecx, uint32 &edx)
        {
            asm volatile ("cpuid" : "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx) : "a" (leaf));
        }

        ALWAYS_INLINE
        static inline void cpuid (unsigned leaf, unsigned subleaf, uint32 &eax, uint32 &ebx, uint32 &ecx, uint32 &edx)
        {
            asm volatile ("cpuid" : "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx) : "a" (leaf), "c" (subleaf));
        }
};
