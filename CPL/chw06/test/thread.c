#include "chw06.h"

void* loadMorse(void* path){

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

	while((c = fgetc(morseSource))){
		if(c == EOF){
			break;
		}
		if(c == '#'){
		 	while(1){
		 		c = fgetc(morseSource);
		 		if(c == '\n' || c == EOF){
		 			break;
		 		}
		 	}
		 	continue;
		}
		if(c == '\r'){
			continue;
		}
		if(c == EOF){
			break;
		}
		if(c == '\n'){
			if(size > 1){
				morseString[size] = '\0';
				size = 0;
			}
			if(strncmp(morseString,"sig_on=", strlen("sig_on=")) == 0){
				sig_on = atof(morseString+strlen("sig_on="));
			}
			if(strncmp(morseString,"sigoff=", strlen("sigoff=")) == 0){
				sig_off = atof(morseString+strlen("sigoff="));
			}
		} else {
			morseString[size++] = c;
		}
		
	}
	//("sig_on=%f, sig_off=%f\n", sig_on, sig_off);
	executeMorse(morseString, sig_on, sig_off);

	fclose(morseSource);
	free(morseString);
exit:
	sem_post(&morseEnded);
	
	return NULL;
}

void executeMorse(char* morseString, float sig_on, float sig_off){
	int i = 0;
	int onTime = 2*(100000*sig_on);
	int offTime = 2*(100000*sig_off);
	//printf("sig_on=%i, sig_off=%i\n", onTime, offTime);
	while(morseString[i]!='\0'){

		switch (morseString[i]) {
		    case '1':
		    {
		    	sem_post(&ledON);
		    	usleep(3*onTime);
		    	sem_post(&ledOFF);
		    	if(morseString[i+1] != '\0'){
		    		usleep(offTime);
		    	}
		      	break;
		    }
		      
		    case '0':
		    {
		    	sem_post(&ledON);
		    	usleep(onTime);
		    	sem_post(&ledOFF);
		    	if(morseString[i+1] != '\0'){
		    		usleep(offTime);
		    	}
				break;
		    }
		      
	      	case ' ':
	      	{
	      		usleep(3*offTime);
	      		break;
	      	}
	      	default:
	      	{
	      	  	printf("unsupported character: \'%c\'\n", morseString[i]);
	      		break;
	      	}
		}
		if(sem_trywait(&terminateMorse) != -1){
			goto exit;
		}
		i++;
	}
exit:
	return ;
}

void* inputHandle(void* m_input){
	call_termios(0);
	m_input = (char*)m_input;
	while(1){
	    g_input = getchar();
	    sem_post(&inputFlag);
	    switch (g_input) {
	        case 'm':
	        {
	        	if(morseActive == 0){
		        	call_termios(1);
		        	scanf("%s", message);
		        	getchar();
		        	sem_post(&inputFlag);
		        	call_termios(0);
	        	}
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