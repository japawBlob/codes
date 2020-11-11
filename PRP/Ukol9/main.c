#include <stdio.h>
#include <stdlib.h>

int main(){
	
	int* arr;
	int arr_max = 4;
	arr = (int*)malloc(arr_max*sizeof(int));
	int arr_length = 0;

	FILE* f = fopen("in.txt", "r");
	int blob;
	while((blob = getc(f)) != EOF){
		if(arr_length == arr_max){
			arr_max = arr_max/2 + arr_max;
			arr = (int*)realloc(arr, arr_max*sizeof(int));
		}
		arr[arr_length++] = blob;
	}

	for(int i = 0; i < arr_length; i++){
		printf("%c", arr[i]);
	}
	fclose(f);
	return 0;
}
