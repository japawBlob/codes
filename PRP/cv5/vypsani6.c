#include <stdio.h>

int main(){
	int x = 10;
	int number = 0;
	for(int i = 0;i<x;i++){
		for(int j = 0;j<i;j++){
			printf("   ");
		}
		printf("%2i", (i+i*10));
		if(i>4){ printf("\r");
			 for(int j = 0;(j+9)>i;j--){
				printf("   ");
			}
		} else {
			 for(int j = 0;(j+9-i)>i;j--){
				printf("   ");
			 }
		}
		printf("%2i", ((i+1)*9));
		printf("\n");
	}
	return 0;
	//{if a%9 || a%11}
}
