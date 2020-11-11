#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <string.h>
#include <semaphore.h>
 
typedef struct node {
    int x;
    char *text;
    struct node * next;
} node_t;

node_t *head;
node_t *tail;
pthread_mutex_t list_lock;
pthread_mutex_t print_lock;
sem_t sem;
int error = 0;

void *load() {
    int x, ret;
    char *text;
    if ((ret = scanf("%d %ms", &x, &text)) == 2) {
        
        if(x < 0){
            free(text);
            error = 1;
            return NULL;
        }

        head = malloc(sizeof(node_t));
        head->x = x;
        fprintf(stderr, "value %d\n", head->x);
        head->text = text;
        pthread_mutex_lock(&list_lock);
        head->next = tail;
        tail = head;
        fprintf(stderr,"head NOW %i\n", head->x);
	    fprintf(stderr,"tail NOW %i\n", tail->x);

        pthread_mutex_unlock(&list_lock);
        //sem_post(&sem);
    }
    /*if(ret != EOF){
        error = 1;
    }*/
    //sem_post(&sem);

    while ((ret = scanf("%d %ms", &x, &text)) == 2) {
        
        if(x < 0){
            free(text);
            error = 1;
            break;
        }

        node_t *temp = malloc(sizeof(node_t));
        temp->x = x;
        fprintf(stderr, "value %d\n", temp->x);
        temp->text = text;
        temp->next = NULL;
        pthread_mutex_lock(&list_lock);
        tail->next = temp;
        tail = temp;
        //fprintf(stderr,"head NOW %i\n", head->x);
	    fprintf(stderr,"tail NOW %i\n", tail->x);

        pthread_mutex_unlock(&list_lock);
        sem_post(&sem);
    }
    if(ret != EOF){
        error = 1;
    }
    sem_post(&sem);
    sem_post(&sem);
    fprintf(stderr, "prod ending\n");

    return NULL;
	
}
 
void *pop(void *index){
    int thr_num = *((int *) index);
    free(index);

    node_t *temp;

    while(1){
        sem_wait(&sem);
        pthread_mutex_lock(&list_lock);
        if (head == NULL){
            break;
        }
        temp = head;
        
        head = temp->next;

        pthread_mutex_lock(&print_lock);
        pthread_mutex_unlock(&list_lock);

        printf("Thread %d:", thr_num);
                 
        for (int i = 0; i < temp->x; ++i){
            printf(" %s", temp->text);
        }
        printf("\n");
        pthread_mutex_unlock(&print_lock);
        
        free(temp->text);
        free(temp);
    }

    pthread_mutex_unlock(&list_lock);
    sem_post(&sem);
    fprintf(stderr, "cons ending\n");
        
    return NULL;
}


int main(int argc, char const *argv[]){
    pthread_t prod;
    pthread_t *cons;
    int N;

    //get number of wanted threads
    if(argv[1] == NULL){
        N = 1;
    }
    else if(atoi(argv[1]) >= 1 && atoi(argv[1]) <= sysconf(_SC_NPROCESSORS_ONLN)){
        N = atoi(argv[1]);
        fprintf(stderr, "%d\n",N );
    } else {
        fprintf(stderr, "it borked\n" );
        return 1;
    }

    //make a list for threads
    cons = malloc(N*sizeof(pthread_t));
     
    //initialize semaphor nad mutexes
    sem_init(&sem, 0, 0); 
    pthread_mutex_init(&list_lock, NULL);
    pthread_mutex_init(&print_lock, NULL);
 
    //make threads
    pthread_create(&prod, NULL, load, NULL);
    
    //make consuments and give them their indexes
    /*node_t* blob = head;
	while(blob != NULL){
		printf("NODE %i ", blob->x);
		blob = blob->next;
	}
	printf("\n");

*/

    for(int blob = 1; blob <= N; blob++){
        int *index = malloc(sizeof(*index));
        *index = blob;
        pthread_create(&cons[blob-1], NULL, pop, index);
    }
     
    //end threads
	pthread_join(prod, NULL);
    for(int blob = 0; blob < N; blob++){
        pthread_join(cons[blob], NULL);
    }

    //free list of threads
    
    free(cons);
 
    //end sem and mutexes
    sem_destroy(&sem); 
    pthread_mutex_destroy(&list_lock);
    pthread_mutex_destroy(&print_lock);
    

    if(error == 1){
        fprintf(stderr, "ERROR\n");
        return 1;
    } else {
        fprintf(stderr, "OK\n");
        return 0;
    }
}