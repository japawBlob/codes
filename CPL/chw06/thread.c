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
	float sig_on = 0;
	float sig_off = 0;
	/*while((c = fgetc(morseSource)) != EOF){
		printf("%c\n", c);
	}*/

	while((c = fgetc(morseSource)) != EOF){
		size = 0;
		if(c == '#'){
			while(1){
				c = fgetc(morseSource);
				if(c == '\n' || c == EOF){
					break;
				}
			}
			continue;
		}
		/*while(c != '\n' && c != EOF && size <7){
			morseString[size++] = c;
			c = fgetc(morseSource);
			if(strcmp(morseString,"sig_on=") == 0){
				fscanf(morseSource, "%f", &sig_on);
			}
			if(strcmp(morseString,"sigoff=") == 0){
				fscanf(morseSource, "%f", &sig_off);
			}
			printf("%s\n", morseString);
		}*/
		/*printf("1size:%i \tis: %c\n", size, c);
		morseString[size] = c;
		size++;*/

		while(c != '\n' && c != EOF){
			morseString[size] = c;
			c = fgetc(morseSource);
			printf("2size:%i \tis: %c\n", size, c);
			size++;
		}
		//printf("morseString: \"%s\n\"\t%s\n", morseString, "sig_on");
		//printf("%s\n", "sig_on");
		//printf("&(morseString+6): %s\n", morseString+strlen("sig_on"));
		//printf("%i\n", strncmp(morseString,"sig_on=", strlen("sig_on=")));
		if(strncmp(morseString,"sig_on=", strlen("sig_on=")) == 0){
			//fscanf(morseSource, "%f", &sig_on);
			sig_on = atof(morseString+strlen("sig_on="));
		}
		if(strncmp(morseString,"sigoff=", strlen("sigoff=")) == 0){
			sig_off = atof(morseString+strlen("sigoff="));
		}
	}

	/*for(int i=0; i<strlen(morseString); i++){
	    printf("%c", morseString[i]);
	} printf("\n");*/
	printf("sig_on=%f, sig_off=%f\n", sig_on, sig_off);
	printf("%s\n", morseString);


	fclose(morseSource);
	free(morseString);
exit:
	//free(path);
	sem_post(&morseEnded);
	
	return NULL;
}

void executeMorse(){

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