#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[])
{
	char* s1 = "blob";
	char* s2 = "blob123";

	printf("ret of strcmp: %i\n", strcmp(s1,s2));
	printf("ret of strncmp: %i\n", strncmp(s1,s2,strlen(s1)));

	FILE *morseSource = fopen("blob.txt", "r");

	for (int i = 0; i < 7; ++i)
	{
		fgetc(morseSource);
	}
	float f;
	fscanf(morseSource,"%f", &f);

	printf("%f\n", f);


  	return 0;
}