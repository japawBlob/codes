/*
 * Global System Interrupts (GSI)
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

#include "gsi.h"
#include "lapic.h"
#include "vectors.h"

Gsi         Gsi::gsi_table[NUM_GSI];
unsigned    Gsi::irq_table[NUM_IRQ];

void Gsi::setup()
{
    for (unsigned gsi = 0; gsi < NUM_GSI; gsi++) {

        gsi_table[gsi].vec = static_cast<uint8>(VEC_GSI + gsi);

        if (gsi < NUM_IRQ) {
            irq_table[gsi] = gsi;
            gsi_table[gsi].trg = 0;
            gsi_table[gsi].pol = 0;
        } else {
            gsi_table[gsi].trg = 1;
            gsi_table[gsi].pol = 1;
        }
    }
}

NORETURN void Gsi::vector (unsigned vector)
{
    unsigned gsi = vector - VEC_GSI;

    panic ("Gsi::vector %#x - not completed\n", gsi);
}
