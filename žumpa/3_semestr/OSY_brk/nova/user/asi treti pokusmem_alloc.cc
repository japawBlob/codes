
/*
#include "ec.h"
#include "kalloc.h"
#include "ptab.h"
#include "types.h"
#include "string.h"
#include "bits.h"
#include "memory.h"
*/
#include <stdio.h>
#include "types.h"

unsigned syscall2(unsigned w0, unsigned w1){
    asm volatile (
        "   mov %%esp, %%ecx    ;"
        "   mov $1f, %%edx      ;"
        "   sysenter            ;"
        "1:                     ;"
        : "+a" (w0) : "S" (w1) : "ecx", "edx", "memory");
    return w0;
}

void *brk(void *address){
    return (void*)syscall2(3, (unsigned)address);
}

typedef char ALIGN[16];

union header {
	struct {
		unsigned int size;
		unsigned is_free;
		union header *next;
	} s;
	ALIGN stub;
};
typedef union header header_t;

header_t *head, *tail = NULL;


header_t *get_free_block(unsigned int size)
{
	header_t *curr = head;
	while(curr) {
		if (curr->s.is_free && curr->s.size >= size)
			return curr;
		curr = curr->s.next;
	}
	return 0;
}

extern "C" void *my_malloc(unsigned int size)
{
	unsigned int total_size;
	void *block;
	header_t *header;
	unsigned int* originalBrk = (unsigned int*)brk(0);
	if (!size){
		printf("MALLOC: 1\n");
		return 0;
	}
//	pthread_mutex_lock(&global_malloc_lock);
	header = get_free_block(size);
	if (header) {
		header->s.is_free = 0;
//		pthread_mutex_unlock(&global_malloc_lock);
		printf("MALLOC: 2\n");
		return (void*)(header + 1);
	}
	total_size = sizeof(header_t) + size;
	block = brk(originalBrk+total_size);
	if (block == (void*) 0) {
//		pthread_mutex_unlock(&global_malloc_lock);
		printf("MALLOC: 3\n");
		return 0;
	}
	header = (header_t*)block;
	header->s.size = size;
	header->s.is_free = 0;
	header->s.next = 0;
	if (!head){
		head = header;
	}
	if (tail){
		tail->s.next = header;
	}
	tail = header;
//	pthread_mutex_unlock(&global_malloc_lock);
	printf("MALLOC: 4\n");
	return (void*)(header + 1);
}


extern "C" int my_free(void *block){
	header_t *header, *tmp;
	void *programbreak;

	header_t* current = (header_t*)block-1;
	printf("head:%p    tail:%p\n", head, tail);

	if (current < head || current > tail){
		printf("FREE: 1\n");
		return 0xAA791D;
	}
//	pthread_mutex_lock(&global_malloc_lock);
	header = (header_t*)block - 1;

	programbreak = brk(0);
	printf("%p == %p\n", (unsigned int*)block + header->s.size, programbreak);
	if ((char*)block + header->s.size == programbreak) {
		if (head == tail) {
			head = tail = 0;
		} else {
			tmp = head;
			while (tmp) {
				if(tmp->s.next == tail) {
					tmp->s.next = 0;
					tail = tmp;
				}
				tmp = tmp->s.next;
			}
		}
		brk((void*)((unsigned long int)brk(0) - sizeof(header_t) - header->s.size));
//		pthread_mutex_unlock(&global_malloc_lock);
		printf("FREE: 2\n");
		return 0;
	}
	header->s.is_free = 1;
//	pthread_mutex_unlock(&global_malloc_lock);
	printf("FREE: 3\n");
	return 0;
}