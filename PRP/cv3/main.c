#include <stdio.h>

int main()
{
	int i = 12;
	
	if (i == 10) {
		printf("i=10\n");
	} else {
		if (i % 3 == 0) {
			printf("i %% 3 = 0\n");
		}
	}
	return 0;
}
