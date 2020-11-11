#include <stdio.h>
#include <math.h>

int main(){
	int n = 0;
	int out = 1;
	scanf("%d", &n);
	for(int i = 0;i<n;i++){
		if(i%2==0) printf("1 ");
		else printf("-1 ");
	}
	return 0;
}
