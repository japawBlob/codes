//
//  ******************************************************************************
//  @file    main.c
//  @author  CPL (Jakub Jira, based on STM examples)
//  @version V0.0
//  @date    01-October-2016
//  @brief   Serial line over ST-Link example
//  Nucleo STM32F401RE USART2 (Tx PA.2, Rx PA.3)
//
//  ******************************************************************************
//


#include "stm32f4xx.h"

// *******************************************************************************

//
//  @brief  Enable MCU internal connections to USART and GPIO
//
void RCC_Configuration(void)
{
  // --- System Clocks Configuration

  // USART2 clock enable
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);

  // GPIOA clock enable
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

  // GPIOC clock enable
  RCC_AHB1PeriphClockCmd( RCC_AHB1Periph_GPIOC, ENABLE );
} // END void RCC_Configuration(void)

// *******************************************************************************

//
//  @brief  Input/output pins configuration
//
void GPIO_Configuration(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;

  // GPIO Configuration
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_3; // PA.2 USART2_TX, PA.3 USART2_RX
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  // Alternative Functions: Connect USART pins to AF
  GPIO_PinAFConfig(GPIOA, GPIO_PinSource2, GPIO_AF_USART2);
  GPIO_PinAFConfig(GPIOA, GPIO_PinSource3, GPIO_AF_USART2);

  //PA5 is LED
  GPIO_InitStructure.GPIO_Pin         = GPIO_Pin_5;
  GPIO_InitStructure.GPIO_Mode        = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType       = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed       = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd        = GPIO_PuPd_UP;
  GPIO_Init( GPIOA, &GPIO_InitStructure );


  //PC13 is button
  GPIO_InitStructure.GPIO_Pin         = GPIO_Pin_13;
  GPIO_InitStructure.GPIO_Mode        = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_OType       = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed       = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd        = GPIO_PuPd_UP;
  GPIO_Init( GPIOC, &GPIO_InitStructure );
} // END void GPIO_Configuration(void)

// *******************************************************************************

//
//  @brief  Baud rate settings
//
void USART2_Configuration(void)
{
  USART_InitTypeDef USART_InitStructure;

  // USARTx configuration
  //  - BaudRate = 9600 baud
  //  - Word Length = 8 Bits
  //  - One Stop Bit
  //  - No parity
  //  - Hardware flow control disabled (RTS and CTS signals)
  //  - Receive and transmit enabled

  USART_InitStructure.USART_BaudRate 	= (9600);
  USART_InitStructure.USART_WordLength 	= USART_WordLength_8b;
  USART_InitStructure.USART_StopBits 	= USART_StopBits_1;
  USART_InitStructure.USART_Parity 		= USART_Parity_No;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;

  USART_InitStructure.USART_Mode 		= USART_Mode_Rx | USART_Mode_Tx;

  USART_Init(USART2, &USART_InitStructure);

  USART_Cmd(USART2, ENABLE);


} // END void USART2_Configuration(void)

// *******************************************************************************

//
//  @brief  The function sends characters until 0
//
void OutString(char *s)
{
	while(*s)
	{
		// Wait for Tx Empty
		while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);
		// Send Char
		USART_SendData(USART2, *s++);
	} // END while
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET); // Wait for Empty
} // END void OutString(char *s)

void OutStringLn(char *s)
{
	OutString(s);
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET); // Wait for Empty
	OutString("\r\n");
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET); // Wait for Empty
} // END void OutString(char *s)

// *******************************************************************************
void echoChar(uint16_t c){
	USART_SendData(USART2, c); // Echo Char
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET); // Wait for Empty
}

void echoCharLn(uint16_t c){
	USART_SendData(USART2, c); // Echo Char
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET); // Wait for Empty
	OutString("\r\n");
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET); // Wait for Empty
}
void Ln(){
	OutString("\r\n");
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET); // Wait for Empty
}
//
//  @brief  Main loop
//
int main(void)
{
	// Init
	RCC_Configuration();

	GPIO_Configuration();

	USART2_Configuration();

	//variables
	uint16_t userInput;
	uint8_t buttonState;
	char btInputBuff[255];
	int iItemsInBuffer = 0;

	int pressed = 0;

	//Welcome message
	OutStringLn("\rWelcome to this simple program, for help press 'h'.\r\n");
	//loop
	while(1){
		//Check if there is user input to process
		if(USART_GetFlagStatus(USART2, USART_FLAG_RXNE) != RESET){
			userInput = USART_ReceiveData(USART2); // Collect Char
			btInputBuff[iItemsInBuffer++] = userInput;
			if(iItemsInBuffer >= 255){
				iItemsInBuffer = 0;
			}
			while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET); // Wait for Empty
			switch (userInput){
				case 'r':
					OutString("Valid input detected: ");
					echoCharLn(userInput);
					if(pressed == 1){
						OutStringLn("Button is pressed");
					} else {
						OutStringLn("Button is released");
					}
					Ln();
					break;
				case 'o':
					OutString("Valid input detected: ");
					echoCharLn(userInput);
					GPIO_SetBits(GPIOA, GPIO_Pin_5);
					Ln();
					break;
				case 'c':
					OutString("Valid input detected: ");
					echoCharLn(userInput);
					GPIO_ResetBits(GPIOA, GPIO_Pin_5);
					Ln();
					break;
				case 'h':
					OutString("Valid input detected: ");
					echoCharLn(userInput);
					OutStringLn("Hello, this is simple program which enables communication \r\nbetween ST32 board and PC");
					OutStringLn("Pressing button on the board will toggle led on/off");
					OutStringLn("Valid user input:");
					OutStringLn("\t'r' - return state of the button");
					OutStringLn("\t'o' - toggle led on");
					OutStringLn("\t'c' - toggle led off");
					OutStringLn("\t'h' - display help");
					Ln();
					break;
				default:
					OutString("I am sorry your input: ");
					echoChar(userInput);
					OutStringLn(" is not valid. \r\nPlease enter valid input. \r\nFor help press 'h'.");
					Ln();
					break;
			} //end of switch case
		} //End of checking user input

		//Checking button, whether there's change in state. Execute accordingly.
		buttonState = GPIO_ReadInputDataBit( GPIOC, GPIO_Pin_13 );
		if( !buttonState )
		{
			if(pressed == 0){
				GPIO_ToggleBits( GPIOA, GPIO_Pin_5 );
				pressed = 1;
			}
		} else {
			pressed = 0;
		}
	} // END while(1)

} // END main

// *******************************************************************************

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  while (1)
  {}
}
#endif
