#include <stdio.h>

int main(int argc, char const *argv[])
{
	int*p;
	int*p1;
	p=p1;
	*p1=6;
	printf("%i\n", *p);
	return 0;
}