#include <stdio.h>

#define NUMBER 10 //prikaz do procesoru vsude, kde se v textu objevi NUMBER -> nahrad 10 == symbolicka konstanta

//#include "compute.h"

int compute (int a);

int main (int argc, char *argv[]){
	/*for (int i = 0; i<argc;i++){
		printf("argv[%d] \"%s\"\n", i, argv[i]);
	}

	int r = compute(10); 
	*/
	int b = 1;
	//int a = 10;
	int a = NUMBER;	
	int r = 0;
	const int c = 10; //kdyz nekdy podto nqapise c=11 - clang mi rekne, ze bych to delat nemel.

	double d = 13.1;

	//enum{}

	printf("double: %ld d: %ld\n", sizeof(int), sizeof(b));
	printf("int: %ld d: %ld\n", sizeof(double), sizeof(d));
	
	printf("before compute a: %d b: %d r: %d\n", a, b, r);
	int r = compute(a);
	printf("a: %d b: %d r: %d\n", a, b, r); 
	
	return 0;	
}

int compute(int a){
	a += 1;
	int b = a +1;

	return b;

}

//literal

