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

	int i, j;
	int dashighline = 1;
	int pushed_rb = 0;
	int pushed_gb = 0;
	int pushed_bb = 0;
	int change = 1;
	int scene = 0;
	int current_scene = 0;
	int controlled_led = 0;
	int hue, saturation, value = 0;
	char rgb [30];
	char hsv [30];
	char shiningLine[32];
	int gk, rk, bk, rb, gb, bb, temprk,tempgk ,tempbk;
	uint32_t lineNumber = 1;
	
	
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

	
	/**(volatile uint32_t*)(mem_base + SPILED_REG_LED_LINE_o) = 0x00000000;
	*(volatile uint32_t*)(mem_base + SPILED_REG_LED_RGB1_o) = 0x00000000;
	*(volatile uint32_t*)(mem_base + SPILED_REG_LED_RGB2_o) = 0x00000000; */
	
	for(i = 0; i < 320; i++){
		for(j = 0; j < 480; j++){
			frame[i][j] = 0x00; //black
		}
	}
	

	int tempbk = rgb_knobs_value & 0xFF; 		// blue knob position
	int tempgk = (rgb_knobs_value>>8) & 0xFF; 	// green knob position
	int temprk = (rgb_knobs_value>>16) & 0xFF;  // red knob position
	
	printf("KNOBS = %i, %i, %i \n", tempbk, tempgk, temprk);
	
	while(1){
			rgb_knobs_value = *(volatile uint32_t*)(mem_base + SPILED_REG_KNOBS_8BIT_o);
			bk =  rgb_knobs_value      & 0xFF; // blue knob position
			gk = (rgb_knobs_value>>8)  & 0xFF; // green knob position
			rk = (rgb_knobs_value>>16) & 0xFF; // red knob position
			bb = (rgb_knobs_value>>24) & 1;    // blue button
			gb = (rgb_knobs_value>>25) & 1;    // green button
			rb = (rgb_knobs_value>>26) & 1;    // red button
			
			if (bb == 1 && pushed_bb == 0){ //zmacknuti modreho tlacitka
				current_scene = sceneSelect(current_scene);
				change = 1;
				pushed_bb = 1;
			} 
			if(bb == 0){
				pushed_bb = 0;
			}
			
			
			if (rb == 1 && pushed_rb == 0){
				pushed_rb = 1;
				switch(current_scene){
					case 0:
						if(dashighline != 2){
							dashighline += 1;
					}
					break;
					
					case 1:
						if(dashighline != 4){
							dashighline += 1;
						}
					break;
					
					case 2:
						if(dashighline != 4){
							dashighline += 1;
						}
					break;
					
					case 3:
						if(dashighline != 5){
							dashighline += 1;
						}
					break;
					
					case 4:
						if(dashighline != 3){
							dashighline += 1;
						}
					break;
					
					case 5:
						if(dashighline != 4){
							dashighline += 1;
						}
					break;
					
					case 6:
						if(dashighline != 4){
							dashighline += 1;
						}
					break;
					
					
				}

				change = 1;
			} 
			if(rb == 0){
				pushed_rb = 0;
			}
			if (temprk < rk){ //toceni cervenym knobem doprava pricita/doleva odecita hue
				temprk = rk;
				if(hue < 360){
					hue += 1;
					change = 1;
				}
			} else if(temprk > rk){
				temprk = rk;
				if(hue > 0){
					hue -= 1;
					change = 1;
				}
			}
			if (tempgk < gk){ //toceni zelenym knobem doprava pricita/doleva odecita saturation
				tempgk = gk;
				if(saturation < 100){
					lineNumber = (lineNumber >> 1);
					saturation += 1;
					change = 1;
				}
			} else if(tempgk > gk){
				tempgk = gk;
				if(saturation > 0){
					if(lineNumber != 1){
						lineNumber = (lineNumber << 1);
					}
					if(lineNumber == 0){
						lineNumber = 1;
					}
					saturation -= 1;
					change = 1;
				}
			}
			
			if (tempbk < bk){ //toceni modrym knobem doprava pricita/doleva odecita value
				tempbk = bk;
				if(value < 100){
					value += 1;
					change = 1;
				}	
			} else if(tempbk > bk){
				tempbk = bk;
				if(value > 0){
					value -= 1;
					change = 1;
				}
			}
			if (gb == 1 && pushed_gb == 0){
				pushed_gb = 1;
				
				switch(current_scene){
					case 0:
						if(dashighline != 1)
							dashighline -= 1;
					break;
					
					case 1:
						if(dashighline != 1)
							dashighline -= 1;
					break;
					
					case 2:
						if(dashighline != 2)
							dashighline -= 1;
					break;
					
					case 3:
						if(dashighline != 1)
							dashighline -= 1;
					break;
					
					case 4:
						if(dashighline != 3){
							dashighline -= 1;
						}
					break;
					
					case 5:
						if(dashighline != 1)
							dashighline -= 1;
					break;
					
					case 6:
						if(dashighline != 1)
							dashighline -= 1;
					break;
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
			if(change == 1){
				printf("Cotrolled_led: %d", controlled_led);
				printf("\nLine :%i\n", dashighline);
				
				if(current_scene == 4){	
					//printf("Cotrolled_led in scene 4: %d\n", controlled_led);											
					ledSwitch(controlled_led);
					updateString();
				}
				if(current_scene == 7){	
					if(dashighline == 40){
						knightRider();
					}
					//printf("Cotrolled_led in scene 4: %d\n", controlled_led);											
					ledSwitch(controlled_led);
					updateString();
				}
				displayScene(current_scene);
				printf("Scene: %d\n", current_scene);
				frame2lcd();
				change = 0;
			}
			
		}
		
	


/**********************************************************************************************************/

  printf("Goodbye mzAPO\n");

  return 0;
}

void displayScene(int scene){
   switch(scene){
      case 0:															//MAIN menu
         mainScene:
         if(isHighlighted(0)){
            str2frame("Choose a mode:",0,0,0xAA79,0xffff);
         } else {
            str2frame("Choose a mode:",0,0,0xAA79,0);
         }
         if(isHighlighted(20)){
            str2frame("Change LED colours",20,0,0xAA79,0xffff);
         } else {
            str2frame("Change LED colours",20,0,0xAA79,0);
         }
         if(isHighlighted(40)){
            str2frame("Change the font size",40,0,0xAA79,0xffff);
         } else {
            str2frame("Change the font size",40,0,0xAA79,0);
         }
         break;
      case 1:															//LED menu
		 //ledScene:
		 if(isHighlighted(0)){
            str2frame("Changing LED:",0,0,0xAA79,0xffff);
         } else {
            str2frame("Changing LED:",0,0,0xAA79,0);
         }
         if(isHighlighted(20)){
            str2frame("Change static colours",20,0,0xAA79,0xffff);
         } else {
            str2frame("Change static colours",20,0,0xAA79,0);
         }
         if(isHighlighted(40)){
            str2frame("Change fluctuating colours",40,0,0xAA79,0xffff);
         } else {
            str2frame("Change fluctuating colours",40,0,0xAA79,0);
         }
         if(isHighlighted(60)){
            str2frame("Change blinking colours",60,0,0xAA79,0xffff);
         } else {
            str2frame("Change blinking colours",60,0,0xAA79,0);
         }
         if(isHighlighted(80)){
            str2frame("Change shining line",80,0,0xAA79,0xffff);
         } else {
            str2frame("Change shining line",80,0,0xAA79,0);
         }
         if(isHighlighted(100)){
            str2frame("Go back to main menu",100,0,0xAA79,0xffff);
         } else {
            str2frame("Go back to main menu",100,0,0xAA79,0);
         }
         break;
         
      case 2:															//FONT menu
		 //fontScene:
		 if(isHighlighted(0)){
            str2frame("Changing FONT size:",0,0,0xAA79,0xffff);
         } else {
            str2frame("Changing FONT size:",0,0,0xAA79,0);
         }
         if(isHighlighted(20)){
            str2frame("Current FONT size: ",20,0,0xAA79,0xffff);//add variable font size
         } else {
            str2frame("Current FONT size: ",20,0,0xAA79,0);//add variable font size
         }
         if(isHighlighted(40)){
            str2frame("Increase font size",40,0,0xAA79,0xffff);
         } else {
            str2frame("Increase font size",40,0,0xAA79,0);
         }
         if(isHighlighted(60)){
            str2frame("Decrease font size",60,0,0xAA79,0xffff);
         } else {
            str2frame("Decrease font size",60,0,0xAA79,0);
         }
         if(isHighlighted(80)){
            str2frame("Go back to main menu",80,0,0xAA79,0xffff);
         } else {
            str2frame("Go back to main menu",80,0,0xAA79,0);
         }
         break;
         
      case 3:															//LED STATIC colour menu
		 //ledStaticScene:
		 if(isHighlighted(0)){
            str2frame("Changing static LED colour:",0,0,0xAA79,0xffff);
         } else {
            str2frame("Changing static LED colour:",0,0,0xAA79,0);
         }
         if(isHighlighted(20)){
            str2frame("Change LED 1",20,0,0xAA79,0xffff);
         } else {
            str2frame("Change LED 1",20,0,0xAA79,0);
         }
         if(isHighlighted(40)){
            str2frame("Change LED 2",40,0,0xAA79,0xffff);
         } else {
            str2frame("Change LED 2",40,0,0xAA79,0);
         }
         if(isHighlighted(60)){
            str2frame("Change both LEDs simultaneously",60,0,0xAA79,0xffff);
         } else {
            str2frame("Change both LEDs simultaneously",60,0,0xAA79,0);
         }
         if(isHighlighted(80)){
            str2frame("Copy the setting of LED 1",80,0,0xAA79,0xffff);
         } else {
            str2frame("Copy the setting of LED 1",80,0,0xAA79,0);
         }
         if(isHighlighted(100)){
            str2frame("Go back to LED menu",100,0,0xAA79,0xffff);
         } else {
            str2frame("Go back to LED menu",100,0,0xAA79,0);
         }
         break;
         
      case 4:															//LED COLOUR menu
		 //colourScene:
		 
		 if(isHighlighted(0)){
            str2frame("Changing the LED colour:",0,0,0xAA79,0xffff);
         } else {
            str2frame("Changing the LED colour:",0,0,0xAA79,0);
         }
         if(isHighlighted(20)){
            str2frame(rgb,20,0,0xAA79,0xffff);//add variables r, g, b,
         } else {
			
            str2frame(rgb,20,0,0xAA79,0);//add variables r, g, b,
         }
         if(isHighlighted(40)){
            str2frame(hsv,40,0,0xAA79,0xffff);//add variables h, s, v
         } else {
            str2frame(hsv,40,0,0xAA79,0);//add variables h, s, v
		 }	
         if(isHighlighted(60)){
            str2frame("Go back to main menu",60,0,0xAA79,0xffff);
         } else {
            str2frame("Go back to main menu",60,0,0xAA79,0);
         }
         break; 
      //PLACEHOLDER   
      case 5:															//LED FLUCTUATE menu
		 //ledFluctuationScene:
		 if(isHighlighted(0)){
            str2frame("Changing fluctuation of LED !PLACEHOLDER!:",0,0,0xAA79,0xffff);
         } else {
            str2frame("Changing fluctuation of LED !PLACEHOLDER!:",0,0,0xAA79,0);
         }
         if(isHighlighted(60)){
            str2frame("Go back to main menu",60,0,0xAA79,0xffff);
         } else {
            str2frame("Go back to main menu",60,0,0xAA79,0);
         }
         break; 
      //PLACEHOLDER 
      case 6:															//LED BLINK menu
		 //ledBlinkScene:
		 if(isHighlighted(0)){
            str2frame("Changing blinking of LED !PLACEHOLDER!:",0,0,0xAA79,0xffff);
         } else {
            str2frame("Changing blinking of LED !PLACEHOLDER!:",0,0,0xAA79,0);
         }
         if(isHighlighted(60)){
            str2frame("Go back to main menu",60,0,0xAA79,0xffff);
         } else {
            str2frame("Go back to main menu",60,0,0xAA79,0);
         }
         break; 
      case 7:															//LED LINE menu
		 //ledLineScene:
		 if(isHighlighted(0)){
            str2frame("Changing the shining line:",0,0,0xAA79,0xffff);
         } else {
            str2frame("Changing the shining line:",0,0,0xAA79,0);
         }
         if(isHighlighted(20)){
            str2frame(shiningLine,20,0,0xAA79,0xffff);
         } else {
            str2frame(shiningLine,20,0,0xAA79,0);
         }
         if(isHighlighted(40)){
            str2frame("Knight Rider",40,0,0xAA79,0xffff);
         } else {
            str2frame("Knight Rider",40,0,0xAA79,0);
         }
         if(isHighlighted(60)){
            str2frame("Go back to main menu",60,0,0xAA79,0xffff);
         } else {
            str2frame("Go back to main menu",60,0,0xAA79,0);
         }
         break;
		
      default: 
         goto mainScene;
   }
}


int sceneSelect(int start_scene){
	switch(start_scene){
		case 0:
			//mainMenu;
			if(isHighlighted(20)){ 	//go to LED menu
				dashighline = 1;
				return 1;
			} 
			if(isHighlighted(40)){	//go to FONT menu
				dashighline = 2;
				return 2;
			} 
			break;
		
		case 1:
			//ledMenu:
			if(isHighlighted(20)){	//go to change STATIC colour
				dashighline = 1;
				return 3;
			} 
			if(isHighlighted(40)){	//go to change FLUCTUATION menu
				dashighline = 1;
				return 5;
			} 
			if(isHighlighted(60)){	//go to change BLINKING menu
				dashighline = 1;
				return 6;
			} 
			if(isHighlighted(80)){	//go to change LINE menu
				dashighline = 2;
				controlled_led = 5;
				lineNumber = 1;
				return 7;
			} 
			if(isHighlighted(100)){	//go back to MAIN menu
				dashighline = 1;
				return 0;
			} 
			break;
			
		case 2:
			//fontMenu:
			if(isHighlighted(80)){	//go back to MAIN menu
				dashighline = 1;
				return 0;
			} 
			break;

		case 3:
			//staticColourMenu:
			if(isHighlighted(20)){	//go to change COLOUR colour
				controlled_led = 1;
				dashighline = 3;
				return 4;
			} 
			if(isHighlighted(40)){	//go to change COLOUR menu
				controlled_led = 2;
				dashighline = 3;
				return 4;
			} 
			if(isHighlighted(60)){	//go to change COLOUR menu
				controlled_led = 3;
				dashighline = 3;
				return 4;
			} 
			if(isHighlighted(80)){	//go to change COLOUR menu
				controlled_led = 4;
				dashighline = 3;
				return 4;
			} 
			if(isHighlighted(100)){	//go back to LED menu
				controlled_led = 0;
				dashighline = 1;
				return 1;
			} 
			break;
			
		case 4:
			if(isHighlighted(60)){
				dashighline = 1;
				return 3;			//go to STATIC COLOUR menu
				}
			break;
			
		case 5:
			//fluctuationColourMenu:
			if(isHighlighted(60)){	//go back to LED menu
				dashighline = 1;
				return 1;
			} 
			break;
			
		case 6:
			//blinkingCMenu:
			if(isHighlighted(60)){	//go back to LED menu
				dashighline = 1;
				return 1;
			} 
			break;
		case 7:
			//shiningLine menu
			if(isHighlighted(60)){	//go back to LED menu
				dashighline = 1;
				controlled_led = 0;
				lineNumber = 0;
				return 1;
			} 
			break;
	}	
}

void ledSwitch(int controlled_led){
	
	printf("Hue: %d Sat: %d Val %d \n", hue, saturation, value);
	updateString();
	switch(controlled_led){
		case 1:						//control led1
			*(volatile uint32_t*)(mem_base + SPILED_REG_LED_RGB1_o) = HSVToRGB(hue, saturation, value);		
			break;
		case 2:						//control led2
			*(volatile uint32_t*)(mem_base + SPILED_REG_LED_RGB2_o) = HSVToRGB(hue, saturation, value);	
			break;
		case 3:						//control both LEDs
			*(volatile uint32_t*)(mem_base + SPILED_REG_LED_RGB1_o) = *(volatile uint32_t*)(mem_base + SPILED_REG_LED_RGB2_o) = HSVToRGB(hue, saturation, value);
			break;
		case 4:						//copy setting of one LED
			break;
		case 5:						//control both LEDs
			*(volatile uint32_t*)(mem_base + SPILED_REG_LED_LINE_o) = lineNumber;
			break;
		}
	}

void updateString(){
	sprintf(rgb ,"Current Colour in RGB: %x", HSVToRGB(hue, saturation, value));
	sprintf(hsv ,"Current Colour in HSV: %i  %i  %i", hue, saturation, value);
	sprintf(shiningLine, "Currently displayed number: %x", lineNumber);
}



int isHighlighted(int myLine){
   if(dashighline*20 <= myLine && myLine < (dashighline*20+20)){
      return 1;
   } else {
      return 0;
   }
}
int counter = 0;
void knightRider(){
	if(counter<31){
		*(volatile uint32_t*)(mem_base + SPILED_REG_LED_LINE_o) = lineNumber;
		lineNumber = lineNumber << 1;
	} else {
		*(volatile uint32_t*)(mem_base + SPILED_REG_LED_LINE_o) = lineNumber;
		lineNumber = lineNumber >> 1;
	}
	counter++;
	sleep(100);
}