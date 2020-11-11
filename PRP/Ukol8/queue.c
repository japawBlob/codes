#include "queue.h"

// TODO - your code

queue_t* create_queue(int capacity){
	queue_t* queue;
	queue = (queue_t*)malloc(sizeof(queue_t));
	queue->capacity = capacity;
	queue->counter = 0;
	queue->head = -1;
	queue->tail = -1;
	queue->array = (void**)malloc(capacity*sizeof(void*));
	return queue;
}

#define COUNTER queue->counter
#define CAPACITY queue->capacity
#define HEAD queue->head
#define TAIL queue->tail
#define ARRAY queue->array

void delete_queue(queue_t *queue){
	free(ARRAY);
	free(queue);
}

bool push_to_queue(queue_t *queue, void *data){
	if(TAIL+1 == CAPACITY){
		TAIL = -1;
	}
	if(HEAD == - 1){
		ARRAY[++TAIL] = data;
		COUNTER++;
		HEAD++;
	} else {
		ARRAY[++TAIL] = data;
		COUNTER++;
	}
	return true;
}

void* pop_from_queue(queue_t *queue){
	if(HEAD == CAPACITY){
		HEAD = 0;
	}
	if(COUNTER == 0){
		return NULL; 
	} else {
		void* data = ARRAY[HEAD];
		ARRAY[HEAD] = NULL;
		HEAD++;
		COUNTER--;
		return data;
	}
}

void* get_from_queue(queue_t *queue, int idx){
	if(idx >= COUNTER || idx<0){
		return NULL;
	} else {
		idx = idx + HEAD;
		if(idx >= CAPACITY){
			idx = idx - CAPACITY;
		}
		return ARRAY[idx];
	}
}

int get_queue_size(queue_t *queue){
	return COUNTER;
}







