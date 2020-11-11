#include <stdio.h>

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

int uninitialized_var;
int initialized_var = 42;

int main ()
{
    printf("Hello world!\n");

    printf("Variables test: uninitialized_var=%d initialized_var=%d\n",
           uninitialized_var, initialized_var);

    void *b = brk(0);
    printf("current break: %p\n", b);
    brk((void*)(10*0x1000));
    b = brk(0);
    printf("new break: %p\n", b);

    while (1) ;
}
