/*
 * Simple page table manipulation routines
 */

#pragma once

#include "types.h"
#include "cpu.h"

class Ptab
{
    public:

	enum {
		PRESENT = 1<<0,
		RW      = 1<<1,
		USER    = 1<<2,
		ACCESS  = 1<<5,
		DIRTY   = 1<<6,
	};

        static bool insert_mapping (mword virt, mword phys, mword attr);
        static mword get_mapping (mword virt);

        static void * remap (mword addr);
};
