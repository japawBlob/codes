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
    int state = -1;
    bool dootdoot = false;

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
            //naprosto nepotrebne systemove volani ktere jsemm musel udelat
            // printf("ORIgiNAL Brk %lx \n TarGetEd ADDresS %lx\n", Ec::break_current, r->esi);
            mword brk_strt = Ec::break_current;
            // printf("break start?  %lx \n", brk_strt);
            
            mword page_start_alloc = align_up(brk_strt, PAGE_SIZE);
            void *ptr;
           // mword need = r->esi;
            ///printf("Du\n");

            if(r->esi == 0 || r->esi == brk_strt){        //return current
                // printf("ITS BEAUTIFUL AS IT IS\n");
                state = 0;
            }
            else if( r->esi > brk_strt && r->esi < 0xC0000000){ //need to alloc more
                // printf("ALLOC \n");
                state = 1;
            }
            else if(r->esi < brk_strt && r->esi >= break_min && r->esi < 0xC0000000){ //need to realloc and free
                // printf("NICHT ALLOC\n");
                state = 2;
            }
            //printf("du hast\n");
            switch(state){
                case 0:{
                    r->eax = r->esi;
                    //printf("vibe check\n");
                break;}

                case 1:{
                    // printf("more space needed Sire\n");
                    // printf("page start %lx \n", page_start_alloc);
                    // printf("resi %lx \n", r->esi);
                    if(r->esi < align_up(Ec::break_current, PAGE_SIZE)){
                        memset(reinterpret_cast<void*>(Ec::break_current),0, r->esi-Ec::break_current);
                    } else {
                        memset(reinterpret_cast<void*>(Ec::break_current),0, align_up(Ec::break_current, PAGE_SIZE)-Ec::break_current);
                    }
                    
                    for(; page_start_alloc < r->esi; page_start_alloc += PAGE_SIZE){
                        //printf("DOES  IT EVEN ALLOC?\n");
                        ptr = Kalloc::allocator.alloc_page (1, Kalloc::FILL_0);
                        if( ptr && Ptab::insert_mapping (page_start_alloc, Kalloc::virt2phys(ptr), Ptab::PRESENT | Ptab::RW | Ptab::USER )){          //ok kalloc, insert map
                            //printf("filling\n");
                        } else {
                            // printf("error pico\n");
                            // printf("page start %lx \n", page_start_alloc);
                            for(; (page_start_alloc) > Ec::break_current; page_start_alloc -= PAGE_SIZE){ //fucced up, dealloc 
                                //printf("FREEDOOOOOM\n");
                                //printf("page start %lx \n", page_start_alloc);
                                Ptab::insert_mapping(page_start_alloc, 0, 0);
                                // printf("this?\n");
                                Kalloc::allocator.free_page(Kalloc::phys2virt(align_dn(Ptab::get_mapping(page_start_alloc-PAGE_SIZE), PAGE_SIZE)));
                                //printf("or this\n");
                            }
                            // printf("return error\n");
                            r->eax = 0;
                            ret_user_sysexit();
                        }
                        /*Ec::break_current = page_start_alloc;
                        Ec::break_current++;
                        Ec::break_current = align_up(Ec::break_current, PAGE_SIZE);*/
                    }
                    Ec::break_current = r->esi;
                    // printf("NEW BRK alloc more %lx \n", Ec::break_current);
                break;}

                case 2:{
                    // printf("we cannot build here Sire, we need more free\n");
                    mword page_start_free = align_up(r->esi, PAGE_SIZE);
                    for(; page_start_free < Ec::break_current; page_start_free += PAGE_SIZE){
                        mword temp = align_dn(Ptab::get_mapping(page_start_free), PAGE_SIZE);
                        Ptab::insert_mapping(page_start_free, 0, 0);
                        Kalloc::allocator.free_page(Kalloc::phys2virt(temp));
                    }
                    Ec::break_current = r->esi;
                break;}

                default:{
                    printf("DOOOOT\n");
                    dootdoot = true;
                break;}
            }

        if(dootdoot){
            printf("return DOOOOT\n");
            r->eax = 0;
            dootdoot = false;
            break;
        }else{
            //printf("return regular\n");
            r->eax = brk_strt;
            break;
        }

        }
        default:
            printf ("unknown syscall %d\n", number);
            break;
    };

    ret_user_sysexit();
}

/*align up and down gets me the adress of the beginning and  end of a page with the second argument as PAGE_SIZE*/

/*

zkontrolovat nulovou adresu
zkontrolovat min a max adresu (boundaries)
memory.h hezky definy
zjistit, jestli je allock nebo realloc (free)
[Ec::breakcurrent]
deallokace 
prvni stranka nad starym brakem Ec::align_up
prvni stranka dole Ec::align_down
velikost stranky page_size
pri allokaci - hodim align up do brku
for cyklus pres stranky co mam alokovat
alokovani stranky Kalloc::allocator.alloc_page (pocet stranek, jaky hodnoty to ma vyplnit) -> toto vraci void ukazatel -> musim skontrolovat,
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