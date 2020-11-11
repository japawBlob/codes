#include <stdio.h>
#include "mem_alloc.cc"


int uninitialized_var;
int initialized_var = 42;

int main (){

    printf("Hello world!\n");

    printf("Variables test: uninitialized_var=%d initialized_var=%d\n",
           uninitialized_var, initialized_var);

    void *b = brk(0);
    printf("current break: %p\n", b);
    brk((void*)(10*0x1000));
    b = brk(0);
    printf("new break: %p\n", b);
    brk((void*)0xFF982);
    b = brk(0);
    printf("new break: %p\n", b);

    while (1) ;
}
