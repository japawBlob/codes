#include "ec.h"
#include "kalloc.h"
#include "ptab.h"
#include "types.h"
#include "string.h"
#include "bits.h"
#include "memory.h"

typedef enum {
    sys_print      = 1,
    sys_sum        = 2,
    sys_break      = 3,
    sys_thr_create = 4,
    sys_thr_yield  = 5,
} Syscall_numbers;

void Ec::syscall_handler (uint8 a)
{
    // Get access to registers stored during entering the system - see
    // entry_sysenter in entry.S
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
        case sys_sum: {
            // Naprosto nepotřebné systémové volání na sečtení dvou čísel
            int first_number = r->esi;
            int second_number = r->edi;
            r->eax = first_number + second_number;
            break;
        }
        case sys_break: {
            //mword blob = align_up(r->esi, PAGE_SIZE);
            //printf("UP+++++%lu+++++\n", blob);
            //printf("EDI+++++%lu+++++\n", r->edi);
            //printf("BREAK CURR+++++%lu+++++\n", Ec::break_current);
            //blob = align_dn(r->esi, PAGE_SIZE);
            //printf("DOWN+++++%lu+++++\n", blob);
            //printf("blob\n");
            /*mword blob = align_dn(r->esi, PAGE_SIZE);
            printf("1 %lu\n", blob);
            //blob--;
            blob = align_dn(blob, PAGE_SIZE);
            printf("2 %lu\n", blob);
*/
            //printf("MAX %lu\n MIN %lu\n", USER_ADDR, Ec::break_min);
            //printf("Current %lu\n TargetedAddr: %lu\n", Ec::break_current, r->esi);
            //int blob = 0;
            mword original_break = Ec::break_current;

            if (r->esi == 0 || r->esi == Ec::break_current){
                printf("return 1\n");
                r->eax = Ec::break_current;
                break;
                //Ec::break_current = r->eax;
            }
            printf("ORIGINAL BREAK: %lx\nTARGETED ADDRES: %lx\n", original_break, r->esi);


            if(r->esi >= USER_ADDR || r->esi < Ec::break_min){
                printf("return 2\n");

                r->eax = 0;
                //printf("KUK\n");
                break;
            }
            if(r->esi < Ec::break_current){
                printf("wE sHoUlD fReE\n");
                //mword targetedPage = align_up(r->esi, PAGE_SIZE);
                //mword dealocatingPointer = align_dn(Ec::break_current, PAGE_SIZE);

                //printf("Ec::break_current: %lx\n targetedPage: %lx\n dealocatingPointer: %lx\n", Ec::break_current, targetedPage, dealocatingPointer);

                /*while(Ec::break_current>targetedPage){
                    printf("Ec::break_current: %lx\n targetedPage: %lx\n", Ec::break_current, targetedPage);
                    Ptab::insert_mapping(dealocatingPointer, 0,0);
                    printf("1\n");
                    mword blob = align_dn(Ptab::get_mapping(dealocatingPointer), PAGE_SIZE);
                    printf("BLOB %lx\n", blob);
                    Kalloc::allocator.free_page(Kalloc::phys2virt(blob));
                    printf("2\n");
                    dealocatingPointer--;
                    dealocatingPointer = align_dn(dealocatingPointer, PAGE_SIZE);
                    //Ec::break_current -= PAGE_SIZE;
                }*/
                mword vaddr = align_up(r->esi, PAGE_SIZE);
                while(vaddr<Ec::break_current){
                    mword tofree = align_dn(Ptab::get_mapping(vaddr), PAGE_SIZE);
                    Ptab::insert_mapping(vaddr, 0,0);
                    Kalloc::allocator.free_page(Kalloc::phys2virt(tofree));
                    vaddr+= PAGE_SIZE;
                }

                printf("return 3\n");
                Ec::break_current = r->esi;
                r->eax = original_break;
                break;
            } else {
                //r->eax = Ec::break_current;
                printf("We ShOuLd AlLoC\n");
                //mword topOfTheCurrentPage = align_up(Ec::break_current, PAGE_SIZE);
                //memset((void*)Ec::break_current, 0, topOfTheCurrentPage-Ec::break_current);
                //printf("r->esi: %lu\n... align_up: %lu\n", r->esi, align_up(Ec::break_current, PAGE_SIZE));
                printf("r->esi %lx    Ec::break_current: %lx     align_up(break_current): %lx\n", r->esi, Ec::break_current, align_up(Ec::break_current, PAGE_SIZE));
                if(r->esi <= align_up(Ec::break_current, PAGE_SIZE)){
                    //printf("here1\n");
                    memset(reinterpret_cast<void*>(Ec::break_current), 0, align_up(Ec::break_current, PAGE_SIZE)-Ec::break_current);
                    //printf("a tohle?\n");
                    Ec::break_current = r->esi;
                    printf("return 4\n");
                    r->eax = original_break;

                    ret_user_sysexit();
                    break;

                }
                //printf("blob\n");

                //printf("AAAAA r->esi: %lx\n... align_up: %lx\n Ec::break_current: %lx\n", r->esi, align_up(Ec::break_current, PAGE_SIZE),Ec::break_current);
                while(r->esi > align_up(Ec::break_current, PAGE_SIZE)){
                    void* ret = Kalloc::allocator.alloc_page (1, Kalloc::FILL_0);
                    if(ret == NULL){
                        //printf("here2");
                        /*while(Ec::break_current>align_up(original_break, PAGE_SIZE)){
                            Ptab::insert_mapping(align_dn(Ec::break_current, PAGE_SIZE), 0,0);
                            Kalloc::allocator.free_page(Kalloc::phys2virt(align_dn(Ec::break_current, PAGE_SIZE)));
                            Ec::break_current--;
                            Ec::break_current = align_dn(Ec::break_current, PAGE_SIZE);
                        }
                        r->eax = 0;*/
                        mword vaddr = align_up(original_break, PAGE_SIZE);
                        while(vaddr<Ec::break_current){
                            //printf("chybka\n");
                            mword tofree = align_dn(Ptab::get_mapping(vaddr), PAGE_SIZE);
                            Ptab::insert_mapping(vaddr, 0,0);
                            Kalloc::allocator.free_page(Kalloc::phys2virt(tofree));
                            vaddr+= PAGE_SIZE;
                        }

                        Ec::break_current = original_break;
                        printf("return 5\n");
                        r->eax = 0;
                        ret_user_sysexit();
                    }
                    if(!Ptab::insert_mapping (align_dn(Ec::break_current, PAGE_SIZE), Kalloc::virt2phys (ret),Ptab::PRESENT | Ptab::RW | Ptab::USER)){
                        //printf("here3");
                        /*while(Ec::break_current>align_up(original_break, PAGE_SIZE)){
                            Ptab::insert_mapping(align_dn(Ec::break_current, PAGE_SIZE), 0,0);
                            Kalloc::allocator.free_page(Kalloc::phys2virt(align_dn(Ec::break_current, PAGE_SIZE)));
                            Ec::break_current--;
                            Ec::break_current = align_dn(Ec::break_current, PAGE_SIZE);
                        }
                        r->eax = 0;*/
                        mword vaddr = align_up(original_break, PAGE_SIZE);
                        while(vaddr<Ec::break_current){
                            mword tofree = align_dn(Ptab::get_mapping(vaddr), PAGE_SIZE);
                            Ptab::insert_mapping(vaddr, 0,0);
                            Kalloc::allocator.free_page(Kalloc::phys2virt(tofree));
                            vaddr+= PAGE_SIZE;
                        }

                        Ec::break_current = original_break;
                        printf("return 6\n");
                        r->eax = 0;
                        ret_user_sysexit();
                    }
                    //Ptab::insert_mapping (adresa stranky kterou zrovna alokuju, Kalloc::virt2fyz(adreasa kterou mi dal alokator), priznaky )
                    //Ptab::insert_mapping (Ec::break_current, Kalloc::virt2phys (ret), Ptab::PRESENT | Ptab::RW | Ptab::USER);
                    //printf("here4");
                    Ec::break_current++;
                    Ec::break_current = align_up(Ec::break_current, PAGE_SIZE);
                }
                //Ec::break_current++;
                //Ec::break_current = align_up(Ec::break_current, PAGE_SIZE);
                //printf("BBBBB r->esi: %lx\n... align_up: %lx\n Ec::break_current: %lx\n", r->esi, align_up(Ec::break_current, PAGE_SIZE),Ec::break_current);
                Ec::break_current = r->esi;
                //r->esi = Ec::break_current;
                printf("return 7\n");
                r->eax = original_break;
            }
            break;
        }
        default:
            printf ("unknown syscall %d\n", number);
            break;
    };

    ret_user_sysexit();
}

/*

zkontrolovat nulovou adresu
zkontrolovat min a max adresu (boundries)
memory.h hezky definy
zjistit, jestli je allock nebo realloc (free)
[Ec::breakcurrent]
deallokace 
prvni stranka nad starym brakem Ec::align_up
prvni stranka dole Ec::align_down
velikost stranky page_size
pri allokaci - hodim align up do brku
for cyklus pres stranky co mam alokovat
alokovani stranky Kalloc::allocator.alloc_page (pocet stranek, jaky hodnoty to ma vyplnit) -> toto vraci void ukazatel -> musim zkontrolovat,
 jestli to neni NULL -> kdyz se neco pokazi, tak musim dealokovat, co jsem zatim naalokoval
mam naalokovanou stranku, ale musim ji namapovat na fyzickou stranku
Ptab::insert_mapping (adresa stranky kterou zrovna alokuju, Kalloc::virt2fyz(adreasa kterou mi dal alokator), priznaky ) (najde se c ec.cc 146 radek
(bez panic))
zkontrolovat, jestli to nedopadlo spatne -dealokovat 

kdyz alokuji, tak nejdriv vynuluju zbytek stranky, a potom zacnu alokovat na dalsi strance
Nulovani proiha pomoci fce memset
zjistit, jestli nejsem na konci stranky -> neni co nulovat
idealne udelat pomoci memset

Dealloc
for cyklus, ktery bere pocatek a konec a to dealokovat
Jak zrusit mapovani ptab::get_mapping(adresa stranky) -vraci stranku adresy a na poslednich trech mistech priznaky idealne vyendovat s FFFFF000
tim dostanu unsigned int promennou, ktera je fyzicka adresa stranky, kterou chci dealokovat
ptab::insert_mapping(virtualni adresa kterou chci dealokovat,0,0), ale dam mu nulu a tim mu naznacim, ze toto mapovani uz neni validni
Kalloc::allocator.free_page(phyz2virt(fyzicka adresa kterou jsem ziskal z get mapping))

*/