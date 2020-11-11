//THIS IS NOT MY EC_SYSCALL, but since there is no public data, and i need to test whether it is my malloc or brk, that is causing problems
//hope i will not couse plagiat

#include "ec.h"
#include "string.h"
#include "ptab.h"
#include "bits.h"

typedef enum {
    sys_print      = 1,
    sys_sum        = 2,
    sys_break      = 3,
    sys_thr_create = 4,
    sys_thr_yield  = 5,
} Syscall_numbers;

void  Ec::syscall_handler (uint8 a)
{
    Sys_regs * r = current->sys_regs();
    Syscall_numbers number = static_cast<Syscall_numbers> (a);

    switch (number) {
        case sys_print: {
            char *data = reinterpret_cast<char*>(r->esi);
            unsigned len = r->edi;
            for (unsigned i = 0; i < len; i++)
                printf("%c", data[i]);
            break;
        }
		case sys_break: {
			mword break_save = break_current;
			mword address = r->esi;
			if(address >= break_min && address < 0xC0000000) {
				if(break_current > address){
					mword vaddr = align_up(address, PAGE_SIZE);
					while(vaddr<break_current){
						mword tofree = align_dn(Ptab::get_mapping(vaddr), PAGE_SIZE);
						Ptab::insert_mapping(vaddr, 0,0);
						Kalloc::allocator.free_page(Kalloc::phys2virt(tofree));
						vaddr+= PAGE_SIZE;
					}
				} else {
					mword vaddr = align_up(break_current, PAGE_SIZE);
					if(vaddr != break_current){
						if(address < vaddr)
							memset(reinterpret_cast<void*>(break_current),0, address-break_current);
						else
							memset(reinterpret_cast<void*>(break_current),0, vaddr-break_current);
					}
					while(address > vaddr){
						bool error = false;
						void *stack = Kalloc::allocator.alloc_page (1, Kalloc::FILL_0);
						if (!stack){
							error = true;
						}
						if (!error && !Ptab::insert_mapping (vaddr, Kalloc::virt2phys (stack),Ptab::PRESENT | Ptab::RW | Ptab::USER)){
							error = true;
						}
						if(error){
							while (break_current <= (vaddr-=PAGE_SIZE)){
								mword tofree = align_dn(Ptab::get_mapping(vaddr), PAGE_SIZE);
								Ptab::insert_mapping(vaddr,0,0);
								Kalloc::allocator.free_page(Kalloc::phys2virt(tofree));
							} 
							r->eax = 0;
							ret_user_sysexit();
						}
						vaddr+=PAGE_SIZE;
					}
				}
				break_current = address;		
			} else if(address != 0){
				r->eax = 0;
				break;
			}		
			r->eax = break_save;
			break;
		}
        default:
            printf ("unknown syscall %d\n", number);
            break;
    	};
	ret_user_sysexit();
}


