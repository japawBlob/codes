/*******************************************************************
  Simple program to check LCD functionality on MicroZed
  based MZ_APO board designed by Petr Porazil at PiKRON

  mzapo_lcdtest.c       - main and only file

  (C) Copyright 2004 - 2017 by Pavel Pisa
      e-mail:   pisa@cmp.felk.cvut.cz
      homepage: http://cmp.felk.cvut.cz/~pisa
      work:     http://www.pikron.com/
      license:  any combination of GPL, LGPL, MPL or BSD licenses

 *******************************************************************/

#define _POSIX_C_SOURCE 200112L

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <unistd.h>

#include "mzapo_parlcd.h"
#include "mzapo_phys.h"
#include "mzapo_regs.h"

#include "lcdframe.h"
#include "font_types.h"

unsigned char *parlcd_mem_base = NULL;
unsigned char *mem_base = NULL;

uint16_t frame [320] [480];
/*
void frame2lcd(){
	*(volatile uint16_t*)(parlcd_mem_base + PARLCD_REG_CMD_o) = 0x2c; //posilam 2 na LCD , command
	
	volatile uint32_t* ptr = (volatile uint32_t*) frame; //pole jako int
	volatile uint32_t* dst = (volatile uint32_t*)(parlcd_mem_base + PARLCD_REG_DATA_o); //cilovy ptr
	
	int i;
	//ssmycka
	for(i = 0; i < 320 * (480/2); i++){
		*dst = *ptr++;
	}
	
	
}
*/
/*
typedef struct RgbColor
{
    unsigned char r;
    unsigned char g;
    unsigned char b;
} RgbColor;

typedef struct HsvColor
{
    unsigned char h;
    unsigned char s;
    unsigned char v;
} HsvColor;

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
*/


int main(int argc, char *argv[])
{
	printf("Hello mzAPO\n");
	
	//button inicialisation
	
	mem_base = map_phys_address(SPILED_REG_BASE_PHYS, SPILED_REG_SIZE, 0);

	if (mem_base == NULL) exit(1);
	uint32_t rgb_knobs_value;
	int rk, gk, bk, rb, gb, bb;
	
	//LCD inic
	parlcd_mem_base = map_phys_address(PARLCD_REG_BASE_PHYS, PARLCD_REG_SIZE, 0);

	if (parlcd_mem_base == NULL) { 
		printf("It went to hell");
		exit(1);
		}
	parlcd_hx8357_init(parlcd_mem_base);
/****************************************INICIALISATION DONE***********************************************/ 
	int i, j;
	int dashighline = 0;
	int pushed_rb = 0;
	int pushed_gb = 0;
	int pushed_bb = 0;
	int change = 1;
	int barvaLedky1 = 0x000000;
	
	*(volatile uint32_t*)(mem_base + SPILED_REG_LED_LINE_o) = 0x00000005;
	*(volatile uint32_t*)(mem_base + SPILED_REG_LED_RGB1_o) = 0x0F0F0F;
	*(volatile uint32_t*)(mem_base + SPILED_REG_LED_RGB2_o) = 0x00FF00FF; 
	
	for(i = 0; i < 320; i++){
		for(j = 0; j < 480; j++){
			frame[i][j] = 0x00; //black
		}
	}
	//frame2lcd();
	int temp = rgb_knobs_value      & 0xFF; // blue knob position
	
	while(1){
			rgb_knobs_value = *(volatile uint32_t*)(mem_base + SPILED_REG_KNOBS_8BIT_o);
			bk =  rgb_knobs_value      & 0xFF; // blue knob position
			gk = (rgb_knobs_value>>8)  & 0xFF; // green knob position
			rk = (rgb_knobs_value>>16) & 0xFF; // red knob position
			bb = (rgb_knobs_value>>24) & 1;    // blue button
			gb = (rgb_knobs_value>>25) & 1;    // green button
			rb = (rgb_knobs_value>>26) & 1;    // red button
			//printf("%i", rb);
			//sleep(100);
			if (bb == 1 && pushed_bb == 0){ //zmacknuti modreho tlacitka
				/*RgbColor ledka;
				ledka.r = 255;
				ledka.g = 130;
				ledka.b = bk;
				HsvColor novaLedka = RgbToHsv(ledka);
				unsigned char h = novaLedka.h<<16;
				unsigned char s = novaLedka.s<<8;
				unsigned char v = novaLedka.v;
				barvaLedky1 = h+s+v;*/
				barvaLedky1 += bk;
				change = 1;
			} 
			if (temp < bk){ //toceni modrym knobem doprava pricita/doleva odecita
				barvaLedky1+= 0x010101;
				temp = bk;
				change = 1;
			} else if(temp > bk){
				barvaLedky1-= 0x010101;
				temp = bk;
				change = 1;
			}
			//if(bb == 0){
			//	pushed_bb = 0;
			//}
			if (rb == 1 && pushed_rb == 0){
				pushed_rb = 1;
				if(dashighline != 15){
					dashighline += 1;
				}
				change = 1;
			} 
			if(rb == 0){
				pushed_rb = 0;
			}
			if (gb == 1 && pushed_gb == 0){
				pushed_gb = 1;
				if(dashighline != 0){
					dashighline -= 1;
				}
				
				change = 1;
			} 
			if(gb == 0){
				pushed_gb = 0;
			}
			for(i = 0; i < 320; i++){
				for(j = 0; j < 480; j++){
					frame[i][j] = 0x00; //black...
				}
			}
			for(i = 0+dashighline*20; i < 20+dashighline*20 && i >= 0 +dashighline*20; i++){
				for(j = 0; j < 480; j++){
					frame[i][j] = 0xffff; //white
				}
			}
			/*if(dashighline*20 < 20 && 20 < (dashighline*20+20)){
				char2frame('A',20,0,0xAA79,0xffff);
				printf("if\n");
			} else {
				char2frame('A',20,0,0xAA79,0);
				printf("else\n");
			}*/
			//char2frame('A',20,0,0xAA79,0xffff);
			if(change == 1){
				*(volatile uint32_t*)(mem_base + SPILED_REG_LED_RGB1_o) = barvaLedky1;
				printf("%i\n", dashighline);
            displayScene(0);

				/*if(dashighline*20 <= 20 && 20 < (dashighline*20+20)){
					str2frame("Ahoj tohle je prvni text",20,0,0xAA79,0xffff);
					printf("if\n");
				} else {
					str2frame("Ahoj jsem nejlepsi nasobicka",20,0,0xAA79,0);
					printf("else\n");
				}*/
				frame2lcd();
				change = 0;
			}
			
		}

	/*for(i = 0; i < 320; i++){
		for(j = 0; j < 480; j+=12){
			frame[i][j] = frame[i][j+1] = frame[i][j+2] = 0xF800; //red
			frame[i][j+3] = frame[i][j+4] = frame[i][j+5] = 0xFE0; //green
			frame[i][j+6] = frame[i][j+7] = frame[i][j+8] = 0x1F; //blue
			frame[i][j+9] = frame[i][j+10] = frame[i][j+11] = 0x00; //black

			
			}
		}*/
		
	


/**********************************************************************************************************/

  printf("Goodbye mzAPO\n");

  return 0;
}

void displayScene(int scene){
   switch(scene){
      case: 0
         mainScene:
         if(isHighlighted(0)){
            str2frame("Prvni radek zabarveny",0,0,0xAA79,0xffff);
            printf("if\n");
         } else {
            str2frame("prvni radek odbarveny",0,0,0xAA79,0);
            printf("else\n");
         }
         if(isHighlighted(20)){
            str2frame("druhy radek zabarveny",20,0,0xAA79,0xffff);
            printf("if\n");
         } else {
            str2frame("druhy radek odbarveny",20,0,0xAA79,0);
            printf("else\n");
         }
         if(isHighlighted(40)){
            str2frame("treti radek zabarveny",40,0,0xAA79,0xffff);
            printf("if\n");
         } else {
            str2frame("treti radek odbarveny",40,0,0xAA79,0);
            printf("else\n");
         }
         break;
      default: 
         goto mainScene;
   }
}



int isHighlighted(int myLine){
   if(dashighline*20 <= myLine && myLine < (dashighline*20+20)){
      return 1;
   } else {
      return 0;
   }
}



HsvColor RgbToHsv(RgbColor rgb)
{
    HsvColor hsv;
    unsigned char rgbMin, rgbMax;

    rgbMin = rgb.r < rgb.g ? (rgb.r < rgb.b ? rgb.r : rgb.b) : (rgb.g < rgb.b ? rgb.g : rgb.b);
    rgbMax = rgb.r > rgb.g ? (rgb.r > rgb.b ? rgb.r : rgb.b) : (rgb.g > rgb.b ? rgb.g : rgb.b);

    hsv.v = rgbMax;
    if (hsv.v == 0)
    {
        hsv.h = 0;
        hsv.s = 0;
        return hsv;
    }

    hsv.s = 255 * (long)(rgbMax - rgbMin) / hsv.v;
    if (hsv.s == 0)
    {
        hsv.h = 0;
        return hsv;
    }

    if (rgbMax == rgb.r)
        hsv.h = 0 + 43 * (rgb.g - rgb.b) / (rgbMax - rgbMin);
    else if (rgbMax == rgb.g)
        hsv.h = 85 + 43 * (rgb.b - rgb.r) / (rgbMax - rgbMin);
    else
        hsv.h = 171 + 43 * (rgb.r - rgb.g) / (rgbMax - rgbMin);

    return hsv;
}



