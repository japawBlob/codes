#include <stdio.h>
#include <stdlib.h>
#include "config.h"

#include <time.h>
/*
 * seqArray()
 *  : (struct elem*) array -- array to modify
 *  : (int) n -- number of elements to modify
 *
 *  This function takes first `n` elements of `array`
 *  and links them together in a sequential order,
 *  i.e.,
 *      array[0].next == array[1]
 *      array[1].next == array[2]
 *      ...
 *      array[n-1].next == array[0]
 */
unsigned long measure(struct elem* array, unsigned jumps){
	struct elem *p = &array[0];
	unsigned long start = clock();
	int counter = 0;
	while (--jumps){
		printf("%i: \t%i\n",counter++, p->index);
		p = p->next;
	}
	unsigned long end = clock();
	return end-start;
}

void seqArray(struct elem* array, int n){
	//unsigned size = 1024, numberOfElements, i;
	//numberOfElements = size/sizeof(struct elem);
	printf("%lu\n", sizeof(struct elem));
	int i;
	for (i=0; i < n - 1; i++) {
	    array[i].next = &array[i+1];
	    array[i].index = i;
	    //array[i].blob = 0;
	}
	array[i].next = &array[0];
	//array[i].blob = 0;
	array[i].index = i;
}

/*
 * ranArray()
 *  : (struct elem*) array -- array to modify
 *  : (int) n -- number of elements to modify
 *
 *  This function takes first `n` elements of `array`
 *  and links them together in a random order,
 *  i.e. (e.g.),
 *      array[0].next == array[5]
 *      array[5].next == array[1]
 *      ...
 *      array[x].next == array[0]
 */
void ranArray(struct elem* array, int n){
	unsigned size = 1024, numberOfElements, i;
	numberOfElements = size/sizeof(struct elem);

	for (i=0; i < numberOfElements - 1; i++) {
	    array[i].next = &array[i];
	    array[i].index = i;
	}
	array[i].next = &array[i];
	array[i].index = i;

	for (i=0; i < numberOfElements; i++) {
	    printf("on index %i, there is: %i\n", i, array[i].index);
	}

	for (int i = numberOfElements-1; i >= 1; i--)
	{
		int j = rand() % i;
		//printf("%i %i\n", i, j);
		void* temp = array[j].next;
		array[j].next = array[i].next;
		array[i].next = temp;
	}
}

/*
 * measureCache()
 *  : (int) mode -- mode of ordering elements in an array
 *                  0 = SEQUENTIAL
 *                  1 = RANDOM
 *  : (int) jumps -- number of pointer "jumps" in the single working
 *                   set measurement
 *
 *  This function makes a measurement of memory access time.
 *  First, it prepares an array (according to selected `mode`).
 *  Then, for every working set size (1 KiB - 4 MiB) it measures
 *  the time of following the links in the array `jumps` times.
 *
 *  The function should print to stdout 'Measurement started'
 *  message. Then, it prints for each measurement the working set
 *  size (in bytes) and the average access time for a single
 *  "jump" (in CPU ticks). At the end the 'Measurement finished'
 *  message is printed.
 *
 *  Example:
 *      Measurement started
 *      1024    22
 *      2048    23
 *      4096    22
 *      Measurement finished
 */
void measureCache(int mode, int jumps){

	if(!(mode == 0 || mode == 1)){
		fprintf(stderr, "wrong mode\n");
		return ;
	}
	struct elem* array = (struct elem*)malloc(sizeof(struct elem)*MAX_ARRAY_LEN);
	if(array == NULL){
		goto free;
	}
	unsigned long size = 2048;
	
	printf("Measurement started\n");
	if(mode == 0){
		while(size/sizeof(struct elem) <= MAX_ARRAY_LEN){
			unsigned numberOfElements = size/sizeof(struct elem);
			seqArray(array, numberOfElements);
			unsigned long time = measure(array,jumps);
			printf("%lu    %lu\n",size, time);
			size*=2;
			break;
		}
	} else {
		while(size/sizeof(struct elem) < MAX_ARRAY_LEN){
			unsigned numberOfElements = size/sizeof(struct elem);
			ranArray(array, numberOfElements);
			unsigned time = measure(array,jumps);
			printf("%lu    %u\n",size, time);
			size*=2;
			break;
		}
	}
	printf("Measurement finished\n");

free:
	free(array);
}

int main(int argc, char const *argv[])
{
	measureCache(1,200);
	return 0;
}