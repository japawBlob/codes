#include "main.h"

void* func1(){
    printf("here3\n");
    while(1){
        sleep(1);
        sem_post(&semaphore);
    }
    return NULL;
}