#include <stdio.h>

int main(int argc, char const *argv[])
{
	int ret, x;
	char *text;
	while ((ret = scanf("%d %ms", &x, &text)) == 2) {
	    printf("%i %s\n", x, text);
	}
	return 0;
}