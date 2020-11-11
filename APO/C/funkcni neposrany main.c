#include <stdio.h>
#include <stdlib.h>

#define WIDTH width*3


int main(int argc, char* argv[]){
	
	FILE *origin = fopen(argv[1], "rb");

	int width, heigth, number255;
    if (fscanf(origin, "P6 %d %d %d\n", &width, &heigth, &number255) != 3){
    	return 1;
    }

    unsigned char *img = (unsigned char*) malloc (WIDTH*heigth*sizeof(unsigned char));
    unsigned char *focused_img = (unsigned char*) malloc (WIDTH*heigth*sizeof(unsigned char));

    fread(img, WIDTH, heigth, origin);

	int histogram[] = {0,0,0,0,0,0};

   	int i = 0;
   	int histogram_value;
   	do{
   		focused_img[i] = img[i];
   		focused_img[i+1] = img[i+1];
   		focused_img[i+2] = img[i+2];
   		histogram_value = (0.2126*focused_img[i] + 0.7152*focused_img[i+1] + 0.0722*focused_img[i+2] + 0.5)/51;
   		histogram[histogram_value]++;
   		i+=3;
   	}while(i<WIDTH);

   	int whichLine = 2;
   	int red,green,blue;
   	do{
   		focused_img[i] = img[i];
   		focused_img[i+1] = img[i+1];
   		focused_img[i+2] = img[i+2];
   		histogram_value = (0.2126*focused_img[i] + 0.7152*focused_img[i+1] + 0.0722*focused_img[i+2] + 0.5)/51;
   		histogram[histogram_value]++;
   		i+=3;
   		do{
   			//r g b r g b r g b
   		   //-3-2-1 0 1 2 3 4 5



   			red = 5*img[i] - img[i+3] - img[i-3] - img[i-WIDTH] - img[i+WIDTH];
            green = 5*img[i+1] - img[i+1+3] - img[i+1-3] - img[i+1-WIDTH] - img[i+1+WIDTH];
            blue = 5*img[i+2] - img[i+2+3] - img[i+2-3] - img[i+2-WIDTH] - img[i+2+WIDTH];

            //if(whichLine == 12){
   			//	printf("%i %i %i\n",red, green, blue);
   			//}

            focused_img[i] = (red > 0) ? ((red < 255) ? (red) : (255)) : (0);
            focused_img[i+1] = (green > 0) ? ((green < 255) ? (green) : (255)) : (0);
            focused_img[i+2] = (blue > 0) ? ((blue < 255) ? (blue) : (255)) : (0);
            histogram_value = (0.2126*focused_img[i] + 0.7152*focused_img[i+1] + 0.0722*focused_img[i+2] + 0.5)/51;
            histogram[histogram_value]++;
            i+=3;
   		}while(i<WIDTH*whichLine-3);
   		focused_img[i] = img[i];
   		focused_img[i+1] = img[i+1];
   		focused_img[i+2] = img[i+2];
   		histogram_value = (0.2126*focused_img[i] + 0.7152*focused_img[i+1] + 0.0722*focused_img[i+2] + 0.5)/51;
   		histogram[histogram_value]++;
   		i+=3;
   		whichLine++;
   	}while(i<WIDTH*(heigth-1));

   	do{
   		focused_img[i] = img[i];
   		focused_img[i+1] = img[i+1];
   		focused_img[i+2] = img[i+2];
   		histogram_value = (0.2126*focused_img[i] + 0.7152*focused_img[i+1] + 0.0722*focused_img[i+2] + 0.5)/51;
   		histogram[histogram_value]++;
   		i+=3;
   	}while(i<WIDTH*heigth);

    
    FILE* focused = fopen("output.ppm", "wb+");

	fprintf(focused, "P6\n%i\n%i\n%i\n",width,heigth,number255);
   	fwrite(focused_img,WIDTH,heigth,focused);

   	FILE* hist = fopen("output.txt", "wb+");
   	fprintf(hist, "%d %d %d %d %d ", histogram[0], histogram[1], histogram[2], histogram[3], histogram[4] + histogram[5]);
    

   	fclose(hist);
   	fclose(focused);
   	fclose(origin);
   	//fclose(focused);
   	free(img);
   	free(focused_img);

	return 0;
}