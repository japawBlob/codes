#include <stdio.h>

int main(){
	int f = 0;
	printf("Jak velke pole?");
	scanf("%i", &f);
	printf("%i\n",f);
	for(int i = 0;i<f;i++){
		printf("%i ", i);
	}
	printf("\n");



return 0;
}
