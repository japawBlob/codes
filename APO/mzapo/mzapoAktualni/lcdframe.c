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

/*
int main(int argc, char *argv[]){
	
  printf("Hello world\n");

  mem_base = map_phys_address(SPILED_REG_BASE_PHYS, SPILED_REG_SIZE, 0);

  if (mem_base == NULL) exit(1);
  
  parlcd_hx8357_init(parlcd_mem_base);//after power-up
  
  int i,j;
  for(i = 0; i<320; i++){
	  for(j = 0; j<480; j+=2){
		  frame[i][j] = 0xF800;
		  frame[i][j+1] = 0x07E0;
	  }
  }
  frame2lcd();


  printf("Goodbye world\n");
  return 0;
}
*/
