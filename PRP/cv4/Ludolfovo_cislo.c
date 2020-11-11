#include <stdio.h>

int main(){
	float n = 0;
	scanf("%f", &n);
	float Ludolf = 0;
	float k = 0;
	float pomoc = 0;

	for(int i = 0;i<n;i++){
		if(i%2==0){k = 1;}
		else {k = -1;}
		//pomoc = ((4*k)/(2*i+1));
		//printf("%f ", ((4*k)/(2*i+1)));
		Ludolf += ((4*k)/(2*i+1));
	}
	printf("%f ", Ludolf);
	
	return 0;
}
