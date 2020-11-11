#include <stdio.h>

int main(){
	int a= 0;
	int b= 1;
	for(int i=0;;i++){
	int c = a+b;
	a = b;
	b = c;
	if(c>300) break;
	printf("%d\n",c);	
	}

}
