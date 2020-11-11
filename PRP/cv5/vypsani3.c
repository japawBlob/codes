#include <stdio.h>

int main(){
	int x = 10;
	int number = 0;
	for(int i = 0;i<x;i++){
		for(int j = 0;j<x;j++){
			if(number<10){
				printf(" %d ", number);
				number++;
			} else {
				printf("%d ", number);
				number++;
			}
		}
		printf("\n");
	}
	return 0;
}
