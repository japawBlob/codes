#include <string.h>
#include <stdio.h>
#include <unistd.h>

#include <pthread.h>

void* func (void* blob){
	sleep(1);
	printf("ahoj\n");
	sleep(1);
	return NULL;
}

int main(){
	char blob [30]= "JOY_RIGHT\n\r";
	char* ehm = strstr(blob,"\n");
	*ehm = '8';
	char c[100];

	pthread_t thread;
	pthread_create(&thread, NULL, func(NULL), NULL); 

while(1){
	scanf("%s", c);

	printf("here\n");
}	/*int* pole = malloc(sizeof(int)*20);*/
	//sizeof(pole);
	
	//int* pole2 = *(pole+10);
    return 0;
}
