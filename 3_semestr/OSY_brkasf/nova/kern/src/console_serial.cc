/*
 * Serial Console
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

#include "console_serial.h"
#include "x86.h"    // pause ()

void Console_serial::init()
{
    extern unsigned __serial_base;
    if (!__serial_base)
        return;

    base = __serial_base;

    out (LCR, 0x80);
    out (DLR_LO, 1);
    out (DLR_HI, 0);
    out (LCR, 3);
    out (IER, 0);
    out (FCR, 7);
    out (MCR, 3);

    initialized = true;
}

void Console_serial::putc (int c)
{
    if (c == '\n')
        putc ('\r');

    while (EXPECT_FALSE (!(in (LSR) & 0x20)))
        pause();

    out (THR, c);
}
