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

node_t head;
node_t *current = &head;
int a;
char *b;
int ret;

void *load(){
	while ((ret = scanf("%d %ms", &a, &b)) == 2) {
   		current->x = a;
   		current->text = b;
   		current->next = malloc(sizeof(node_t));
   		current=current->next;
	}
	return NULL;
}

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
	pthread_t thread_list[numberOfThreads];
	pthread_create(&thread_list[0], NULL, load(), NULL);

	//PRINT ALL NODES
	current = &head;
	node_t *blob;
	while (current->next!=NULL){
		printf("%d %s\n", current->x, current->text);
		blob=current->next;
		//NOT WORKING FREE free(current);
		current=blob;

	}
	//free(current);
	free(b);
	return 0;

}

void takeOneOut(){
	//mutex
	node_t *current = &head;
	//head = current->next;
	//konec mutex

}