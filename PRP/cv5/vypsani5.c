#include <stdio.h>

int main(){
	int x = 10;
	int number = 0;
	for(int i = 0;i<x;i++){
		for(int j = 0;(j+9)>i;j--){
			printf("   ");
		}		
		printf("%i", ((i+1)*9));
		printf("\n");
	}
	return 0;
}
