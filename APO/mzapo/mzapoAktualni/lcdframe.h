#ifndef _LCDFRAME_H_
#define _LCDFRAME_H_
#include <stdint.h>


#define FRAME_W 480
#define FRAME_H 320

#ifdef __cplusplus
extern "C" {
#endif

//unsigned char *mem_base;

extern unsigned char *parlcd_mem_base;

extern uint16_t frame[FRAME_H][FRAME_W];

void frame2lcd();

int char2frame(char c, int yrow, int xcolumn, uint16_t forecolor, uint16_t backcolor);

int str2frame(char * str, int yrow, int xcolumn, uint16_t forecolor, uint16_t backcolor);

#ifdef __cplusplus
extern "C" }
#endif
	
	

#endif
