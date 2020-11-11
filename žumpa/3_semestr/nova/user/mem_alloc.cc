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
 
header_t *head = NULL; 
header_t *tail = NULL;
 
 
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
 
extern "C" void *my_malloc(unsigned int size){
    void *block;
    header_t *header = head;
    //header_t *curr;
    if (!size){
        return NULL;
    }
    header = get_free_block(size);
     
 
    if (header != NULL) {
        header->s.is_free = 0;
        return (void*)(header + 1);
    }
    block = brk((void*) (sizeof(header_t)+ size + (char*)brk(0)));
    if (block == NULL) {
        return NULL;
    }
    header = (header_t*)block;
    header->s.size = size;
    header->s.is_free = 0;
    header->s.next = NULL;
    if (head == NULL){
        head = header;
    }
    if (tail != NULL){
        tail->s.next = header;
    }
    tail = header;
    return (void*)(header + 1);
}
/*
header_t *get_free_block(size_t size)
{
    header_t *curr = head;
    while(curr) {
        if (curr->s.is_free && curr->s.size >= size)
            return curr;
        curr = curr->s.next;
    }
    return NULL;
}
*/
 
extern "C" int my_free(void *address)
{
    header_t *tmp;
    header_t *curr = (header_t*)address-1;
 
    if (curr < head || curr > tail){
        return -1;
    }
//  header = (header_t*)address - 1;
 
    void* programbreak = brk(0);
    if ((char*)address + curr->s.size == programbreak) {
        if (head == tail) {
            head = tail = NULL;
        } else {
            tmp = head;
            while (tmp != NULL) {
                if(tmp->s.next == tail) {
                    tmp->s.next = NULL;
                    tail = tmp;
                }
                tmp = tmp->s.next;
            }
        }
        brk((void*)((unsigned long int)brk(0) - sizeof(header_t) - curr->s.size));
 
        return 0;
    }
    curr->s.is_free = 1;
    return 0;
}