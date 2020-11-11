#include <stdio.h>

int main(){
	int first = 0x14;
	int second = 0xA0;
	int modifiedfirst = first << 16;

	int R = 40 << 16;
	int G = 140 << 8;
	int B = 120;

	printf("R = %x, G = %x, B = %x\n", R, G, B);


	int hexRGB = R+G+B;

	printf("RGB = %x\n", hexRGB);






	printf("FIRST = %x\n modifiedFIRST = %x\n SECOND = %x\n soucet = %x\n",first,modifiedfirst, second, first+second);

	unsigned char a=0x64;
	int b=0xFAFA;
	
	printf("value of a: %X [%x]\n",a,a);
	printf("value of b: %X [%x]\n",b,b);

	return 0;

}
