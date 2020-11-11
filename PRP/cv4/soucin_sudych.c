#include <stdio.h>

int main(){
	int n = 0;
	scanf("%d", &n);
	int i = 1;
	int sum = 1;
	while(i<=n){
		if(i%2==0){
			sum = sum*i;
		}
		i++;
	}
	printf("%i\n", sum);
	return 0;
}
