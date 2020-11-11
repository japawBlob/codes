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

#pragma once

#include "compiler.h"

#ifdef __cplusplus
#include "console_kernel.h"

extern "C" {
#endif

FORMAT (1,2) NORETURN
void panic (char const *format, ...);

FORMAT (1,2)
int printf (char const *format, ...);

int puts(const char *s);

#ifdef __cplusplus
extern Console_kernel console;

}
#endif
