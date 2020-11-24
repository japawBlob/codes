#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[])
{
	char* path = "blob.txt";
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
	//printf("%lu\n", strlen("sig_on="));
	while((c = fgetc(morseSource))){

		if(c == EOF){
			break;
		}
		if(c == '#'/* && size == 0*/){
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
				
			}
			if(size > strlen("sig_on=")){
				if(strncmp(morseString,"sig_on=", strlen("sig_on=")) == 0){
					//fscanf(morseSource, "%f", &sig_on);
					sig_on = atof(morseString+strlen("sig_on="));
				}
				if(strncmp(morseString,"sigoff=", strlen("sigoff=")) == 0){
					sig_off = atof(morseString+strlen("sigoff="));
				}
			}
			size = 0;
			//printf("%s\n", morseString);
		} else {
			morseString[size++] = c;
		}
		// if(strncmp(morseString,"sig_on=", strlen("sig_on=")) == 0){
		// 	//fscanf(morseSource, "%f", &sig_on);
		// 	sig_on = atof(morseString+strlen("sig_on="));
		// }
		// if(strncmp(morseString,"sigoff=", strlen("sigoff=")) == 0){
		// 	sig_off = atof(morseString+strlen("sigoff="));
		// }
		
	}
	//printf("sig_on=%f, sig_off=%f\n", sig_on, sig_off);
	//printf("%s\n", morseString);


	fclose(morseSource);
	free(morseString);
exit:

  	return 0;
}