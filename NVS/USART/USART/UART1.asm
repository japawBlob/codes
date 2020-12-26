;***************************************************************************************************
;*
;* Misto			: CVUT FEL, Katedra Mereni
;* Prednasejici		: Doc. Ing. Jan Fischer,CSc.
;* Predmet			: A4M38AVS
;* Vyvojovy Kit		: STM32 VL DISCOVERY (STM32F100RB)
;*
;**************************************************************************************************
;*
;* JMÉNO SOUBORU	: UART1.ASM
;* AUTOR			: Michal TOMÁŠ
;* DATUM			: 12/2010
;* POPIS			: Program pro komunikaci po USART (echo s potvrzenim primu)
;*					  - konfigurace hodin na frekvenci 24MHz (HSE + PLL) 
;*					  - konfigurace pouzitych vyvodu procesotu (PA9 vystup, PA10 vstup)
;*					  - konfigurace USART1 - 9600 Bd, bez parity, 8-bitu
;*					  - prijem a vysilani po USART
;*
;***************************************************************************************************
		AREA    STM32F1xx, CODE, READONLY  	; hlavicka souboru
	
		GET		INI.s					; vlozeni souboru s pojmenovanymi adresami
										; jsou zde definovany adresy pristupu do pameti (k registrum)

;---------------------------------------------------------------------------------------------------										

DATA_USARTON	DCB		" Cortex-M3 DISCOVERY -> USART1",0xA, 0xD, 0; definovani konstanty retezce
DATA_TEXT		DCB		" :symbol (RECEIVED) ",0xA, 0xD, 0;

;---------------------------------------------------------------------------------------------------										
											
		EXPORT	__main					; export navesti pouzivaneho v jinem souboru, zde konkretne
		EXPORT	__use_two_region_memory	; jde o navesti, ktere pouziva startup code STM32F10x.s
		
__use_two_region_memory	
__main								  						
		
		ENTRY

								              
;*********************************************************************************************
;* Jmeno funkce		: MAIN
;* Popis			: Hlavni program + podprogramy nastaveni hodim, GPIO, USART
;*					  a vysilani a prijmu pres USART		
;* Vstup			: Zadny
;* Vystup			: Zadny
;* Komentar			: Konfigurace, prijem a vysilani pres USART
;*********************************************************************************************
MAIN			
				BL		RCC_CNF				; skok na podprogram nastaveni hodin
				BL		GPIO_CNF			; skok na podprogram nastaveni vyvodu
				BL		USART_CNF			; skok na podprogram nastaveni USART	

				LDR		R0, =DATA_USARTON	; nacteni adresy retezce
				BL		TRAN_USART_TEXT		; vyslani textoveho retezce
LOOP			
				BL		REC_USART			; prijem bajtu pres USART

				BL		TRAN_USART			; vyslani bajtu pres USART
   
				LDR		R0, =DATA_TEXT		; nacteni adresy retezce
				BL		TRAN_USART_TEXT		; vyslani textoveho retezce (potvrzovaci hlaska)

				B		LOOP

;*********************************************************************************************
;* Jmeno funkce		: REC_USATR
;* Popis			: Podprogram pro prijem dat z USART
;* Vstup			: Zadny
;* Vystup			: R0 = prijaty bajt
;* Komentar			: Je prijat jeden bajt pomoci USART1 	
;*********************************************************************************************
REC_USART		PUSH	{R1, R2, LR}	 		 
NO_RDY_REC									;cekani na prijem bajtu
				LDR 	R1, =USART_SR
				LDR 	R2,[R1] 		
				TST 	R2, #0x20 			; test naplneni cteciho bufferu
				BEQ 	NO_RDY_REC 			; skok pri nenaplnenem bufferu
				LDR 	R1, =USART_DR 	
				LDR		R0,	[R1]			; precteny bajt v RO

				POP		{R1, R2, PC}

;*********************************************************************************************
;* Jmeno funkce		: TRAN_USART_TEXT
;* Popis			: Podprogram pro vyslani retezce dat pres USART1
;* Vstup			: R0 = adresa retezce
;* Vystup			: Zadny
;* Komentar			: Je vyslana skupina bajtu az po zarazku ( 0 ) 	
;*********************************************************************************************
TRAN_USART_TEXT	PUSH	{R1, R2, LR}			
				MOV		R1, R0
NEXT_B	 						
				LDRB	R0,[R1],#1 			; nacteni znaku, a inkrementace ukazatele
				CBZ		R0, END_SEND 		; je-li znak null, konec
				BL	 	TRAN_USART			; vyslani znaku pres USART
				B	 	NEXT_B	 			; dalsi znak (bajt)
END_SEND		
				POP		{R1, R2, PC}

;*********************************************************************************************
;* Jmeno funkce		: TRAN_USART
;* Popis			: Podprogram pro vyslani bajtu pres USART1
;* Vstup			: R0 = bajt k vyslani
;* Vystup			: Zadny
;* Komentar			: Je vyslana skupina bajtu az po zarazku ( 0 ) 	
;*********************************************************************************************
TRAN_USART		PUSH	{R1, R2, LR} 
NO_RDY_TRAN	
				LDR 	R1, =USART_SR
				LDR 	R2, [R1] 		
				TST 	R2, #0x40 			; test vyprazdeni vysilaciho bufferu 
				BEQ 	NO_RDY_TRAN			; skok pri nevyprazdnenem bufferu
				LDR 	R1, =USART_DR 	
				STRB 	R0, [R1] 			; ulozeni bajtu do vysilaciho registru
				LDRB 	R2, [R1] 			; prazdne vycteni DR a nulovani priznaku
							
				POP 	{R1, R2, PC} 
							
;*********************************************************************************************
;* Jmeno funkce		: UART_CNF
;* Popis			: Konfigurace USART1 pro prijem i vysilani
;* Vstup			: Zadny
;* Vystup			: Zadny
;* Komentar			: Nastaveni USART1 s prenosovou rychlosti 9600Bd
;*					 (1 start bit, 8 data bit , 1 stop bit) 	
;*********************************************************************************************					
USART_CNF		PUSH	{LR}

				LDR		R0, =USART_BRR	   ; BAUD RATE registr
				LDR		R1, =0x009C4	   ; RATE 9600Bd (156.25 PRO 24MHz), 156 = 0x9C0, 0,25 = 0x4 
				STR		R1, [R0]

				LDR		R0, =USART_CR1	   ; control registr
				LDR		R1, [R0]
				LDR		R2, =0x200C	   	   ; USART povolen (UE = 1), vysilani i prijem povoleno (TE = 1),RE = 1
				ORR		R1, R1, R2 
				STR		R1, [R0]
				
				POP		{PC}

;*********************************************************************************************
;* Jmeno funkce		: RCC_CNF
;* Popis			: Konfigurace systemovych hodin a hodin periferii
;* Vstup			: Zadny
;* Vystup			: Zadny
;* Komentar			: Nastaveni PLL jako zdroj hodin systemu (24MHz),
;*  				a privedeni hodin na branu A, AFIO a USART1 	
;*********************************************************************************************
RCC_CNF	
				LDR		R0, =RCC_CR
				LDR		R1, [R0]
				BIC		R1, R1, #0x50000	; HSE oscilator OFF (HSEON),ext.oscilator NOT BZPASSED(HSEBYP) 
				STR		R1, [R0]

				LDR		R0, =RCC_CR
				LDR		R1, [R0]
				ORR		R1, R1, #0x10000		
				STR		R1, [R0]			; HSE zapnut
NO_HSE_RDY		LDR		R1, [R0]
				TST	 	R1, #0x20000		; test stability HSE
				BEQ 	NO_HSE_RDY			; skok pri nestabilite
	
				LDR		R0, =RCC_CFGR		; NENI NUTNE, JE PO RESETU
				LDR		R1, [R0]
				BIC		R1, R1, #0xF0	   	; SCLK nedeleno
				STR		R1, [R0]

				LDR		R1, [R0]			; NENI NUTNE, JE PO RESETU
				BIC		R1, R1, #0x3800		; HCLK nedeleno (PPRE2)
				STR		R1, [R0]

				LDR		R1, [R0]
				BIC		R1, R1, #0x700		; HCLK nedeleno	(PPRE1)
				ORR		R1, R1, #0x400		; HCLK/2
				STR		R1, [R0]			; HCLK/2
			
				LDR		R0, =RCC_CFGR
				LDR		R1, [R0]
				BIC		R1, R1, #0x3F0000	; nuluje PLLMUL, PLLXTPRE, PLLSRC
				LDR		R2, =0x050400		; PLL x3, HSE jako PLL vstup, HCLK/2  =24MHz Clk
				ORR		R1, R1, R2				
				STR		R1, [R0]				 

				LDR		R0, =PLLON			; (ADRESA BIT BANDING)
				MOV		R1, #0x01			; povoleni PLL 
				STR		R1, [R0]
				LDR		R0, =RCC_CR
				LDR		R1, [R0]
NO_PLL_RDY		LDR		R1, [R0]
				TST		R1, #0x2000000		; test spusteni PLL
				BEQ		NO_PLL_RDY			; skok pri neuzamceni

				LDR		R0, =RCC_CFGR
				LDR		R1, [R0]
				BIC		R1, R1, #0x3		; HSI jako hodiny
			;	ORR		R1, R1, #0x1		; HSE jako hodiny
				ORR		R1, R1, #0x2		; PLL jako hodiny
				STR		R1, [R0]			; PLL je zdroj hodin

				LDR		R0, =RCC_APB2ENR
				LDR		R1, [R0]
				LDR		R2, =0x4015			; hodiny na AFIO, PA, PC, USART1
				ORR		R1, R1, R2				
				STR		R1, [R0]

				BX		LR					; navrat z podprogramu
 
;*********************************************************************************************
;* Jmeno funkce		: GPIO_CNF
;* Popis			: Konfigurace brany a USART
;* Vstup			: Zadny
;* Vystup			: Zadny
;* Komentar			: Nastaveni PA9 jako vystup alternativni funkce push-pull 
;*					  ostatni jako plovouci vstup	
;*********************************************************************************************
GPIO_CNF
				LDR		R2, =0xF0			; konstanta pro nulovani nastaveni bitu 10	
				LDR		R0, =GPIOA_CRH	 	; konfiguracni registr
				LDR		R1, [R0]	   		
				BIC		R1, R1, R2 			; PA9
				LDR		R2, =0xB0
				ORR		R1, R1, R2			; PA9 jako vystup alter. fce push-pull
				STR		R1, [R0]
									
											; PA10 je jiz po resetu nastaven jako plovouci vstup
				BX		LR
				
;*********************************************************************************************		
				;NOP
				END
