#include <stdio.h>

int negposone (int n){
	int ret = 0;
	if(n%2==0) ret = 1;
	else ret = -1;
	
	return ret;
}

int main(){
	int n = 0;
	int out = 1;
	scanf("%d", &n);
	for(int i = 0;i<n;i++){
		int navrat = negposone(i);
		/*if(i%2==0) printf("1 ");
		else printf("-1 ");
		*/
		printf("%d ", navrat);
	}
	return 0;
	
}
