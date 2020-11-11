#include "stdio.h"
#include <stdlib.h>
#include <time.h>
void printArray(int array[]){
	for (int i = 0; i < 10; ++i)
	{
		printf("%i ", array[i]);
	}
	printf("\n");
}
int n = 10;

int main(int argc, char const *argv[])
{
	time_t t;
	srand((unsigned) time(&t));
	int array[10];
	for (int i=0; i < 10; i++) {
	    array[i] = i;
	}
	printf("array1\n");
	printArray(array);

	
	int array2[10];
	for (int i = 0; i < 10-1; i++)
	{
		array2[i] = rand()%10;
	}
	array2[9] = rand()%10;

	//printArray(array2);
	//(rand() % (upper - lower + 1)) + lower; 
/*	for (int i = 0; i < n-1; i++)
	{
		int j = (rand() % ((n-1) - (i+1) + 1)) + (i+1); 
		printf("%i %i\n", i, j);
		int temp = array[j];
		array[j] = array[i];
		array[i] = temp;
	}
	printf("argac\n");
	printArray(array);
	*/
	for (int i = n-1; i >= 1; i--)
	{
		int j = rand() % i;
		printf("%i %i\n", i, j);
		int temp = array[j];
		array[j] = array[i];
		array[i] = temp;
	}
	printf("argac\n");
	printArray(array);

	int i = 2*n;
	int blob = 0;
	printf("0 -> ");
	while(i>0){
		printf("%i -> ",array[blob]);
		blob = array[blob];
		i--;
	}
	printf("\n");
/*
	int array3[10];
	for (int i = 10-1; i>=2; i--)
	{	
		int j = rand()%(i);
		printf("%i ", j);
		array3[i] = j+1;
		array3[j] = i+1;
	}
	printf("\n");
	//array3[9] = rand()%10;
	
	printArray(array3);
*/
	return 0;
}