#include <stdio.h>

int main(int argc, char const *argv[])
{
	int blob [3][3]= {{1,2,3},{4,5,6},{7,8,9}};
	int count = -1;
/*	for (int i = 0; i < 3*2; ++i)
	{
		
		if(count < 3){
			count++;
		} else {
			count--;
		}
		

		for (int j=0; j<count; j++){
        	printf("%5d ", blob[i-j][j]);
        } 
		printf("\n");
	}*/
	for (int i = 0; i < 3*2-1; ++i)
	{
		if(i<3){
			count++;
		} else {
			count--;
		}


		for (int j = count; j >=0 ; --j)
		{	
			if(i>2){
				//printf("%i\n", count);
				printf("%i ", blob[2-(count-j)][2-j]);
			}else{
				printf("%i ", blob[i-j][j]);
			}
		}
		printf("\n");
	}


	return 0;
}
