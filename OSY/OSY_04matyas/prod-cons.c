
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>
#include <unistd.h>


typedef struct list_node
{
	int nr;
	char *abc;
	struct list_node *next;

} node_t;

int retval = 0;
int flag = 0;
node_t *head = NULL;
node_t *tail;
sem_t mutex;
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutex2 = PTHREAD_MUTEX_INITIALIZER;

void delete_list(node_t *head){
	node_t *current = head;
	node_t *next = head;
	while(current){
		next = current->next;
		free(current);
		current = next;
	}
}

void print_list() {
    node_t * current = head;
    printf("PRINITM\n");

    while (current != NULL) {
       printf("%d %s\n", current->nr, current->abc);
        current = current->next;
    }
}

void push_to_list(int x, char* text)
{
    node_t* tmp = malloc(sizeof(node_t));
    if(tmp == NULL)
    {
        exit(0);
    }
    if (head == NULL) {
    	head = tmp;
    	tail = head;
    } else 
    	tail->next = tmp;
    tmp->nr = x;
    tmp->abc = text;
    tmp->next = NULL;

}

node_t *pop_from_list(){
    node_t *retval = NULL;
    node_t * next_node = NULL;

    if (head == NULL) {
        return retval;
    }

    next_node = head->next;
    retval = head;
    head = next_node;
    return retval;

}

void *producent_does(){
	int ret, x;
	char *text;

	while ((ret = scanf("%d %ms", &x, &text)) == 2) {

    	pthread_mutex_lock(&mutex2);
    	push_to_list(x, text);
    	pthread_mutex_unlock(&mutex2);
    	sem_post(&mutex);


	}
	flag = 1;
	for (int i = 0; i < 100; ++i)
	{
		sem_post(&mutex);
	}
	pthread_exit(NULL);
	
}

void *consumer_count(void *arg){
	
	int id = *((int *)arg);
	free(arg);
	while(1){
	sem_wait(&mutex);
	
	pthread_mutex_lock(&mutex1);
	printf("Thread %i:", id);
	pthread_mutex_lock(&mutex2);
	node_t *consume = pop_from_list();

	if (consume == NULL || flag == 1){
		pthread_mutex_unlock(&mutex2);
		pthread_mutex_unlock(&mutex1);
		pthread_exit(NULL);
	}

	pthread_mutex_unlock(&mutex2);
	for (int i = 0; i < consume->nr; ++i){
			printf(" %s", consume->abc);
		}
	printf("\n");
	free(consume->abc);
	free(consume);

	pthread_mutex_unlock(&mutex1);
	if (flag == 1)
	{

		pthread_exit(NULL);
	}
	
	}
pthread_exit(NULL);
}


int main(int argc, char *argv[])
{
	int maxcores = 1;
	if(argv[1] != NULL){
		if (atoi(argv[1]) > sysconf(_SC_NPROCESSORS_ONLN) || atoi(argv[1]) < 1)
		{
			return 1;
		}
		maxcores = atoi(argv[1]);
	}
	pthread_t producent;
	sem_init(&mutex, 0, 0);
	/*node_t * head = malloc(sizeof(node_t));

		if (head == NULL) {
			retval = 1;
		}
	tail = head;*/
	int err = pthread_create(&producent, NULL, producent_does, NULL);
	pthread_t* consumer_group = malloc(sizeof(pthread_t) * maxcores);

	for (int i = 0; i < maxcores; ++i)
	{
		int *index = malloc (sizeof(*index));
		*index = i+1;
		 pthread_create(&consumer_group[i], NULL, consumer_count, index);
	}
	pthread_join(producent, NULL);
	for (int i = 0; i < maxcores; ++i)
	{
		pthread_join(consumer_group[i], NULL);
	}
	free(consumer_group);
	sem_destroy(&mutex);
	pthread_mutex_destroy(&mutex1);
	pthread_mutex_destroy(&mutex2);
	if (err != 0 || retval != 0){
		return 1;
	}else{
		return 0;
	}
	
}