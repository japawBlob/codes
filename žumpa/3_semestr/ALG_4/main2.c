#include <stdio.h>
#include <stdlib.h>

typedef struct Field{
	int ionization, visited, distance;
} field_t;


int main(int argc, char const *argv[])
{
	queue_t* blob = initQueue();
	field_t* temp = newField(1,1,1);
	push(temp, blob);

	pop(blob);

	free(temp);
	freeQueue(blob);

	return 0;
}

field_t* newField(int ionization, int visited, int distance){
	field_t* temp = malloc(sizeof(field_t));
	temp->ionization = ionization;
	temp->visited = visited;
	temp->distance = distance;

	return temp;
}

queue_t* initQueue(){
	queue_t* ret = malloc(sizeof(queue_t));
	ret->head = NULL;
	ret->tail = NULL;

	return ret;
}

void push(field_t* field, queue_t* queue){
	node_t* newNode = malloc(sizeof(node_t));
	newNode->field = field;
	newNode->next = NULL;
	
	if(queue->head == queue->tail && queue->head == NULL){
		queue->head = newNode;
		queue->tail = newNode;
		return ;
	}

	queue->tail->next = newNode;
	queue->tail = newNode;
}

node_t* pop(queue_t* queue){
	if(queue->head==NULL){
		return NULL;
	}
	node_t* ret = queue->head;
	queue->head = queue->head->next;
	if(queue->head == NULL){
		queue->tail = NULL;
	}
	return ret;
}

void freeQueue(queue_t* queue){
	while(queue->head != NULL){
		node_t* temp = queue->head;
		queue->head = temp->next;
		free(temp->field);
		free(temp); 
	}
	free(queue);
}
