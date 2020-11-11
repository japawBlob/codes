/*
 * Kernel Console
 *
 * Copyright (C) 2009-2011 Udo Steinberg <udo@hypervisor.org>
 * Copyright (C) 2016 Michal Sojka <sojkam1@fel.cvut.cz>
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

static inline unsigned syscall3 (unsigned w0, unsigned w1, unsigned w2)
{
    asm volatile (
        "   mov %%esp, %%ecx    ;"
        "   mov $1f, %%edx      ;"
        "   sysenter            ;"
        "1:                     ;"
        : "+a" (w0) : "S" (w1), "D" (w2) : "ecx", "edx", "memory");
    return w0;
}

static void write_to_terminal(const void *data, unsigned len)
{
	syscall3(1, (unsigned)data, len);
}


void Console_kernel::putc (int c)
{
	buf[buf_len++] = c;

	if (c == '\n' || buf_len == sizeof(buf)) {
		write_to_terminal(buf, buf_len);
		buf_len = 0;
	}
}
