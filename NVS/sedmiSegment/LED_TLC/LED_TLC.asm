;***************************************************************************************************
;*
;* Misto			: CVUT FEL, Katedra Mereni
;* Prednasejici		: Doc. Ing. Jan Fischer,CSc.
;* Predmet			: A4M38AVS
;* Vyvojovy Kit		: STM32 VL DISCOVERY (STM32F100RB)
;*
;**************************************************************************************************
;*
;* JMÉNO SOUBORU	: LED_TLC.ASM
;* AUTOR			: JAKUB JIRA
;* DATUM			: 10/2020
;* POPIS			: Schodistovy automat
;*
;***************************************************************************************************
		AREA MOJEDATA, DATA, NOINIT, READWRITE
INIT_VALUE_L 	SPACE 4
INIT_VALUE_H 	SPACE 4
CURR_VALUE_L 	SPACE 4
CURR_VALUE_H	SPACE 4

			
		AREA    STM32F1xx, CODE, READONLY  	; hlavicka souboru

		GET		INI.s					; vlozeni souboru s pojmenovanymi adresami
										; jsou zde definovany adresy pristupu do pameti (k registrum)

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++										
ONE_SECOND_CONST EQU  0x3E0			; neni to v zadnem pripade presna hodnota jedne sekundy, udelano zhruba
;HALF_SECOND_CONST EQU 0x100000		
;STEADY_LIGHT_CONST EQU	0x5
;MAX_LIGHT_CONST EQU 	0xF	
DISPLAYABLE_MAX EQU 0xA
numbers DCD 2_01100000, 2_11011010, 2_11110010, 2_01100110, 2_10110110, 2_10111111, 2_11100000, 2_11111110, 2_11110111, 2_11111100
initial_counter_value DCD 6
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++										

											
		EXPORT	__main					; export navesti pouzivaneho v jinem souboru, zde konkretne
		EXPORT	__use_two_region_memory	; jde o navesti, ktere pouziva startup code STM32F10x.s
		
__use_two_region_memory	
__main								  						
		
		ENTRY							; vstupni bod do kodu, odtud se zacina vykonavat program

;***************************************************************************************************
;* Jmeno funkce		: MAIN
;* Popis			: Hlavni program + volani podprogramu nastaveni hodinoveho systemu a konfigurace
;*					  pouzitych vyvodu procesoru	
;* Vstup			: Zadny
;* Vystup			: Zadny
;***************************************************************************************************

MAIN									; MAIN navesti hlavni smycky programu											
				BL		RCC_CNF			; Volani podprogramu nastaveni hodinoveho systemu procesoru
										; tj. skok na adresu s navestim RCC_CNF a ulozeni navratove 
										; adresy do LR (Link Register)
				BL		GPIO_CNF		; Volani podprogramu konfigurace vyvodu procesoru
										; tj. skok na adresu s navestim GPIO_CNF 
										;*!* Poznamka pri pouziti volani podprogramu instrukci BL nesmi
										; byt v obsluze podprogramu tato instrukce jiz pouzita, nebot
										; by doslo k prepsani LR a ztrate navratove adresy ->
										; lze ale pouzit i jine instrukce (PUSH, POP) *!*

				LDR		R2, =GPIOC_ODR	; Kopie adresy brany C ODR do R2, GPIOC_ODR je v souboru INI.S			
										; ODR - Output Data Register
				LDR		R5, =GPIOA_IDR 	; Kopie adresy brany A IDR do R5, GPIOA_IDR je v souboru INI.S			
										; IDR - Input Data Register
				MOV 	R1, #5
				LDR.W 	R0, =INIT_VALUE_L
				STRB	R1, [R0]				
START			
				LDR.W 	R0, =INIT_VALUE_L
				LDRB	R3, [R0]	
				LDR.W 	R0, =CURR_VALUE_L
				STRB	R3, [R0]
				
				MOV		R4,#0			; Vlozeni 0 do R4, nulovani citace (softwarový citac registr R4)
				
				MOV		R1, #0x0000	
				STR		R1, [R2]		; Zhasnuti obou diod

				;LDR 	R0, numbers
				
				;MOV 	R0, R3
				BL 		UPDATE_DISPLAY

INIT_LOOP			
				BL HANDLE_ADD_BUTTON
				
				BL HANDLE_SUB_BUTTON			
				
				BL HANDLE_ENTER_BUTTON

				; Testovani stisku tlacitka
				LDR		R5, =GPIOA_IDR
				LDR		R1, [R5]		 
				TST		R1, #0x1
										
				BEQ		INIT_LOOP
				
				MOV		R1, #0x0100	
				STR		R1, [R2]
				
				; Delay nastaveny na 1ms pro vyreseni odskoku tlacitka
				MOV		R0, #1
				BL		DELAY			
				
				; Po uplynuti delay opetovne testovani stisku tlacitka
				LDR		R1, [R5]
				TST		R1, #0x1		
				
				BEQ		START
			
TEST_REALEASE_OF_BUTTON
				
				; Test uvolneni tlacitka
				LDR		R1, [R5]		
				TST		R1, #0x1
										
				
				BNE		TEST_REALEASE_OF_BUTTON
				
				; Rozsviceni svetla
				MOV		R1, #0x0300
				STR		R1, [R2]
				MOV		R6, #0x1
				
				LDR.W 	R0, =INIT_VALUE_L
				LDRB	R3, [R0] 
				LDR.W	R0, =CURR_VALUE_L
				STRB	R3, [R0]
				BL UPDATE_DISPLAY			
				
COUNTDOWN
	
				; Test tlacitka
				LDR		R1, [R5]
				TST		R1, #0x1
				
				BNE 	BUTTON_PRESSED
				
				BL		DELAY
				
				; Inkrementace pocitadla a pripadny skok, pokud jeste nebyla napocitana sekunda
				ADD		R4,R4,#0x1
				CMP 	R4, #ONE_SECOND_CONST
				BLT		NOT_YET_SECOND
				
				;Odecteni citace
					BL 		HANDLE_COUNTDOWN
					MOV		R4, #0
NOT_YET_SECOND		
				B		COUNTDOWN

BUTTON_PRESSED
				; Test tlacitka
				LDR		R1, [R5]
				TST		R1, #0x1
				
				BNE 	INIT_SKIP
				
				LDR.W 	R0, =INIT_VALUE_L
				LDRB	R3, [R0]
				LDR.W	R0, =CURR_VALUE_L
				STRB	R3, [R0]
				
				BL 		UPDATE_DISPLAY
				MOV		R4, #0x0
				MOV		R1, #0x0300
				
				STR		R1, [R2]
				B COUNTDOWN
INIT_SKIP
				; Dekrementace pocitadla a pripadny skok, pokud jeste nebyla napocitana sekunda
				BL DELAY
				
				ADD		R4,R4,#0x1
				CMP 	R4, #ONE_SECOND_CONST
				
				BLT		NOT_YET_SECOND_1
				
				BL		HANDLE_COUNTDOWN
				MOV		R4, #0
NOT_YET_SECOND_1		
				B		BUTTON_PRESSED
				
;***************************************************************************************************
;* Jmeno funkce		: HANDLE_COUNTDOWN
;* Popis			: Resi odpocet, odecte jednu sekundu
;* Vstup			: Zadny
;* Vystup			: Zadny	
;**************************************************************************************************	
HANDLE_COUNTDOWN
				PUSH	{R0,R3,R6,LR}

				LDR.W 	R6, =CURR_VALUE_L
				LDRB	R3, [R6]
				SUB		R3, R3, #1	
				
				CMP		R3, #0
				BEQ		START

				STRB	R3, [R6]			
				BL UPDATE_DISPLAY
				
				POP		{R0,R3,R6,PC}				
				

;***************************************************************************************************
;* Jmeno funkce		: HANDLE_ENTER_BUTTON
;* Popis			: Potvrzuje vybranou hodnotu
;* Vstup			: R3 - inkrementace pocitadla
;* Vystup			: Zadny	
;**************************************************************************************************	
HANDLE_ENTER_BUTTON
				PUSH	{R0,R6,LR}

				LDR		R0, =GPIOA_IDR
				
				LDR		R6, [R0]
				TST		R6, #0x800
				
				BEQ		SKIP_ENTER
				BL DELAY
				
				LDR		R6, [R0]
				TST		R6, #0x800
				
				BEQ		SKIP_ENTER
				
				LDR.W 	R6, =CURR_VALUE_L
				LDRB	R3, [R6]
				LDR.W 	R6, =INIT_VALUE_L
				STRB	R3, [R6]
				
WAIT_FOR_RELEASE_ENTER
				LDR		R6, [R0]		 
				TST		R6, #0x800
				BNE		WAIT_FOR_RELEASE_ENTER
SKIP_ENTER
				
				POP		{R0,R6,PC}	
				
;***************************************************************************************************
;* Jmeno funkce		: HANDLE_SUB_BUTTON
;* Popis			: Odecte 1 od display, osetruje preteceni
;* Vstup			: R3 - inkrementace pocitadla
;* Vystup			: Zadny	
;**************************************************************************************************	
HANDLE_SUB_BUTTON
				PUSH	{R0,R6,LR}
				LDR		R0, =GPIOB_IDR
				LDR		R6, [R0]		 
				TST		R6, #0x200
				
			    BEQ		SKIP_SUB
				
				BL DELAY
				
				LDR		R6, [R0]		 
				TST		R6, #0x200
				
				BEQ		SKIP_SUB
				
				LDR.W	R6, =CURR_VALUE_L
				LDRB	R3, [R6]
				
				CMP 	R3, #1
				BEQ		SKIP_SUB_OVERFLOW
				SUB		R3, R3, #1
				STRB	R3, [R6]
SKIP_SUB_OVERFLOW
				BL UPDATE_DISPLAY
				
WAIT_FOR_RELEASE_SUB
				LDR		R6, [R0]		 
				TST		R6, #0x200
				BNE		WAIT_FOR_RELEASE_SUB
SKIP_SUB
				
				POP		{R0,R6,PC}	
;***************************************************************************************************
;* Jmeno funkce		: HANDLE_ADD_BUTTON
;* Popis			: Pricte 1 k display, osetruje preteceni
;* Vstup			: R3 - inkrementace pocitadla
;* Vystup			: Zadny	
;**************************************************************************************************	
HANDLE_ADD_BUTTON
				PUSH	{R0,R6,LR}
				LDR		R0, =GPIOB_IDR
				LDR		R6, [R0]		 
				TST		R6, #0x100
				
				BEQ		SKIP_ADD
				
				BL DELAY
				
				LDR		R6, [R0]		 
				TST		R6, #0x100
				BEQ		SKIP_ADD
				
				LDR.W	R6, =CURR_VALUE_L
				LDRB	R3, [R6]
				
				CMP 	R3, #DISPLAYABLE_MAX
				BEQ		SKIP_ADD_OVERFLOW
				ADD		R3, R3, #1
				STRB	R3, [R6]
SKIP_ADD_OVERFLOW
				BL UPDATE_DISPLAY
WAIT_FOR_RELEASE_ADD
				LDR		R6, [R0]		 
				TST		R6, #0x100
				BNE		WAIT_FOR_RELEASE_ADD
SKIP_ADD
				
				POP		{R0,R6,PC}
;***************************************************************************************************
;* Jmeno funkce		: UPDATE_DISPLAY
;* Popis			: Upraví 7-mi segmentovy display
;* Vstup			: R3 - jake cislo se ma zobrazit
;* Vystup			: Zadny
;**************************************************************************************************	
UPDATE_DISPLAY
				PUSH	{R0,R1,R2,R3,R6,LR}
				LDR.W	R1, =CURR_VALUE_L
				LDRB	R0, [R1] 
				SUB		R0, R0, #1
				LSL		R0, R0, #2
				adr 	R1,numbers
				ADD		R0, R0, R1
				LDR		R1, [R0]
				MOV 	R0, #8
				EOR		R1, R1, #0xFF
				
				LDR		R6, =GPIOB_ODR
				
DOWHILE			
				AND 	R2, R1, #2_00000001
				LSL		R2, R2, #7
				ORR		R2, R2, #0x7F
				AND		R2, R2, #0xA0
				MOV		R3, #0x20
				STR		R3, [R6]
				ORR		R2, R2, R3
				STR		R2, [R6]
				ORR		R2, R2, #0x40
				STR		R2, [R6]
				
				LSRS	R1, R1, #1
				
				SUBS	R0, R0, #1
				BNE		DOWHILE
				
				;ORR 	R2, R2, #0x300
				;STR		R2, [R6]
				;LDR		R5, =GPIOB_ODR
				
				
				;ORR		R1, R1, #0x300
				;MOV 	R0, #0x300
				;BIC		R1, R1, R0;
				;MOV		R0, #0x300
				;ORR		R1, R1, R0
				;STR		R1, [R5]
				
				POP		{R0,R1,R2,R3,R6,PC}
;***************************************************************************************************
;* Jmeno funkce		: RCC_CNF
;* Popis			: Konfigurace systemovych hodin a hodin periferii
;* Vstup			: Zadny
;* Vystup			: Zadny
;* Komentar			: Nastaveni PLL jako zdroj hodin systemu (24MHz),
;*  				  a privedeni hodin na branu A, B a C 	
;**************************************************************************************************
RCC_CNF	
				LDR		R0, =RCC_CR		; Kopie adresy RCC_CR (Clock Control Register) do R0,
										; RCC_CRje v souboru INI.S			
				LDR		R1, [R0]		; Nacteni obsahu registru na adrese v R0 do R1
				BIC		R1, R1, #0x50000; Editace hodnoty v R1, tj. nulovani hodnoty, kde je '1'
										; HSE oscilator OFF (HSEON), ext.oscilator NOT BZPASSED(HSEBYP) 
				STR		R1, [R0]		; Ulozeni editovane hodnoty v R1 na adresu v R0 
 
				LDR		R1, [R0]		; Opet nacteni do R1 stav registru RCC_CR
				ORR		R1, R1, #0x10000; Maska pro zapnuti HSE	(krystalovy oscilator)	
				STR		R1, [R0]		; HSE zapnut
NO_HSE_RDY		LDR		R1, [R0]		; Nacteni do R1 stav registru RCC_CR
				TST	 	R1, #0x20000	; Test stability HSE, (R0 & 0x20000)
				BEQ 	NO_HSE_RDY		; Skok pri nestabilite, pri stabilite se pokracuje v kodu
	
				LDR		R0, =RCC_CFGR	; Nacteni adresy RCC_CFGR (Clock Configuration Register) do R0
				LDR		R1, [R0]		; Nacteni do R1 stav registru RCC_CFGR
				BIC		R1, R1, #0xF0	; Editace, SCLK nedeleno
				STR		R1, [R0]		; Ulozeni noveho stavu do RCC_CFGR 

				LDR		R1, [R0]		; Opet nacteni RCC_CFGR
				BIC		R1, R1, #0x3800	; Editace, HCLK nedeleno (PPRE2)
				STR		R1, [R0]		; Ulozeni nove hodnoty

				LDR		R1, [R0]		; Opet nacteni RCC_CFGR
				BIC		R1, R1, #0x700	; HCLK nedeleno	(PPRE1)
				ORR		R1, R1, #0x400	; Maskovani, konstanta pro HCLK/2
				STR		R1, [R0]		; Ulozeni nove hodnoty
			
				LDR		R1, [R0]		 ; Opet nacteni RCC_CFGR
				BIC		R1, R1, #0x3F0000; Nuluje PLLMUL, PLLXTPRE, PLLSRC
				LDR		R2, =0x50000	 ; Maska, PLL x3, HSE jako PLL vstup =24MHz Clk
				ORR		R1, R1, R2		 ; Maskovani, logicky soucet R1 a R2	
				STR		R1, [R0]		 ; Ulozeni nove hodnoty		 

				LDR		R0, =PLLON		; Nacteni adresy bitu PLLON do R0(ADRESA BIT BANDING)
				MOV		R1, #0x01		; Konstanta pro povoleni PLL (fazovy zaves) 
				STR		R1, [R0]		; Ulozeni nove hodnoty

				LDR		R0, =RCC_CR		; Kopie adresy  RCC_CR do R0
NO_PLL_RDY		LDR		R1, [R0]		; Nacteni stavu registru RCC_CR do R1
				TST		R1, #0x2000000	; Test spusteni PLL (test stability)
				BEQ		NO_PLL_RDY		; Skok na navesti NO_PLL_RDY pri nespustene PLL

				LDR		R0, =RCC_CFGR	; Kopie adresy RCC_CFGR do R0
				LDR		R1, [R0]		; Nacteni stavu registru RCC_CFGR do R1
				BIC		R1, R1, #0x3	; HSI jako hodiny
			;	ORR		R1, R1, #0x1	; Maskovani, HSE jako hodiny
				ORR		R1, R1, #0x2	; Maskovani, PLL jako hodiny
				STR		R1, [R0]		; PLL je zdroj hodin

				LDR		R0, =RCC_APB2ENR; Kopie adresy RCC_APB2ENR (APB2 peripheral clock enable register) do R0  
				LDR		R1, [R0]		; Nacteni stavu registru RCC_APB2ENR do R1
				LDR		R2, =0x1C		; Konstanta pro zapnuti hodin pro branu A, B a C
				ORR		R1, R1, R2		; Maskovani		
				STR		R1, [R0]		; Ulozeni nove hodnoty

				BX		LR				; Navrat z podprogramu, skok na adresu v LR
 
;**************************************************************************************************
;* Jmeno funkce		: GPIO_CNF
;* Popis			: Konfigurace brany A a C
;* Vstup			: Zadny
;* Vystup			: Zadny
;* Komentar			: Nastaveni PC08 a PC09 jako vystup (10MHz), PA0 jako vstup push-pull	
;**************************************************************************************************
GPIO_CNF								; Navesti zacatku podprogramu
				LDR		R2, =0xFF		; Konstanta pro nulovani nastaveni bitu 8, 9	
				LDR		R0, =GPIOC_CRH	; Kopie adresy GPIOC_CRH (Port Configuration Register High)
										; do R0, GPIOC_CRH je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x11		; Vlozeni 1 do R2
				ORR		R1, R1, R2		; maskovani, bit 8, 9 nastven jako vystup push-pull v modu 1 (10MHz)
				STR		R1, [R0]		; Ulozeni konfigurace PCO9 a PC09

				LDR		R2, =0xF		; Konstanta pro nulovani nastaveni bitu 0	
				LDR		R0, =GPIOA_CRL	; Kopie adresy GPIOA_CRL (Port Configuration Register Low)
										; do R0, GPIOA_CRL je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x8		; Vlozeni 1 do R2
				ORR		R1, R1, R2		; maskovani, bit 0 nastven jako push-pull vstup
				STR		R1, [R0]		; Ulozeni konfigurace PAO0
				
				LDR		R2, =0xFF000000	; Konstanta pro nulovani nastaveni bitu 0	
				LDR		R0, =GPIOB_CRL	; Kopie adresy GPIOB_CRL (Port Configuration Register Low)
										; do R0, GPIOB_CRL je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x11000000	; Vlozeni 11100000 do R2
				ORR		R1, R1, R2		; maskovani, bit 0 nastven jako push-pull výstup
				STR		R1, [R0]		; Ulozeni konfigurace PB05, PB06, PB07

				LDR		R2, =0xF00000	; Konstanta pro nulovani nastaveni bitu 0	
				LDR		R0, =GPIOB_CRL	; Kopie adresy GPIOB_CRL (Port Configuration Register Low)
										; do R0, GPIOB_CRL je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x100000	; Vlozeni 11100000 do R2
				ORR		R1, R1, R2		; maskovani, bit 0 nastven jako push-pull výstup
				STR		R1, [R0]		; Ulozeni konfigurace PB05
				
				LDR		R2, =0xFF		; Konstanta pro nulovani nastaveni bitu 0	
				LDR		R0, =GPIOB_CRH	; Kopie adresy GPIOB_CRH (Port Configuration Register High)
										; do R0, GPIOB_CRH je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x88		; Vlozeni 0x88 do R2
				ORR		R1, R1, R2		; maskovani, bit 8, 9 nastven jako push-pull vstup
				STR		R1, [R0]		; Ulozeni konfigurace PB08, PB09
				
				LDR		R2, =0xF000		; Konstanta pro nulovani nastaveni bitu 0	
				LDR		R0, =GPIOA_CRH	; Kopie adresy GPIOA_CRH (Port Configuration Register High)
										; do R0, GPIOA_CRH je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x8000		; Vlozeni 0x800 do R2
				ORR		R1, R1, R2		; maskovani, bit 11 nastven jako push-pull vstup
				STR		R1, [R0]		; Ulozeni konfigurace PA11
				
				LDR		R2, =0xFF000000	; Konstanta pro nulovani nastaveni bitu 0	
				LDR		R0, =GPIOC_CRL	; Kopie adresy GPIOC_CRL (Port Configuration Register Low)
										; do R0, GPIOC_CRL je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x88000000	; Vlozeni 10000000 do R2
				ORR		R1, R1, R2		; maskovani, bit 0 nastven jako push-pull výstup
				STR		R1, [R0]		; Ulozeni konfigurace PB05, PB06, PB07 
				

				BX		LR	

;**************************************************************************************************
;* Jmeno funkce		: DELAY
;* Popis			: Softwarove zpozdeni procesoru
;* Vstup			: R0 = pocet opakovani cyklu spozdeni
;* Vystup			: Zadny
;* Komentar			: Podprodram zpozdi prubech vykonavani programu	
;**************************************************************************************************
DELAY 									; Navesti zacatku podprogramu
				PUSH	{R2, LR}		; Ulozeni hodnoty R2 do zasobniku (R2 muze byt editovan)
										; a ulozeni navratove adresy do zasobniku
WAIT1			
				LDR		R2, =8056		; Vlozeni konstanty pro prodlevu do R2
WAIT			SUBS	R2, R2, #1		; Odecteni 1 od R2,tj. R2 = R2 - 1 a nastaveni priznakoveho registru   	
				BNE		WAIT			; Skok na navesti pri nenulovosti R2 (skok dle priznaku)
				
				POP		{R2, PC}		; Navrat z podprogramu, obnoveni hodnoty R2 ze zasobniku
										; a navratove adresy do PC

DO_A_BLIK
				PUSH	{R2, LR}		; Ulozeni hodnoty R2 do zasobniku (R2 muze byt editovan)
				
				TST		R6, #0x1
				BEQ		PART_2
				
				MOV 	R1, #0x0000
				STR		R1, [R2]
				
				MOV		R0, #0x50
				BL		DELAY
				
				MOV 	R1, #0x0300
				STR		R1, [R2]
				
				B BREAK

PART_2
				MOV 	R1, #0x0300
				STR		R1, [R2]
				
				MOV		R0, #0x50
				BL		DELAY
				
				MOV 	R1, #0x0000
				STR		R1, [R2]

BREAK
				POP		{R2, PC}
;**************************************************************************************************
				NOP
				ALIGN
				END	
