#include "main.h"

//int startHistSize = 2;
void* func(int* blob);
/*void* func1();*/


int main (int argc, char *argv[]){
    /*pthread_t sideThread;
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
    }*/
    int flags = fcntl(STDIN_FILENO, F_GETFL, 0);
    fcntl(STDIN_FILENO, F_SETFL, flags | O_NONBLOCK);
    char* input;
    int i;
    getchar();
    printf("here\n");
    while(i++ < 100){
        read(STDIN_FILENO, input, 1);
        usleep(100*1000);
        //printf("%c\n",*input);
    } 
    printf("%c\n",*input);


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
