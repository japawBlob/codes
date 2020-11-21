#include "chw06.h"

void* loadMorse(void* path){
	printf("%s\n", (char*)path);

	FILE *morseSource = fopen(path, "r");
	if(morseSource == NULL){
		printf("\"%s\" is not a valid file path\nplease enter valid file path\n", path);
		return NULL;
	}
	char* morseString = (char*)malloc(sizeof(char)*255);
	int size = 0;
	char c;
	while((c = fgetc(morseSource)) != '\n'){
	    morseString[size++] = c;
	}
	for(int i=0; i<size; i++){
	    printf("%c ", morseString[i]);
	} printf("\n");
	free(morseString);
	fclose(morseSource);
	return NULL;
}