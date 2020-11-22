#include "chw06.h"

void* loadMorse(void* path){
	printf("%s\n", (char*)path);
	printf("strlen: %lu\n", strlen(path));

	FILE *morseSource = fopen(path, "r");
	if(morseSource == NULL){

		printf("\"%s\" is not a valid file path\nplease enter valid file path\n", path);
		goto exit;
	}
	char* morseString = (char*)malloc(sizeof(char)*255);
	int size = 0;
	char c;
	while((c = fgetc(morseSource)) != '\n'){
		if(c == '#'){

		}
	    morseString[size++] = c;
	}
	for(int i=0; i<size; i++){
	    printf("%c ", morseString[i]);
	} printf("\n");


	fclose(morseSource);
	free(morseString);
exit:
	sleep(10);
	free(path);
	sem_post(&morseEnded);
	
	return NULL;
}
void* inputHandle(void* m_input){
	m_input = (char*)m_input;
	while(1){
	    g_input = getchar();
	    sem_post(&inputFlag);
	}
	

	return NULL;
}