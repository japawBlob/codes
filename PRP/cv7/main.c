#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void vypis_pole(float*, int);
float prumer(float*, int);
float smerodatna_odchylka(float*, int);


int main(){
	/*float array[] = {0.5,0.8,0.11};
	
	vypis_pole(array,sizeof(array)/sizeof(float));
	printf("Prumer je %f\n",prumer(array,sizeof(array)/sizeof(float)));
	printf("Smerodatna odchylka je %f\n",smerodatna_odchylka(array,sizeof(array)/sizeof(float)));
	*/
	
	return 0;
}
void vypis_pole(float* pole, int n){
	for(int i = 0; i<n; i++){
		printf("Number at position %i = %f\n", i, pole[i]);
	}
}
float prumer(float* pole, int n){
	float x = 0;
	for(int i = 0; i<n; i++){
		x = x + pole[i];
	}
	return x/n;
}
float smerodatna_odchylka(float* pole, int n){
	float x = 0;
	float x_prumer = prumer(pole, n);
	for(int i =0; i<n; i++){
		x = x + (pole[i] - x_prumer)*(pole[i] - x_prumer);
	}
	x = x/(n-1);
	return sqrtf(x);
}
void
