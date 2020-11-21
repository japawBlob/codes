#include "main.h"

//int startHistSize = 2;
void* func(int* blob);
/*void* func1();*/


int main (int argc, char *argv[]){
    pthread_t sideThread;
    sem_init(&semaphore, 0, 0);
    pthread_create(&sideThread, NULL, func1, NULL);
    int counter = 500;
    int i = 69;
    printf("here1\n");
    while(1){
        printf("here2\n");
        if(sem_trywait(&semaphore) == 0){
            printf("blob: %i\n", i);
        }
        usleep(100*1000);
        
        if(counter-- < 0){
            break;
        }
    }
    return 0;
}
/*void* func1(){
    printf("here3\n");
    while(1){
        sleep(1);
        sem_post(&semaphore);
    }
    return NULL;
}*/

void* func(int* blob){
    *blob = *blob+5;
    return NULL;
}
