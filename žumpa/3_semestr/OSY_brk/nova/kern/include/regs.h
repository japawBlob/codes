/*
 * Register File
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

#include "atomic.h"
#include "compiler.h"
#include "types.h"

class Sys_regs
{
    public:
        union {
            struct {
                mword   edi;
                mword   esi;
                mword   ebp;
                mword   cr2;
                mword   ebx;
                mword   edx;
                mword   ecx;
                mword   eax;
            };
            mword gpr[8];
        };
};

class Exc_regs : public Sys_regs
{
    public:
        union {
            struct {
                mword   gs;
                mword   fs;
                mword   es;
                mword   ds;
                mword   err;
                mword   vec;
                mword   eip;
                mword   cs;
                mword   efl;
                mword   esp;
                mword   ss;
            };
        };

    public:
        ALWAYS_INLINE
        inline bool user() const { return cs & 3; }
};
