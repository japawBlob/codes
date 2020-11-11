#include <stdio.h>

int main(){

    int *up, **uup, array[] = {5, -6, 0, 8, -9, 3, 1, -4};
     
    up = array;
    uup = &up;
     
    printf("array[1] = %d \n", array[1]);
    printf("array[1] + 4 = %d \n", array[1] + 4);
    printf("(array + 1)[2] = %d \n", (array + 1)[2]);
     
    printf("*up = %d \n", *up);
    printf("*up + 4 = %d \n", *up + 4);
    printf("*(up + 1) = %d \n", *(up + 1));
     
    printf("**uup = %2d \n", **uup);
    printf("*(*uup + 2) = %2d \n", *(*uup + 2));
    printf("**uup + 4 = %2d \n", **uup + 4);
    
	return 0;
}
