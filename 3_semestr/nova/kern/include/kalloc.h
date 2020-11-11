/*
 * Very simple memory allocator
 */

#pragma once

#include "types.h"
#include "memory.h"

class Kalloc
{
    private:
        const mword begin;
        mword end;

        // Bitmap for 64 MB of memory
        static const unsigned mempool_pages = 64*(1<<20)/PAGE_SIZE;
        unsigned page_bitmap[mempool_pages/32];

        bool is_page_allocated(unsigned idx);
        void mark_page_allocated(unsigned idx, bool allocated);

    public:

        enum Fill
        {
            NOFILL = 0,
            FILL_0,
            FILL_1
        };

        static Kalloc allocator;

        Kalloc (mword virt_begin, mword virt_end) : begin (virt_begin), end (virt_end) {}

        void * alloc(unsigned size);

        void * alloc_page (unsigned size, Fill fill = NOFILL);
        void free_page (void *);

        static void * phys2virt (mword);

        static mword virt2phys (void *);
};
