#include <stdio.h>

int main(){
	char string [50];

	int blob = 12556;
	int druhyBlob = 52125;

	sprintf(string, "AHOJ %i BORCE %i",druhyBlob, blob);

	printf("%s\n", string);

	int binar = 1;
	unsigned int dva = binar<<31;

	printf("%i %u", binar, dva);

	return 0;
}