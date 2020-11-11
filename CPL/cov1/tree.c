//please for compilation use:
//clang tree.c -o tree


#include <stdio.h>
#include <stdlib.h>

int printStars(int argument);
int main(int argc, char const *argv[])
{
	if(argc < 2){
		fprintf(stderr, "Not enough arguments, please enter valid Integer as argument\n");
		return -1;
	}
	int i = 0;
	while(argv[1][i] != '\0'){
		if (argv[1][i] < 48 || argv[1][i] > 57){
			fprintf(stderr, "Argument is not a valid number, please enter valid Integer as argument\n");
			return -1;
		}
		i++;
	}
	int argument = atoi(argv[1]);
	
	return printStars(argument);
}
int printStars (int argument){
	int numberOfStars = 0;
	for (int i = 0; i < argument; i++){
		for (int j = 0; j < argument-i; j++){
			printf("*");
			numberOfStars++;
		}
		printf("\n");
	}
	return numberOfStars;
}