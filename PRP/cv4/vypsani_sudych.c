#include <stdio.h>

int main(){
	int n = 0;
	scanf("%d", &n);
	int i = 1;
	while(i<=n){
		if(i%2==0){
			printf("%d\n", i);	
		}
		i++;
	}

	return 0;
}
