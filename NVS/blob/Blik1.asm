;***************************************************************************************************
;*
;* Misto			: CVUT FEL, Katedra Mereni
;* Prednasejici		: Doc. Ing. Jan Fischer,CSc.
;* Predmet			: A4M38AVS
;* Vyvojovy Kit		: STM32 VL DISCOVERY (STM32F100RB)
;*
;**************************************************************************************************
;*
;* JMÉNO SOUBORU	: LED_BLIK.ASM
;* AUTOR			: Michal TOMÁŠ
;* DATUM			: 12/2010
;* POPIS			: Program pro blikani LED na vyvodu PC8.
;*					  - konfigurace hodin na frekvenci 24MHz (HSE + PLL) 
;*					  - konfigurace pouzitych vyvodu procesotu (PC8 jako vystup)
;*					  - rozblikani LED na PC8
;* Poznamka			: Tento soubor obsahuje podrobny popis kodu vcetne vyznamu pouzitych instrukci
;*
;*    +  doplnky 2018 PROC, ENDP
;***************************************************************************************************
				
		AREA    STM32F1xx, CODE, READONLY  	; hlavicka souboru
	
		GET		INI_1.s					; vlozeni souboru s pojmenovanymi adresami
										; jsou zde definovany adresy pristupu do pameti (k registrum)
										
konst	EQU		100						; direktiva EQU priradi vyrazu 'konst' hodnotu 100 dekadicky
doba	EQU		0x10000					; direktiva EQU priradi vyrazu 'doba' hodnotu 10000 hexadecimálnì

											
		EXPORT	__main					; export navesti pouzivaneho v jinem souboru, zde konkretne
		EXPORT	__use_two_region_memory	; jde o navesti, ktere pouziva startup code STM32F10x.s
		
__use_two_region_memory	
__main								  						
		
		ENTRY							; vstupni bod do kodu, odtud se zacina vykonavat program

;***************************************************************************************************
;* Jmeno funkce		: MAIN
;* Popis			: Hlavni program + volani podprogramu nastaveni hodinoveho systemu, konfigurace
;*					  pouzitych vyvodu procesoru a rutina pro sofwarove spozdeni	
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
LOOP
				LDR		R2, =GPIOC_ODR	; Kopie adresy brany C ODR do R2, GPIOC_ODR je v souboru INI.S			
                     ;LDR		R2, =CODR8        ;adresa pro bitove adresovani PC8, zapisuje se pouze jediny bit- nejnizsi bit ze slova
									;  zkuste zamenit dva predchazejici radky  zamenou stredniku a jeste dale nize
										; Navesti LOOP hlani smysky	
				MOV		R1, #0			; Vlozeni hodnoty 0 do R1
   							
				STR		R1, [R2]		; Zapis hodnoty v R1 na adresu v R2, tj. nulovani vsech bitu
										; na brane C (LED na PC8 nesviti)

				MOV		R0,#konst		; Vlozeni do RO hodnoty prodlevy, tj. 100 dekadicky
										; RO je v tomto pripade jako vstupni parametr podprogramu DELAY
				BL		DELAY			; Volani podprogramu DELAY s ulozenim navratove adresy do LR 
		
				MOV		R1, #0x100	    ; Vlozeni hodnoty 0x100 do R1, konstanta pro bit 8
										; zkuste zamenit radky vyse
							;       MOV		R1, #0x1   	;alternativni zpusob bitovym adresovanim jedineho bitu brany Bit Banding
										; zkuste zamenit dva predchazejici radky 
				STR		R1, [R2]		; Zapis hodnoty v R1 na adresu v R2, tj. nastaveni bitu 8
										; na brane C (LED na PC8 sviti), ostatni bity 0-7 a 9-15 
										; jsou nulovany

				MOV		R0,#konst		; opet vlozeni hodnoty prodlevy do R0, zde tato isntrukce jiz
										; neni nutna nebot hodnota v R0 nebyla prepsana, ale takto 
										; je to jistejsi
				BL		DELAY			; volani podprogramu pro zpozdeni
				
				
				B		LOOP			; skok na navesti LOOP, tj. nekonecke opakovani smycky (LED blika)
				
;***************************************************************************************************
;* Jmeno funkce		: RCC_CNF
;* Popis			: Konfigurace systemovych hodin a hodin periferii
;* Vstup			: Zadny
;* Vystup			: Zadny
;* Komentar			: Nastaveni PLL jako zdroj hodin systemu (24MHz),
;*  				  a privedeni hodin na branu C 	
;**************************************************************************************************
RCC_CNF			PROC
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
				LDR		R2, =0x10		; Konstanta pro zapnuti hodin pro branu C
				ORR		R1, R1, R2		; Maskovani		
				STR		R1, [R0]		; Ulozeni nove hodnoty

				BX		LR				; Navrat z podprogramu, skok na adresu v LR
				ENDP					; konec podprogramu
 
;**************************************************************************************************
;* Jmeno funkce		: GPIO_CNF
;* Popis			: Konfigurace brany C
;* Vstup			: Zadny
;* Vystup			: Zadny
;* Komentar			: Nastaveni PC08 jako vystup (10MHz)	
;**************************************************************************************************
GPIO_CNF		PROC					; Navesti zacatku podprogramu
				LDR		R2, =0xF		; Konstanta pro nulovani nastaveni bitu 8	
				LDR		R0, =GPIOC_CRH	; Kopie adresy GPIOC_CRH (Port Configuration Register High)
										; do R0, GPIOC_CRH je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x1		; Vlozeni 1 do R2
				ORR		R1, R1, R2		; maskovani, bit 8 nastven jako vystup push-pull v modu 1 (10MHz)
				STR		R1, [R0]		; Ulozeni konfigurace PCO8

				BX		LR				; Navrat z podprogramu, skok na adresu v LR
				ENDP					; konec podprogramu			

;**************************************************************************************************
;* Jmeno funkce		: DELAY
;* Popis			: Softwarove zpozdeni procesoru
;* Vstup			: R0 = pocet opakovani cyklu spozdeni
;* Vystup			: Zadny
;* Komentar			: Podprodram zpozdi prubech vykonavani programu	
;**************************************************************************************************
DELAY 			PROC						; Navesti zacatku podprogramu
				PUSH	{LR}		    ; Ulozeni hodnoty navratove adresy - LR do zasobniku 
										; 
WAIT1			
				LDR		R3, =doba		; Vlozeni konstanty doba pro prodlevu do R3
WAIT			SUBS	R3, R3, #1		; Odecteni 1 od R3,tj. R3 = R3 - 1 a nastaveni priznakoveho registru   	
				BNE		WAIT			; Skok na navesti pri nenulovosti R3 (skok dle priznaku)
				SUBS	R0, R0, #1		; Odecteni 1 od R0,tj. R0 = R0 - 1 a nastaveni priznakoveho registru
				BNE		WAIT1			; dokud není nula v R0, skoci na wait1											  
			
						                 ; Navrat z podprogramu, obnoveni hodnoty LR ze zasobniku
			   	POP 		{LR}				
				BX 		LR		; a navrat cdo hlavního programu
			;	POP		{PC}		; jednodussi varianta POP misto predchozich dvou radku
				ENDP					; konec podprogramu
;**************************************************************************************************
				END						; Konec programu, dal jiz kod prekladac nerelozi
