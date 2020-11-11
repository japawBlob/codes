#include <stdio.h>

int main(){
	int x = 10;
	int number = 0;
	printf(" ");
	for(int i = 0;i<x;i++){
		for(int j = 0;j<i;j++){
			printf("   ");
		}		
		printf("%i", (i+i*10));
		printf("\n");
	}
	return 0;
}
