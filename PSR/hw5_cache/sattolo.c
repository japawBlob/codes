 
#include<stdlib.h>
#include<stdio.h>
#include<time.h>
 
void sattoloCycle(int arr[],int count){
	int i,j;
	int temp;
 
	if(count<2)
		return;
	for(i=count-1;i>=1;i--){
		j = rand()%i;
		temp = arr[j];
		arr[j] = arr[i];
		arr[i] = temp;
	}
	for (int i = 0; i < 10; ++i)
	{
		printf("%i ", arr[i]);
	}
	printf("\n");
	i = 2*10;
	int blob = 0;
	printf("0 -> ");
	while(i>0){
		printf("%i -> ",arr[blob]);
		blob = arr[blob];
		i--;
	}
}
 
int main(int argC,char* argV[])
{
	int i;
 	srand((unsigned)time(NULL));
    int blob[10] = {0,1,2,3,4,5,6,7,8,9};
	sattoloCycle(blob,10);
	
	return 0;
}