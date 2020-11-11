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
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutex2 = PTHREAD_MUTEX_INITIALIZER;
sem_t semaphore;

node_t *head;
node_t *current;
int end = 0;
int didILoadSomething=0;
int retu = 0;

int main(int argc, char const *argv[])
{

	int numberOfThreads = 1;

	if(argc > 1){
		numberOfThreads = atoi(argv[1]);
		if(numberOfThreads <= 0){
			fprintf(stderr, "ERROR i need integer as a valid argument\n");
			return 1;
		}
		long availableThreads = sysconf(_SC_NPROCESSORS_CONF);
		if(numberOfThreads > availableThreads){
			fprintf(stderr, "This PC has only %li threads available\n", availableThreads);
			return 1;
		}
	}
	sem_init(&semaphore, 0, 0);
	//head=malloc(sizeof(node_t));
	//current=head;
	pthread_t producent;
	pthread_create(&producent, NULL, load, NULL);
	pthread_t consumers [numberOfThreads];
	for (int i = 0; i < numberOfThreads; ++i)
	{
		int *arg = malloc(sizeof(*arg));
		*arg=(i+1);
		pthread_create(&consumers[i], NULL, consume, arg);
	}
	
	pthread_join(producent, NULL);
	for (int i = 0; i < numberOfThreads; ++i)
	{
		sem_post(&semaphore);
	}
	//end = 1;
	for (int i = 0; i < numberOfThreads; ++i)
	{
		pthread_join(consumers[i], NULL);
		//pthread_kill(consumers[i],0);
	}
	

	
	/*node_t *temp;
	current=head;
	//printf("%i\n", head->x);
	while((current)!=NULL){
		temp=current;
		printf("%d %s\n", current->x, current->text);
		current=current->next;
		free(temp->text);
		free(temp);
	}*/

	return retu;
}

void *load(){
	//printf("ahoj\n");
	
	int ret, x;
	char *text;
	node_t *prev;
	if ((ret = scanf("%d %ms", &x, &text)) == 2) {
		if(x<1){
			retu=1;
			x=1;
		}
		head=malloc(sizeof(node_t));
		current=head;
	    current->x=x;
	    current->text=text;
	    current->next=malloc(sizeof(node_t));
	    prev=current;
	    current=current->next;
	    sem_post(&semaphore);
	    didILoadSomething=1;
	    //free(text);
	}

	while ((ret = scanf("%d %ms", &x, &text)) == 2) {
		if(x<1){
			retu=1;
			x=1;
		}
	    current->x=x;
	    current->text=text;
	    current->next=malloc(sizeof(node_t));
	    prev=current;
	    current=current->next;
	    sem_post(&semaphore);
	    didILoadSomething=1;
	    //free(text);
	}

	if(didILoadSomething==1){
		prev->next=NULL;
		free(current);
	}

	return NULL;
}

void *consume(void *i){
	int threadNO = *((int *) i);
	fprintf(stderr,"Thread %i entered consume\n", threadNO);
	
	while(head!=NULL){
		sem_wait(&semaphore);
		pthread_mutex_lock( &mutex1 );
		if(head==NULL){
			pthread_mutex_unlock( &mutex1 );
			break;
		}
		node_t *temp = head;
		fprintf(stderr,"Thread %i siezed node %i\n", threadNO, temp->x);
		//node_t *temp = head;
		if(head!=NULL){
			head=head->next;
		} else {

			//free(temp->text);
			//free(temp);
			pthread_mutex_unlock( &mutex1 );
			break;
		}
		pthread_mutex_unlock( &mutex1 );
		
		pthread_mutex_lock( &mutex2 );
		printf("Thread %i:",threadNO);

		for (int i = 0; i < temp->x; ++i){
			printf(" %s", temp->text);
		}
		printf("\n");
		//fflush(stdout);
		pthread_mutex_unlock( &mutex2 );
		//printf("Thread %i:%i %s\n",threadNO, temp->x, temp->text);
		
		free(temp->text);
		free(temp);
		//FREE????????????????????????????????????????
	}
	free(i);
	return NULL;
}