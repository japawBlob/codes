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
		if(c == '1'){
			sem_post(&ledON);
		}
		if(c == '0'){
			sem_post(&ledOFF);
		}
	    morseString[size++] = c;
	    usleep(500*1000);
	}
	for(int i=0; i<size; i++){
	    printf("%c", morseString[i]);
	} printf("\n");


	fclose(morseSource);
	free(morseString);
exit:
	//free(path);
	sem_post(&morseEnded);
	
	return NULL;
}
void* inputHandle(void* m_input){
	call_termios(0);
	m_input = (char*)m_input;
	while(1){
		printf("inputHandle1\n");
	    g_input = getchar();
	    printf("inputHandle2\n");
	    sem_post(&inputFlag);
	    switch (g_input) {
	        case 'm':
	        {
	        	call_termios(1);
	        	scanf("%s", message);
	        	getchar();
	        	sem_post(&inputFlag);
	        	call_termios(0);
	        	break;
	        }
	        case 'c':
	        {
	        	call_termios(1);
	        	scanf("%s", message);
	        	getchar();
	        	sem_post(&inputFlag);
	        	call_termios(0);
	          	break;
	        }
	        case 'e':
	        {
	        	//sem_post(&terminateThreads);
	        	goto exit;
	          	break;
	        }
	        default:
	        {
	          	break;
	        }
	    }
	}
	
exit:
	call_termios(1);
	return NULL;
}