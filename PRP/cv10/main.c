#include <stdio.h>
#include <stdlib.h>

typedef struct Queue{
	int start;
	int end;
	unsigned int capacity;
	int* pole;
} queue_t;

void push(queue_t*, int); //prida prvek do fronty
int pop(queue_t*);
queue_t* new_queue(unsigned int);

void free_queue(queue_t*);

void prt_queue(queue_t*);


int main(){
	
	//queue_t q = {5,4,NULL};
	queue_t* pq = new_queue(10);
	printf("start: %i\n",(*pq).start);
	printf("start: %i\n",pq->start);
	
	push(pq, 5);
	push(pq, 6);
	push(pq, 7);
	push(pq, 8);
	push(pq, 9);
	push(pq, 10);
	
	printf("%i == 5\n", pop(pq));
	printf("%i == 6\n", pop(pq));
	printf("%i == 7\n", pop(pq));
	printf("%i == 8\n", pop(pq));
	printf("%i == 9\n", pop(pq));
	printf("%i == 10\n", pop(pq));
	
	return 0;
}


queue_t* new_queue(unsigned int capacity){
	int* pole = (int*)malloc(capacity*sizeof(int));
	queue_t* q = (queue_t*)malloc(sizeof(queue_t));
	q->start = 0;
	q->end = 0;
	q->pole = pole;
	return q;
}

void push(queue_t* q , int element){
	q->pole[q->end] = element;
	++q->end;
}

int pop(queue_t* q){
	int result = q->pole[q->start];
	
	++q->start;
	return result;
}


