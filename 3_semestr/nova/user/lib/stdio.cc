/*
 * Standard I/O
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

#include "console_kernel.h"
#include "cpu.h"
#include "initprio.h"
#include "lock_guard.h"
#include "spinlock.h"
#include "stdio.h"

INIT_PRIORITY (PRIO_CONSOLE)
Console_kernel console;

INIT_PRIORITY (PRIO_CONSOLE)
Spinlock printf_lock;

void panic (char const *format, ...)
{
    va_list args;
    va_start (args, format);
    console.vprintf (format, args);
    va_end (args);

    Cpu::shutdown();
}

int printf (char const *format, ...)
{
    Lock_guard <Spinlock> guard (printf_lock);

    va_list args;

    va_start (args, format);
    console.vprintf (format, args);
    va_end (args);
    return 0;
}

int puts(const char *s)
{
    return printf("%s\n", s);
}

extern "C" NORETURN void __cxa_pure_virtual() { FAIL; }
