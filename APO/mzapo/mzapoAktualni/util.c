#define _POSIX_C_SOURCE 200112L

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <unistd.h>
#include <math.h>

#include "mzapo_parlcd.h"
#include "mzapo_phys.h"
#include "mzapo_regs.h"

#include "lcdframe.h"
#include "font_types.h"

#define FRAME_W 480
#define FRAME_H 320


//unsigned char *mem_base;
unsigned char *parlcd_mem_base;

uint16_t frame[FRAME_H][FRAME_W];

void frame2lcd(){
	parlcd_write_cmd(parlcd_mem_base,0x2c); //to 0.0
	volatile uint32_t *ptr = (volatile uint32_t *)frame;
	volatile uint32_t *dest = (volatile uint32_t *)(parlcd_mem_base + PARLCD_REG_DATA_o);
	int i;
	for(i = 0; i<FRAME_H*(FRAME_W/2); i++){
		*dest = *ptr++;
	}
}

int char2frame(char c, int yrow, int xcolumn, uint16_t forecolor, uint16_t backcolor){
	int cix = c-' ';
	
	const uint16_t * ptr = font_winFreeSystem14x16.bits+cix*16;
	
	int x, y;
	unsigned char w = font_winFreeSystem14x16.width[cix];
	for(y = 0; y<16; y++){
		uint16_t mask = *ptr++;
		
		for(x = 0; x<w+4;x++){
			frame[yrow+y][xcolumn+x] = (mask & 0x8000) ? forecolor : backcolor;
			mask <<= 1;
		}
	}
	return w+4;
}

int str2frame(char * str, int yrow, int xcolumn, uint16_t forecolor, uint16_t backcolor){
	int shift = 0;
	int shiftret = 0;
	char c;
	
	while((c = *str++) != '\0'){
		shift = char2frame(c,yrow,xcolumn,forecolor,backcolor);
		xcolumn += shift;
		shiftret = +shift;
	}
	
	return shiftret;
}
struct RGB
{
	unsigned char R;
	unsigned char G;
	unsigned char B;
};

struct HSV
{
	double H;
	double S;
	double V;
};

int HSVToRGB(int h, int s, int v) {
	double newH = (double)h;
	double newS = (double)s;
	double newV = (double)v;
	
	double r = 0, g = 0, b = 0;
	
	struct HSV hsv;
	hsv.H = newH;
	hsv.S = newS/100;
	hsv.V = newV/100;
	
	if (hsv.S == 0)
	{
		r = hsv.V;
		g = hsv.V;
		b = hsv.V;
	}
	else
	{
		int i;
		double f, p, q, t;

		if (hsv.H == 360)
			hsv.H = 0;
		else
			hsv.H = hsv.H / 60;

		i = (int)trunc(hsv.H);
		f = hsv.H - i;

		p = hsv.V * (1.0 - hsv.S);
		q = hsv.V * (1.0 - (hsv.S * f));
		t = hsv.V * (1.0 - (hsv.S * (1.0 - f)));
		switch (i)
		{
		case 0:
			r = hsv.V;
			g = t;
			b = p;
			break;

		case 1:
			r = q;
			g = hsv.V;
			b = p;
			break;

		case 2:
			r = p;
			g = hsv.V;
			b = t;
			break;

		case 3:
			r = p;
			g = q;
			b = hsv.V;
			break;

		case 4:
			r = t;
			g = p;
			b = hsv.V;
			break;

		default:
			r = hsv.V;
			g = p;
			b = q;
			break;
		}

	}

	struct RGB rgb;
	rgb.R = r * 255;
	rgb.G = g * 255;
	rgb.B = b * 255;
	
	
	r = rgb.R << 16;
	g = rgb.G << 8;
	b = rgb.B;

	return (r+g+b);
}



