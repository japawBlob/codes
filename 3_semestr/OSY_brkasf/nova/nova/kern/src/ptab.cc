/*
 * Simple page table manipulation routines
 */

#include "ptab.h"
#include "kalloc.h"
#include "memory.h"
#include "assert.h"

// add 4k mappings only
bool Ptab::insert_mapping (mword virt, mword phys, mword attr)
{
    mword* pdir = static_cast<mword*>(Kalloc::phys2virt(Cpu::cr3()));
    mword* ptab;
    if ((pdir[virt >> 22] & PRESENT) == 0) {
        // add ptab if necessary
        ptab = static_cast<mword*>(Kalloc::allocator.alloc_page(1, Kalloc::FILL_0));
        if (!ptab)
            return false;
        mword p = Kalloc::virt2phys (ptab);
        pdir[virt >> 22] = p | ACCESS | RW | PRESENT | USER;
    } else {
        ptab = static_cast<mword*>(Kalloc::phys2virt (pdir[virt >> 22] & ~PAGE_MASK));
    }
    assert ((phys & PAGE_MASK) == 0);
    ptab[(virt >> PAGE_BITS) & 0x3ff] = (phys & ~PAGE_MASK) | (attr & PAGE_MASK);
    Cpu::flush();
    return true;
}

mword Ptab::get_mapping (mword virt)
{
    mword* pdir = static_cast<mword*>(Kalloc::phys2virt(Cpu::cr3()));
    mword* ptab;

    if ((pdir[virt >> 22] & PRESENT) == 0)
        return 0;
    else
        ptab = static_cast<mword*>(Kalloc::phys2virt (pdir[virt >> 22] & ~PAGE_MASK));

    return ptab[(virt >> PAGE_BITS) & 0x3ff];
}

void * Ptab::remap (mword addr)
{
    mword* pdir = static_cast<mword*>(Kalloc::phys2virt(Cpu::cr3()));
    // flush TLB : old 4M mapping
    pdir[REMAP_SADDR >> 22] = 0;
    Cpu::flush(REMAP_SADDR);
    // insert new mapping
    pdir[REMAP_SADDR >> 22] = (addr & 0xfff00000) + 0xe3;
    return reinterpret_cast<void *>(REMAP_SADDR + (addr & 0xfffff));
}
