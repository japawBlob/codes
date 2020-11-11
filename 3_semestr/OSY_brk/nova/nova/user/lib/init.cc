/*
 * Initialization Code
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

#include "compiler.h"
#include "console_kernel.h"
#include "types.h"
#include "extern.h"
#include "stdio.h"

extern "C"
void __init ()
{
    for (void (**func)() = &CTORS_G; func != &CTORS_E; (*func++)()) ;

    console.init();

    for (void (**func)() = &CTORS_L; func != &CTORS_G; (*func++)()) ;
}
