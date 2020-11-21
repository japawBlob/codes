#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
#include <signal.h>


sem_t semaphore;

void* func(int* blob);

void* func1();

int main (int argc, char *argv[]);