#include <stdio.h>
#include <stdbool.h>
#include "types.h"
//coppied from hello.c
unsigned syscall2(unsigned w0, unsigned w1)
{
    asm volatile (
        "   mov %%esp, %%ecx    ;"
        "   mov $1f, %%edx      ;"
        "   sysenter            ;"
        "1:                     ;"
        : "+a" (w0) : "S" (w1) : "ecx", "edx", "memory");
    return w0;
}

void *brk(void *address)
{
    return (void*)syscall2(3, (unsigned)address);
}

union header {
    struct {
        unsigned int size;
        _Bool free;
        union header *next;
    } s;
    char ALIGN[16];
};
typedef union header header_t;


header_t *head = NULL;
header_t *tail = NULL; 

extern "C" void *my_malloc(unsigned int size){
	header_t *stuff;
	header_t *current = head;
	while(current != NULL){
		if(current->s.free && current->s.size >= size){
			break;
		}
		current = current->s.next;
	}
	if(current != NULL){
		if(current->s.size != size){
                        header_t *stuffs = (header_t *)((char*)current + 16  + size);
			stuffs->s.size = current->s.size -(sizeof(header_t)+size);
			stuffs->s.next = current->s.next;
			stuffs->s.free = true;
			current->s.size = size;
			current->s.next = stuffs;
		}
		current->s.free = false;
		return (void *)(current +1);
	}
	void* brked = brk((void*) (sizeof(header_t)+ size + (char*)brk(0)));
	if(brked == NULL){
		return NULL;	
	}
	stuff = (header_t*)brked;
	stuff->s.size = size;
	stuff->s.free = false;
	stuff->s.next = NULL;
	if(head == NULL){
		head = stuff;
	}
	if(tail != NULL){
		tail->s.next = stuff;
	}
	tail = stuff;
	return (void *)(stuff+1);	
}




extern "C" int my_free(void *address){
	header_t *current = ( header_t*)address-1;
	if(current < head || current > tail){
		return -1;
	}
	if((char*)address + current->s.size == (char*)brk(0)){
				if(head == tail){
					head = NULL;
					tail = NULL;
				} else {
					header_t *temp = head;
					while(temp != NULL){
						if(temp->s.next == tail){
							temp->s.next = NULL;
							tail = temp;
						}
						temp= temp->s.next;
					}
				}
				brk((void*)((char*)brk(0) - current->s.size - sizeof(header_t)));
				return 0;
			}
	current->s.free = true;
	header_t *next = current->s.next;
	while(next != NULL && next->s.free){
		current->s.size += next->s.size + sizeof(header_t);
		current->s.next = next->s.next;
		next = next->s.next;
	}
	return 0;
}
