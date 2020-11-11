#include <stdio.h>
#include <stdlib.h>

typedef struct s {
	int blob;
} str;

int main(int argc, char const *argv[])
{
	str* ooze = malloc(sizeof(str));
	printf("%i\n", ooze->blob);
	free(ooze);
	return 0;
}