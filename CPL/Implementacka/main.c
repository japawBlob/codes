#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "dataBMP.h"


int main(int argc, char const *argv[])
{
	FILE* f = fopen("inCoded.bmp", "rb");

	BMPHeader* blob = (BMPHeader*)malloc(sizeof(BMPHeader));

	fread(blob, sizeof(BMPHeader), 1, f);

	fseek(f, 0, SEEK_END);
	int sz = ftell(f);
	rewind(f);

	printf("%i\n", sz);

	void* buffer = malloc(sz);
	fread(buffer, sz, 1, f);


	FILE* fout = fopen("out.bmp", "wb+");

	fwrite(buffer, sz, 1, fout);

	fclose(fout);

	free(buffer);

	free(blob);

	fclose(f);
	return 0;
}