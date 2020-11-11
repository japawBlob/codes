#include <stdio.h>
//#include "hello.c"
#include "types.h"

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

typedef char ALIGN[16];

union header {
	struct {
		unsigned long int size;
		unsigned is_free;
		union header *next;
	} s;
	ALIGN stub;
};
typedef union header header_t;
header_t *head, *tail = NULL;


header_t *get_free_block(unsigned long int size)
{
	header_t *curr = head;
	while(curr) {
		if (curr->s.is_free && curr->s.size >= size)
			return curr;
		curr = curr->s.next;
	}
	return 0;
}

extern "C" void *my_malloc(unsigned long int size){
	//unsigned long int total_size;
	void *block;
	header_t *header;
	if (!size){
		printf("nejde\n");
		return NULL;
	}
	header = get_free_block(size);
	if (header != 0) {
		header->s.is_free = 0;
		return (void*)(header + 1);
	}
	//total_size = sizeof(header_t) + size + (unsigned long int)brk(0);
	block = brk((void*) (sizeof(header_t)+ size + (char*)brk(0)));
	if (block == NULL) {
		//printf("total %lu \n", total_size);
		//printf("size %lu \n", size);
		printf("block %lu \n", (unsigned long int)block);
		printf("zas nejde\n");
		return NULL;
	}
	header = (header_t*)block;
	header->s.size = size;
	header->s.is_free = 0;
	header->s.next = NULL;
	if (!head)
		head = header;
	if (tail)
		tail->s.next = header;
	tail = header;
	return (void*)(header + 1);

}



extern "C" int my_free(void *block){
	header_t *header, *tmp;
	void *programbreak;

	header_t *current = ( header_t*)block-1;
	if(current < head || current > tail){
		return -1;
	}


	header = (header_t*)block - 1;

	programbreak = brk(0);
	if ((char*)block + header->s.size == programbreak) {
		if (head == tail) {
			head = tail = NULL;
		} else {
			tmp = head;
			while (tmp) {
				if(tmp->s.next == tail) {
					tmp->s.next = NULL;
					tail = tmp;
				}
				tmp = tmp->s.next;
			}
		}
		brk((void*)((unsigned long int)brk(0) - sizeof(header_t) - header->s.size));
		return 0;
	}
	header->s.is_free = 1;
	return 0;
}


