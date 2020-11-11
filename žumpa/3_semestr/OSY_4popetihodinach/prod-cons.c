//#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>



typedef struct node
{
	int x;
	char *text;
	struct node *next;
} node_t;

void *load();
void *consume();
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;

node_t *head;
node_t *current;

int main(int argc, char const *argv[])
{

	int numberOfThreads = 1;

	if(argc > 1){
		numberOfThreads = atoi(argv[1]);
		if(numberOfThreads == 0){
			fprintf(stderr, "ERROR i need integer as a valid argument\n");
			return 1;
		}
		long availableThreads = sysconf(_SC_NPROCESSORS_CONF);
		if(numberOfThreads > availableThreads){
			fprintf(stderr, "This PC has only %li threads available\n", availableThreads);
			return 1;
		}
	}
	
	head=malloc(sizeof(node_t));
	current=head;
	pthread_t producent;
	pthread_create(&producent, NULL, load, NULL);
	pthread_join(producent, NULL);
	pthread_t consumers [numberOfThreads];
	for (int i = 0; i < numberOfThreads; ++i)
	{
		int *arg = malloc(sizeof(*arg));
		*arg=i;
		pthread_create(&consumers[i], NULL, consume, arg);
	}
	
	
	for (int i = 0; i < numberOfThreads; ++i)
	{
		pthread_join(consumers[i], NULL);
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

	return 0;
}

void *load(){
	//printf("ahoj\n");
	int ret, x;
	char *text;
	node_t *prev;
	while ((ret = scanf("%d %ms", &x, &text)) == 2) {
	    current->x=x;
	    current->text=text;
	    current->next=malloc(sizeof(node_t));
	    prev=current;
	    current=current->next;

	    //free(text);
	}
	free(current);
	prev->next=NULL;

	return NULL;
}

void *consume(void *i){
	int threadNO = *((int *) i);
	pthread_mutex_lock( &mutex1 );
	while(head!=NULL){
		node_t *temp = head;
		head=head->next;
		printf("Thread %i:%i %s\n",threadNO, temp->x, temp->text);
		pthread_mutex_unlock( &mutex1 );
		free(temp->text);
		free(temp);
		//FREE????????????????????????????????????????
	}
	free(i);
	return NULL;
}