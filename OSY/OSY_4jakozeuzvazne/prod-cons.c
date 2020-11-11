//#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
#include <signal.h>



typedef struct node
{
	int x;
	char *text;
	struct node *next;
} node_t;

void *load();
void *consume();
pthread_mutex_t mutex1;
pthread_mutex_t mutex2;
sem_t semaphore;

node_t *head;
//node_t *current;
node_t *tail;
//int end = 0;
//int didILoadSomething=0;
int retu = 0;

int main(int argc, char const *argv[])
{

	//Decide how many threads will this program use.
	int numberOfThreads = 1;
	if(argc > 1){
		numberOfThreads = atoi(argv[1]);
		if(numberOfThreads <= 0){
			fprintf(stderr, "ERROR i need positive integer as a valid argument\n");
			return 1;
		}
		long availableThreads = sysconf(_SC_NPROCESSORS_ONLN);
		if(numberOfThreads > availableThreads){
			fprintf(stderr, "This PC has only %li threads available\n", availableThreads);
			return 1;
		}
	}

	//Initialize mutexes
	sem_init(&semaphore, 0, 0);
	pthread_mutex_init(&mutex1, NULL);
    pthread_mutex_init(&mutex2, NULL);
	
    //create threads
	pthread_t producent;
	pthread_t consumers [numberOfThreads];

	//start loading and consuming
	pthread_create(&producent, NULL, load, NULL);
	for (int i = 0; i < numberOfThreads; ++i){
		int *arg = malloc(sizeof(*arg));
		*arg=(i+1);
		pthread_create(&consumers[i], NULL, consume, arg);
	}
	
	//end the threads
	pthread_join(producent, NULL);
	for (int i = 0; i < numberOfThreads; ++i)
	{
		pthread_join(consumers[i], NULL);
	}
	
	//destroy mutexes
	sem_destroy(&semaphore); 
    pthread_mutex_destroy(&mutex1);
    pthread_mutex_destroy(&mutex2);

	return retu;
}

void *load(){
	int ret, x;
	char *text;
	fprintf(stderr, "Entered loading phase\n");
	if ((ret = scanf("%d %ms", &x, &text)) == 2) {
		//printf("HUJ\n");
		if(x<0){
			retu=1;
			free(text);
			goto end;
			//x=1;
		}
		head = malloc(sizeof(node_t));
	    head->x=x;
	    head->text=text;
	    //head->next=NULL;
	    pthread_mutex_lock(&mutex1);
	    //fprintf(stderr,"Loader added node %i\n", current->x);
		//fprintf(stderr,"STORED IN HEAD %i\n", head->x);
		head->next =  tail;
		tail = head;
	    //tail=current;
	    pthread_mutex_unlock(&mutex1);
	    //sem_post(&semaphore);
	    //free(text);
	}
	fprintf(stderr, "Headed loaded\n");
	//current = head->next;
	while ((ret = scanf("%d %ms", &x, &text)) == 2) {
		//printf("HUJ\n");
		if(x<0){
			retu=1;
			free(text);
			break;
			//x=1;
		}
		node_t *current = malloc(sizeof(node_t));
	    current->x=x;
	    current->text=text;
	    current->next=NULL;
	    pthread_mutex_lock(&mutex1);
	    fprintf(stderr,"Loader added node %i\n", current->x);
	    //head = current;
		//fprintf(stderr,"STORED IN HEAD %i\n", head->x);
		tail->next = current;
		tail=current;
	    pthread_mutex_unlock(&mutex1);
	    sem_post(&semaphore);
	    //free(text);
	}
	fprintf(stderr, "Loading ended, retu = %i\n", retu);
	//fprintf(stderr,"STORED IN HEAD->next %i\n", head->next->x);
	if (ret != EOF){
		retu = 1;
	}
	sem_post(&semaphore);
	end:
	sem_post(&semaphore);

	return NULL;
}

void *consume(void *i){
	int threadNO = *((int *) i);
	fprintf(stderr,"Thread %i entered consume\n", threadNO);
	
	node_t *temp;
	while(1){
		sem_wait(&semaphore);
		pthread_mutex_lock( &mutex1 );
		if(head==NULL){
			break;
		}
		temp = head;
		fprintf(stderr,"Thread %i siezed node %i\n", threadNO, temp->x);
		
		head=temp->next;

		pthread_mutex_lock( &mutex2 );
		pthread_mutex_unlock( &mutex1 );
		
		printf("Thread %i:",threadNO);

		for (int i = 0; i < temp->x; ++i){
			printf(" %s", temp->text);
		}
		printf("\n");
		//fflush(stdout);
		
		//jump:
		pthread_mutex_unlock( &mutex2 );
		//printf("Thread %i:%i %s\n",threadNO, temp->x, temp->text);
		
		free(temp->text);
		free(temp);
		//FREE????????????????????????????????????????
	}

	pthread_mutex_unlock( &mutex1 );
	sem_post(&semaphore);
	free(i);
	return NULL;
}