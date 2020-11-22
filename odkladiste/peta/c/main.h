#include <stdio.h>
#include <stdlib.h>

#include <termios.h>
#include <fcntl.h>

#include <string.h>
#include <unistd.h>

#include <pthread.h>
#include <semaphore.h>

sem_t semaphore;

void* func(int* blob);

void* func1();

int main (int argc, char *argv[]);