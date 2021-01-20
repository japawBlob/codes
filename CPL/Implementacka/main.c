#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "dataBMP.h"


int main(int argc, char const *argv[])
{
	FILE* f = fopen("smol.bmp", "rb");

	fseek(f, 0, SEEK_END);
	int size = ftell(f);
	rewind(f);

	BMPHeader* blob = (BMPHeader*)malloc(sizeof(BMPHeader));

	fread(blob, sizeof(BMPHeader), 1, f);
	int header_size = ftell(f);
	printf("%i %i\n", size, size-header_size);
	int body_size = size-header_size;
	void* buffer = malloc(body_size);
	fread(buffer, body_size, 1, f);


	printf("width_px: %u\nheight_px: %u\nbits_per_pixel: %u\n", blob->width_px, blob->height_px, blob->bits_per_pixel);	

	int line_size = blob->width_px*(blob->bits_per_pixel/8);

	void* line_buff = malloc(line_size);

	for (int i = 5; i < 55; ++i)
	{
	

	memcpy(line_buff, buffer+(4*line_size), line_size);

	memcpy(buffer+(4*line_size), buffer+(body_size-(4*line_size)), line_size);

	memcpy(buffer+(body_size-(4*line_size)), line_buff, line_size);

}

	FILE* fout = fopen("out.bmp", "wb+");
	fwrite(blob, header_size, 1, fout);
	fwrite(buffer, body_size, 1, fout);


	free(line_buff);

	fclose(fout);

	free(buffer);

	free(blob);

	fclose(f);
	return 0;
}