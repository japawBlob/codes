#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

const char* blob[] = {"== program menu ==",
			"Item 1: Control LED",
			"Item 2: Read button state",
			"Item 3: Read joystick",
			"Item 4: Control display",
			"Item c: Enter a custom command",
			"Item e: Exit",
			"Selection:"};

char* printMenu(char* input);
void flushStdin ();
int echo ();

int main(int argc, char const *argv[]){
	if (argc < 2){
		fprintf(stderr, "This program needs at least one argument in order to run.\n");
		return -1;
	}
	printf("Welcome! The input parameter is \"%s\"\n", argv[1]);
	//printf("sizeof menu:%lu\n sizeof char*:%lu\n", sizeof(blob), sizeof(char*));
	printMenu(0);

	char in [10];

	while(1){
		scanf("%10s", in);
		if (in[1] != '\0'){
			fprintf(stderr, "Wrong option\n");
			flushStdin();
			continue;
		}
		switch(in[0]){
			case '1':
				printMenu(in);
				break;
			case '2':
				printMenu(in);
				break;
			case '3':
				printMenu(in);
				break;
			case '4':
				printMenu(in);
				break;
			case 'c':
				if(echo() == 1){
					return -1;
				}
				break;
			case 'e':
				goto exitWhile;
				break;
			default :
				fprintf(stderr, "Wrong option\n");
		}

	}
	exitWhile:
	return 1;
}

char* printMenu(char* input){
	int size = (sizeof(blob)/sizeof(char*));
	//printf("%i\n", size);
	for (int i = 0; i < size; ++i){
		printf("%s\n", blob[i]);
	}
	return input;
}

int echo (){
	int defaultSize = 10;
	char* in = malloc(sizeof(char)*defaultSize);
	int i = 0;
	char ch;
	void *p;
	getchar();
	printf("Enter commnad: ");
	while(EOF!=(ch=fgetc(stdin)) && ch != '\n'){
		in[i++] = ch;
		if(i == defaultSize){
			p = realloc(in, sizeof(char)*(defaultSize*2));
			if(!p) return 1;
			in = p;
			defaultSize*=2;
		}
	}
	in[i] = '\0';
	printf("The command  is \"%s\"\n", in);
	free(in);
	return 0;
}

void flushStdin (){
	char ch;
	while(EOF!=(ch=fgetc(stdin)) && ch != '\n'){
	}
}
