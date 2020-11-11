#include <stdio.h>

int main(int argc, char *argv[]){
	

	char opt[] = "--color=always"; 
       
    char c;
    int color = 0;
	if(argc > 1){
		for(int i = 0; i>-1; i++){
			if(opt[i] != argv[1][i]){
				break;
			}
			if(opt[i] == '\0' && argv[1][i] == '\0'){
				color = 1;
				break;
			}
		}
	}
	

	printf("Argv[1] = %s\n", argv[1]);

	//printf(ESC[01;31m + ESC[K);
	if(color == 1){
		printf("\033[1;31m");
	}

	printf("Hello\n");

	if(color == 1){
		printf("\033[0m");
	}

	printf("Hello\n");

	return 0;
}
