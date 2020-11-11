#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

int main(int argc, char const *argv[])
{
	printf("hey");
	pthread_exit();
	printf("hey");
	return 0;


	//semafor
	semaphore s;
}