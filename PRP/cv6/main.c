#include <stdio.h>

int main(){
	int f = 0;
	scanf("%i", &f);
	int pole[f];
	int input = 0;

	for(int i = 0;i<f;i++){
		scanf("%i", &input);
		pole[i] = input;
	}
	
	for(int i = 0;i<f;i++){
		printf("%i ", pole[i]);
	}
	printf("\n");



return 0;
}
