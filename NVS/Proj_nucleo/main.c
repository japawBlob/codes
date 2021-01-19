//;***************************************************************************************************
//;*
//;* Misto			: CVUT FEL, Katedra Mereni
//;* Prednasejici		: Doc. Ing. Jan Fischer,CSc.
//;* Predmet			: A4B38NVS
//;* Vyvojovy Kit		: STM32 VL DISCOVERY (STM32F100RB)
//;*
//;**************************************************************************************************
//;*
//;* JMÉNO PROJEKTU	: Demo_01
//;* AUTOR			: Radek Øípa
//;* DATUM			: 11/2011
//;* POPIS			: Program pro ovladani LED na vyvodu PC8 pomoci USER tlacitka na PA0.
//;*					  - konfigurace hodin na frekvenci 24MHz (HSE + PLL)
//;*					  - konfigurace pouzitych vyvodu procesotu (PC8 jako push-pull vystup a tlacitka PA0 jako floating input)
//;*
//;*
//;***************************************************************************************************

#include "stm32f4xx.h"
#include "stm32f4xx_nucleo.h"

#include "stm32_adafruit_lcd.h"

#include <string.h>
#include <stdio.h>

#include <time.h>
#include <unistd.h>


/*Definice*/

/*Globalni promenne*/


/*Funkcni prototypy*/
void RCC_Configuration(void);
void GPIO_Configuration(void);
void Delay(unsigned nCount);
static void initGPIO( void );

/*Metody*/

static void Error_Handler(void)
{
  /* User may add here some code to deal with this error */

  while(1)
  {
  }
}

static void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct;
  RCC_OscInitTypeDef RCC_OscInitStruct;

  /* Enable Power Control clock */
  __HAL_RCC_PWR_CLK_ENABLE();

  /* The voltage scaling allows optimizing the power consumption when the device is
     clocked below the maximum system frequency, to update the voltage scaling value
     regarding system frequency refer to product datasheet.  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

  /* Enable HSI Oscillator and activate PLL with HSI as source */
  RCC_OscInitStruct.OscillatorType          = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState                = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue     = 6; //0x10;
  RCC_OscInitStruct.PLL.PLLState            = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource           = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM                = 16;
  RCC_OscInitStruct.PLL.PLLN                = 336;
  RCC_OscInitStruct.PLL.PLLP                = RCC_PLLP_DIV4;
  RCC_OscInitStruct.PLL.PLLQ                = 7;
  if( HAL_RCC_OscConfig( &RCC_OscInitStruct ) != HAL_OK )
  {
    Error_Handler();
  }

  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2
     clocks dividers */
  RCC_ClkInitStruct.ClockType               = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource            = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider           = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider          = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider          = RCC_HCLK_DIV1;
  if(HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }

  /*
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  */

}


/*System init
 *Volano z startup souboru
 *Metoda je prazdna aby se mohla provest inicializace v metode main.
 *Jinak se inicializace provadi v souboru system_stm32f10x.h

*/
/*void SystemInit(void){
//Prazdna inicializacni metoda
}*/

/*Main funkce*/
typedef struct {
	uint8_t R;
	uint8_t G;
	uint8_t B;
} RGB_struct;
void Delay_me(unsigned counter)
{
    while(counter--);
}
void draw(RGB_struct RGB)
{
    /* 0 */
	char i;
	uint8_t R = RGB.R;
    for(i = 0; i < 8; i++)
    {
    	if(R & 0x1){
    		GPIOC->BSRR|=0x100;
			Delay_me(71);
			GPIOC->BSRR|=0x1000000;
			Delay_me(21);
    	} else {
    		GPIOC->BSRR|=0x100;
			GPIOC->BSRR|=0x1000000;
			Delay_me(71);
    	}
    	R = R >> 1;
    }
    uint8_t G = RGB.G;
    for(i = 0; i < 8; i++)
    {
    	if(G & 0x1){
			GPIOC->BSRR|=0x100;
			Delay_me(71);
			GPIOC->BSRR|=0x1000000;
			Delay_me(21);
		} else {
			GPIOC->BSRR|=0x100;
			GPIOC->BSRR|=0x1000000;
			Delay_me(71);
		}
		G = G >> 1;
    }
    uint8_t B = RGB.B;
	for(i = 0; i < 8; i++)
	{
		if(B & 0x1){
			GPIOC->BSRR|=0x100;
			Delay_me(71);
			GPIOC->BSRR|=0x1000000;
			Delay_me(21);
		} else {
			GPIOC->BSRR|=0x100;
			GPIOC->BSRR|=0x1000000;
			Delay_me(71);
		}
		G = G >> 1;
	}
}
void draw_else(void)
{
	char i;
    /* 0 */
    for(i = 0; i < 24; i++)
    {
    	/*GPIOC->BSRR|=0x100;
        //GPIO_WriteBit(GPIOA,GPIO_Pin_6,Bit_SET);
    	Delay_me(10);
        //GPIO_WriteBit(GPIOA,GPIO_Pin_6,Bit_RESET);
        GPIOC->BSRR|=0x1000000;
        Delay_me(86);*/
    	GPIOC->BSRR|=0x100;
		GPIOC->BSRR|=0x1000000;
		Delay_me(71);
    }

    /*for(i = 0; i < 8; i++)
    {
    	GPIOC->BSRR|=0x100;
    	Delay_me(4);
        GPIOC->BSRR|=0x1000000;
        Delay_me(12);
    }
    for(i = 0; i < 8; i++)
    {
    	GPIOC->BSRR|=0x100;
    	Delay_me(14);
        GPIOC->BSRR|=0x1000000;
        Delay_me(2);
    }*/
}

int main(void){
	SystemClock_Config();
	HAL_Init();
	initGPIO();
	//unsigned tick = HAL_RCC_GetSysClockFreq();



	/*unsigned start = HAL_GetTick();

	Delay_me(100000000);

	unsigned end = HAL_GetTick();

	unsigned delta;

	delta = end-start;*/

	//RCC_Configuration(); //inicializace hodin
	//GPIO_Configuration(); //inicializace GPIO
	/*Nekonecna smycka*/

	//GPIOC->BSRR|=0x100;//ANO rozsvitime LED na PC8
	/*while(1){
		if(GPIOC->IDR&0x1){//je PA0 stisknuto??
			GPIOC->BSRR|=0x100;//ANO rozsvitime LED na PC8
		}else{
			GPIOC->BSRR|=0x1000000;//ne zhasneme LED na PC8
		}
	}*/
	/*while(1){
		GPIOC->BSRR|=0x100;//ANO rozsvitime LED na PC8
		unsigned i = 0;
		while(i<700000){
			i++;

		}
		GPIOC->BSRR|=0x1000000;//ne zhasneme LED na PC8
		i = 0;
		while(i<1400000){
			i++;
		}
	}*/
	RGB_struct color;
	color.R = 0xAA;
	color.G = 0x00;
	color.B = 0x00;

	while(1){
		draw(color);
		Delay_me(5000000);
		draw_else();
		Delay_me(5000000);
	}


}
/*Inicializace RCC*/
void RCC_Configuration(void){
	RCC->CR|=0x10000; //HSE on
	while(!(RCC->CR&0x20000)){}
	  //flash access setup
  	FLASH->ACR &= 0x00000038;   //mask register
  	FLASH->ACR |= 0x00000002;   //flash 2 wait state

 	FLASH->ACR &= 0xFFFFFFEF;   //mask register
    FLASH->ACR |= 0x00000010;   //enable Prefetch Buffer

	RCC->CFGR&=0xFFC3FFFF;//maskovani PLLMUL
	RCC->CFGR|=0x1<<18;//Nastveni PLLMUL 3x
	RCC->CFGR|=0x0<<17;//nastaveni PREDIV1 1x
	RCC->CFGR|=0x10000;//PLL bude clocovan z PREDIV1
	RCC->CFGR&=0xFFFFFF0F;//HPRE=1x
	RCC->CFGR&=0xFFFFF8FF;//PPRE2=1x
	RCC->CFGR&=0xFFFFC7FF;//PPRE2=1x

	RCC->CR|=0x01000000;//PLL on
	while(!(RCC->CR&0x02000000)){}//PLL stable??

	RCC->CFGR&=0xFFFFFFFC;
	RCC->CFGR|=0x2;//nastaveni PLL jako zdroj hodin pro SYSCLK

  	while(!(RCC->CFGR & 0x00000008))//je SYSCLK nastaveno?
  	{
  	}

	RCC->APB2ENR|=0x14;//pocoleni PA a PC

}
/*Inicializace GPIO*/
void GPIO_Configuration(void){
	GPIOC->MODER&=0xFFFFFFF0FFFFFFFF;//PC8
	GPIOC->MODER|=0x300000000;  //PC8 jako PP output

	GPIOA->MODER&=0xFFFFFFFFFFFFFF0;
	GPIOA->MODER|=0x4;//PA0 jako Floating input

}

static void initGPIO( void )
{

    __GPIOC_CLK_ENABLE();

 /*   GPIO_InitStruct.Pin         = GPIO_PIN_8;
    GPIO_InitStruct.Mode        = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Speed       = GPIO_SPEED_FREQ_VERY_HIGH;*/
    uint32_t temp = 0;
    temp = GPIOC->MODER;
	temp &= ~0x30000;
	temp |= 0x10000;
	GPIOC->MODER = temp;

	temp = GPIOC->OSPEEDR;
	temp &= ~0x30000;
	temp |= 0x30000;
	GPIOC->OSPEEDR = temp;

	temp = GPIOC->OTYPER;
	temp &= ~0x100;
	//temp |= 0x100;
	GPIOC->OTYPER = temp;

	temp = GPIOC->PUPDR;
    temp &= ~0x30000;
    temp |= 0x0;
    GPIOC->PUPDR = temp;

    GPIO_InitTypeDef GPIO_InitStruct_1;

    GPIO_InitStruct_1.Pin         = GPIO_PIN_0;
    GPIO_InitStruct_1.Mode        = GPIO_MODE_INPUT;
    GPIO_InitStruct_1.Pull        = GPIO_PULLUP;
    HAL_GPIO_Init( GPIOC, &GPIO_InitStruct_1 );



}

void draw_violet(void)
{
	char i;
    /* 0 */
    for(i = 0; i < 8; i++)
    {
    	GPIOC->BSRR|=0x100;
        //GPIO_WriteBit(GPIOA,GPIO_Pin_6,Bit_SET);
    	Delay_me(71);
        //GPIO_WriteBit(GPIOA,GPIO_Pin_6,Bit_RESET);
        GPIOC->BSRR|=0x1000000;
        Delay_me(21);
    }

    for(i = 0; i < 8; i++)
    {
    	GPIOC->BSRR|=0x100;
        GPIOC->BSRR|=0x1000000;
        Delay_me(71);
    }
    for(i = 0; i < 8; i++)
    {
    	GPIOC->BSRR|=0x100;
		//GPIO_WriteBit(GPIOA,GPIO_Pin_6,Bit_SET);
		Delay_me(71);
		//GPIO_WriteBit(GPIOA,GPIO_Pin_6,Bit_RESET);
		GPIOC->BSRR|=0x1000000;
		Delay_me(21);
    }
}
