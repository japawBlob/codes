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
;* DATUM			: 12/2020
;* POPIS			: Schodistovy automat
;*
;***************************************************************************************************
;Prosto pro ulozeni cisel
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
DISPLAYABLE_MAX EQU 0xA
numbers_L DCD 2_11111100, 2_01100000, 2_11011010, 2_11110010, 2_01100110, 2_10110110, 2_10111111, 2_11100000, 2_11111110, 2_11110111

WELCOME_MESSAGE	DCB		"\r\nThis is simple countdown program.\r\nControls are:\t\'+\' - Adding one second\r\n\t\t\'-\' - Subtracting one second\r\n\t\t\' \' - Confirming selection\r\n\t\t\'s\' - Starting countdown\r\n\t\t\'h\' - Display help",0xA, 0xD, 0; definovani konstanty retezce
DATA_TEXT		DCB		" :symbol (RECEIVED) ",0xA, 0xD, 0;
START_MESSAGE	DCB		"Countdown STARTED",0xA, 0xD, 0;
END_MESSAGE		DCB		"Countdown ENDED",0xA, 0xD, 0;


	
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
				BL		USART_CNF		; skok na podprogram nastaveni USART	


				LDR		R2, =GPIOC_ODR	; Kopie adresy brany C ODR do R2, GPIOC_ODR je v souboru INI.S			
										; ODR - Output Data Register
				LDR		R5, =GPIOA_IDR 	; Kopie adresy brany A IDR do R5, GPIOA_IDR je v souboru INI.S			
										; IDR - Input Data Register
										
										
										
				LDR		R0, =WELCOME_MESSAGE	; nacteni adresy retezce
				BL		TRAN_USART_TEXT		; vyslani textoveho retezce								
				
				LDR.W 	R0, =INIT_VALUE_L
				MOV 	R1, #5
				STRB	R1, [R0]
				
				LDR.W 	R0, =INIT_VALUE_H
				MOV 	R1, #1
				STRB	R1, [R0]
			
START			
				LDRB	R3, [R0]
				MOV		R4,#0			; Vlozeni 0 do R4, nulovani citace (softwarový citac registr R4)
				
				MOV		R1, #0x0000	
				STR		R1, [R2]		; Zhasnuti obou diod
				
				LDR.W 	R0, =INIT_VALUE_H
				LDRB	R1, [R0]
				LDR.W 	R0, =CURR_VALUE_H
				STRB	R1, [R0]
				
				LDR.W 	R0, =INIT_VALUE_L
				LDRB	R1, [R0]
				LDR.W 	R0, =CURR_VALUE_L
				STRB	R1, [R0]
				BL 		UPDATE_DISPLAY

INIT_LOOP		
				BL		REC_USART			; prijem bajtu pres USART

				BL HANDLE_ADD_BUTTON		; Testovani ADD tlacitka
				
				BL HANDLE_SUB_BUTTON		; Testovani SUB tlacitka
				
				BL HANDLE_ENTER_BUTTON		; testovani ENTER tlacitka
				
				LDR		R5, =GPIOB_ODR
				
				BL UPDATE_DISPLAY
				
				LDR		R5, =GPIOA_IDR
				LDR		R1, [R5]		 
				TST		R1, #0x1
										
				BEQ		INIT_LOOP
				
				MOV		R1, #0x0100	
				STR		R1, [R2]
				
				; Delay nastaveny na 1ms pro vyreseni odskoku tlacitka
				MOV		R0, #1
				BL		UPDATE_DISPLAY			
				
				; Po uplynuti delay opetovne testovani stisku tlacitka
				LDR		R1, [R5]
				TST		R1, #0x1		
				
				BEQ		START
			
TEST_REALEASE_OF_BUTTON
				
				BL		UPDATE_DISPLAY
				
				; Test uvolneni tlacitka
				LDR		R1, [R5]		
				TST		R1, #0x1
				
				
				
				BNE		TEST_REALEASE_OF_BUTTON

COUNTDOWN_INIT
				LDR		R0, =START_MESSAGE	; nacteni adresy retezce
				BL		TRAN_USART_TEXT
				
				LDR		R2, =GPIOC_ODR
				; Rozsviceni svetla
				MOV		R1, #0x0300
				STR		R1, [R2]
				MOV		R6, #0x1
				
				LDR.W 	R0, =INIT_VALUE_L
				LDRB	R3, [R0] 
				LDR.W 	R0, =CURR_VALUE_L
				STRB	R3, [R0]
				
				LDR.W 	R0, =INIT_VALUE_H
				LDRB	R1, [R0] 
				LDR.W 	R0, =CURR_VALUE_H
				STRB	R1, [R0]
				
				CMP		R1, #0
				BNE		NOT_ZERO
				CMP		R3, #0
				BNE		NOT_ZERO
				LDR		R0, =END_MESSAGE
				BL		TRAN_USART_TEXT
				B 		START
NOT_ZERO
				
				BL UPDATE_DISPLAY
				
				
COUNTDOWN
				; Test tlacitka
				LDR		R1, [R5]
				TST		R1, #0x1
				
				BNE 	BUTTON_PRESSED
				
				BL		UPDATE_DISPLAY
				
				; Inkrementace pocitadla a pripadny skok, pokud jeste nebyla napocitana sekunda
				ADD		R4,R4,#0x1
				CMP 	R4, #ONE_SECOND_CONST
				BLT		NOT_YET_SECOND
				
				;Odecteni citace
				BL HANDLE_COUNTDOWN
				
CONTINUE_COUNTING
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
				BL UPDATE_DISPLAY
				
				ADD		R4,R4,#0x1
				CMP 	R4, #ONE_SECOND_CONST
				
				BLT		NOT_YET_SECOND_1
				
				SUBS	R3, R3, #0x1
				BNE		CONTINUE_COUNTING_1
				
				B START
CONTINUE_COUNTING_1

				LDR.W	R1, =CURR_VALUE_L
				STRB	R3, [R1]
				BL 		UPDATE_DISPLAY
				MOV		R4, #0
NOT_YET_SECOND_1		
				B		BUTTON_PRESSED

;*********************************************************************************************
;* Jmeno funkce		: REC_USATR
;* Popis			: Podprogram pro prijem dat z USART
;* Vstup			: Zadny
;* Vystup			: R0 = prijaty bajt
;* Komentar			: Je prijat jeden bajt pomoci USART1 	
;*********************************************************************************************
REC_USART		PUSH	{R1, R2, LR}	 		 
									;cekani na prijem bajtu
				LDR 	R1, =USART_SR
				LDR 	R2,[R1] 		
				TST 	R2, #0x20 			; test naplneni cteciho bufferu
				BEQ 	NO_RDY_REC 			; skok pri nenaplnenem bufferu
				LDR 	R1, =USART_DR 	
				LDR		R0,	[R1]			; precteny bajt v RO
				
				
				
				LDR.W 	R6, =CURR_VALUE_L
				LDRB	R3, [R6]
				LDR.W 	R6, =CURR_VALUE_H
				LDRB	R4, [R6]
				
				CMP		R0, #0x2B
				BNE	    NOT_PLUS			; Test zdali prijmuty znak je '+'
				
				CMP 	R3, #9
				BNE		NO_ADD_LOGIC_U		; Test zda je potreba resit preteceni
				CMP		R4, #9
				BEQ		ADD_OVERFLOW_U
				ADD		R4, #1
				MOV		R3, #-1
				
NO_ADD_LOGIC_U
				ADD		R3, #1
ADD_OVERFLOW_U	
				BL		TRAN_USART			; Vyslani uzivateli momentalni hodnotu
				MOV		R0, R4
				ADD		R0, #0x30
				BL 		TRAN_USART
				MOV		R0, R3
				ADD		R0, #0x30
				BL 		TRAN_USART
				MOV		R0, #0xD
				BL		TRAN_USART

				B 		BREAK
NOT_PLUS
				CMP		R0, #0x2D
				BNE		NOT_MINUS			; Test zdali se jedna o '-'
				
				CMP 	R3, #0
				BNE		NO_SUB_LOGIC_U
				CMP		R4, #0
				BEQ		SUB_OVERFLOW_U
				SUB		R4, #1
				MOV		R3, #10
				
NO_SUB_LOGIC_U
				SUB		R3, R3, #1
SUB_OVERFLOW_U	
				BL		TRAN_USART
				MOV		R0, R4
				ADD		R0, #0x30
				BL 		TRAN_USART
				MOV		R0, R3
				ADD		R0, #0x30
				BL 		TRAN_USART
				MOV		R0, #0xD
				BL		TRAN_USART
	
				B BREAK
NOT_MINUS
				
				CMP		R0, #0x20
				BNE		NOT_SPACE			; Test zdali se jedna o ' '
				
				BL		TRAN_USART
				MOV		R0, R4
				ADD		R0, #0x30
				BL 		TRAN_USART
				MOV		R0, R3
				ADD		R0, #0x30
				BL 		TRAN_USART
				MOV		R0, #0xD
				BL		TRAN_USART
				
				LDR.W 	R6, =CURR_VALUE_L
				LDRB	R3, [R6]
				LDR.W 	R6, =INIT_VALUE_L
				STRB	R3, [R6]
				
				LDR.W 	R6, =CURR_VALUE_H
				LDRB	R4, [R6]
				LDR.W 	R6, =INIT_VALUE_H
				STRB	R4, [R6]
				
				B BREAK_AFTER_SAVE
NOT_SPACE				
			
				CMP		R0, #0x73
				BNE		NOT_s				; Test zdali se jedna o 's'
				
				POP {R1, R2}
				
				B COUNTDOWN_INIT
NOT_s			
				CMP		R0, #0x68			; Test zdali se jedna o 'h'
				BNE		NOT_h
				LDR		R0, =WELCOME_MESSAGE
				BL		TRAN_USART_TEXT
			
NOT_h			
				
				
				

BREAK
				LDR.W 	R6, =CURR_VALUE_L
				STRB	R3, [R6]
				LDR.W 	R6, =CURR_VALUE_H
				STRB	R4, [R6]
BREAK_AFTER_SAVE			
				BL UPDATE_DISPLAY
NO_RDY_REC
				POP		{R1, R2, PC}

;*********************************************************************************************
;* Jmeno funkce		: TRAN_USART_TEXT
;* Popis			: Podprogram pro vyslani retezce dat pres USART1
;* Vstup			: R0 = adresa retezce
;* Vystup			: Zadny
;* Komentar			: Je vyslana skupina bajtu az po zarazku ( 0 ) 	
;*********************************************************************************************
				LTORG
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

;***************************************************************************************************
;* Jmeno funkce		: HANDLE_COUNTDOWN
;* Popis			: Resi odpocet, odecte jednu sekundu od CURR_VALUE, pripadne resi preteceni a konec odpoctu
;*					  Upravi vystup na UARTu
;* Vstup			: Zadny
;* Vystup			: Zadny	
;**************************************************************************************************	
HANDLE_COUNTDOWN
				PUSH	{R0,R3,R6,LR}

				LDR.W 	R6, =CURR_VALUE_L
				LDRB	R3, [R6]
				LDR.W 	R6, =CURR_VALUE_H
				LDRB	R4, [R6]
				
				CMP		R4, #0
				BNE		NOT_END
				CMP		R3, #1
				BNE		NOT_END
				LDR		R0, =END_MESSAGE
				BL		TRAN_USART_TEXT
				B		START
NOT_END
				CMP 	R3, #0
				BNE		NO_HANDLE_LOGIC
				SUB		R4, #1
				MOV		R3, #10
				
NO_HANDLE_LOGIC
				SUB		R3, R3, #1				
				LDR.W 	R6, =CURR_VALUE_L
				STRB	R3, [R6]
				LDR.W 	R6, =CURR_VALUE_H
				STRB	R4, [R6]
				
				MOV		R0, #0x20
				BL 		TRAN_USART
				MOV		R0, R4
				ADD		R0, #0x30
				BL 		TRAN_USART
				MOV		R0, R3
				ADD		R0, #0x30
				BL 		TRAN_USART
				MOV		R0, #0xD
				BL 		TRAN_USART
				
				BL UPDATE_DISPLAY
				
				POP		{R0,R3,R6,PC}
;***************************************************************************************************
;* Jmeno funkce		: HANDLE_ENTER_BUTTON
;* Popis			: Potvrzuje vybranou hodnotu - prekopiruje CURR_VALUE di INIT_VALUE
;* Vstup			: Zadny
;* Vystup			: Zadny	
;**************************************************************************************************	
HANDLE_ENTER_BUTTON
				PUSH	{R0,R3,R6,LR}

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
				
				LDR.W 	R6, =CURR_VALUE_H
				LDRB	R4, [R6]
				LDR.W 	R6, =INIT_VALUE_H
				STRB	R4, [R6]
				
WAIT_FOR_RELEASE_ENTER
				BL		UPDATE_DISPLAY

				LDR		R6, [R0]		 
				TST		R6, #0x800
				
				BNE		WAIT_FOR_RELEASE_ENTER
SKIP_ENTER
				
				POP		{R0,R3,R6,PC}	
;***************************************************************************************************
;* Jmeno funkce		: HANDLE_SUB_BUTTON
;* Popis			: Odecte 1 od CURR_VALUE, osetruje preteceni
;* Vstup			: Zadny
;* Vystup			: Zadny	
;**************************************************************************************************	
HANDLE_SUB_BUTTON
				PUSH	{R0,R3,R4,R6,LR}
				LDR		R0, =GPIOC_IDR
				LDR		R6, [R0]		 
				TST		R6, #0x80
				
			    BEQ		SKIP_SUB
				
				BL DELAY
				
				LDR		R6, [R0]		 
				TST		R6, #0x80
				
				BEQ		SKIP_SUB
				
				LDR.W 	R6, =CURR_VALUE_L
				LDRB	R3, [R6]
				LDR.W 	R6, =CURR_VALUE_H
				LDRB	R4, [R6]
				
				CMP 	R3, #0
				BNE		NO_SUB_LOGIC
				CMP		R4, #0
				BEQ		SUB_OVERFLOW
				SUB		R4, #1
				MOV		R3, #10
				
NO_SUB_LOGIC
				SUB		R3, R3, #1
SUB_OVERFLOW				
				LDR.W 	R6, =CURR_VALUE_L
				STRB	R3, [R6]
				LDR.W 	R6, =CURR_VALUE_H
				STRB	R4, [R6]
				
				
				
WAIT_FOR_RELEASE_SUB
				BL UPDATE_DISPLAY
	
				LDR		R6, [R0]		 
				TST		R6, #0x80
				
				BNE		WAIT_FOR_RELEASE_SUB
SKIP_SUB
				
				POP		{R0,R3,R4,R6,PC}	
;***************************************************************************************************
;* Jmeno funkce		: HANDLE_ADD_BUTTON
;* Popis			: Pricte 1 ke CURR_VALUE, osetruje preteceni
;* Vstup			: Zadny
;* Vystup			: Zadny	
;**************************************************************************************************	
HANDLE_ADD_BUTTON
				PUSH	{R0,R3,R4,R6,LR}
				LDR		R0, =GPIOC_IDR
				LDR		R6, [R0]		 
				TST		R6, #0x40
				
				BEQ		SKIP_ADD
				
				BL DELAY
				
				LDR		R6, [R0]		 
				TST		R6, #0x40
				BEQ		SKIP_ADD
				
				LDR.W 	R6, =CURR_VALUE_L
				LDRB	R3, [R6]
				LDR.W 	R6, =CURR_VALUE_H
				LDRB	R4, [R6]
				
				CMP 	R3, #9
				BNE		NO_ADD_LOGIC
				CMP		R4, #9
				BEQ		ADD_OVERFLOW
				ADD		R4, #1
				MOV		R3, #-1
				
NO_ADD_LOGIC
				ADD		R3, #1
ADD_OVERFLOW
				LDR.W 	R6, =CURR_VALUE_L
				STRB	R3, [R6]
				LDR.W 	R6, =CURR_VALUE_H
				STRB	R4, [R6]
						
WAIT_FOR_RELEASE_ADD
				BL UPDATE_DISPLAY
				
				LDR		R6, [R0]		 
				TST		R6, #0x40
				
				BNE		WAIT_FOR_RELEASE_ADD
SKIP_ADD
				
				POP		{R0,R3,R4,R6,PC}
;***************************************************************************************************
;* Jmeno funkce		: UPDATE_DISPLAY
;* Popis			: Upraví 7-mi segmentovy display na zaklade CURR_VALUE
;*					  CURR_VALUE_L pro nizsi rad CURR_VALUE_H pro vyssi rad
;*					  Cela fce trvá 1 ms  a v kodu se pouziva jakozto substituce za DELAY
;*					  Nejprve se nacte CURR_VALUE_L a rozsviti se nizsti rad na 0.5ms
;*					  Pote se nacte CURR_VALUE_H a rozsviti se vyssi rad na 0.5ms
;* Vstup			: Zadny
;* Vystup			: Zadny
;**************************************************************************************************	
UPDATE_DISPLAY
				PUSH	{R0,R1,R2,R3,R6,LR}
				LDR.W	R1, =CURR_VALUE_L
				LDRB	R0, [R1] 
				;SUB		R0, R0, #1
				LSL		R0, R0, #2
				adr 	R1,numbers_L
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
				
				ORR 	R2, R2, #0x200
				STR		R2, [R6]
				
				BL 		DELAY
				
				LDR.W	R1, =CURR_VALUE_H
				LDRB	R0, [R1] 
				;SUB		R0, R0, #1
				LSL		R0, R0, #2
				adr 	R1,numbers_L
				ADD		R0, R0, R1
				LDR		R1, [R0]
				MOV 	R0, #8
				EOR		R1, R1, #0xFF
				
				LDR		R6, =GPIOB_ODR
				
DOWHILE2		
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
				BNE		DOWHILE2
				
				ORR 	R2, R2, #0x100
				STR		R2, [R6]
				
				BL 		DELAY                      
				
				POP		{R0,R1,R2,R3,R6,PC}
;***************************************************************************************************
;* Jmeno funkce		: RCC_CNF
;* Popis			: Konfigurace systemovych hodin a hodin periferii
;* Vstup			: Zadny
;* Vystup			: Zadny
;* Komentar			: Nastaveni PLL jako zdroj hodin systemu (24MHz),
;*  				  a privedeni hodin na branu A, B a C 	
;**************************************************************************************************
				LTORG
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
				LDR		R2, =0x50400	 ; Maska, PLL x3, HSE jako PLL vstup, HCLK/2 =24MHz Clk
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
				LDR		R2, =0x401D		; Konstanta pro zapnuti hodin pro branu A, B a C
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
				STR		R1, [R0]		; Ulozeni konfigurace PB05, PB06, PB07 
				
				LDR		R2, =0xFF		; Konstanta pro nulovani nastaveni bitu 0	
				LDR		R0, =GPIOB_CRH	; Kopie adresy GPIOB_CRH (Port Configuration Register High)
										; do R0, GPIOB_CRH je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x11		; Vlozeni 0x88 do R2
				ORR		R1, R1, R2		; maskovani, bit 8, 9 nastven jako push-pull vstup
				STR		R1, [R0]		; Ulozeni konfigurace PB08, PB09
				
				LDR		R2, =0xF000		; Konstanta pro nulovani nastaveni bitu 0	
				LDR		R0, =GPIOA_CRH	; Kopie adresy GPIOA_CRH (Port Configuration Register High)
										; do R0, GPIOA_CRH je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x8000		; Vlozeni 0x800 do R2
				ORR		R1, R1, R2		; maskovani, bit 11 nastven jako push-pull vstup
				STR		R1, [R0]		; Ulozeni konfigurace PB11
				
				LDR		R2, =0xFF000000	; Konstanta pro nulovani nastaveni bitu 0	
				LDR		R0, =GPIOC_CRL	; Kopie adresy GPIOC_CRL (Port Configuration Register Low)
										; do R0, GPIOC_CRL je v souboru INI.S	
				LDR		R1, [R0]		; Nacteni hodnoty z adresy v R0 do R1 
				BIC		R1, R1, R2 		; Nulovani bitu v R2 
				MOV		R2, #0x88000000	; Vlozeni 10000000 do R2
				ORR		R1, R1, R2		; maskovani, bit 0 nastven jako push-pull výstup
				STR		R1, [R0]		; Ulozeni konfigurace PB05, PB06, PB07 
				
				LDR		R2, =0xF0			; konstanta pro nulovani nastaveni bitu 10	
				LDR		R0, =GPIOA_CRH	 	; konfiguracni registr
				LDR		R1, [R0]	   		
				BIC		R1, R1, R2 			; PA9
				LDR		R2, =0xB0			; PA9 jako vystup alter. fce push-pull
				ORR		R1, R1, R2			
				STR		R1, [R0]
									
											; PA10 je jiz po resetu nastaven jako plovouci vstup
				BX		LR	

;**************************************************************************************************
;* Jmeno funkce		: DELAY
;* Popis			: Softwarove zpozdeni procesoru
;* Vstup			: Zadny
;* Vystup			: Zadny
;* Komentar			: Podprodram zpozdi prubech vykonavani programu	
;**************************************************************************************************
DELAY 									; Navesti zacatku podprogramu
				PUSH	{R2, LR}		; Ulozeni hodnoty R2 do zasobniku (R2 muze byt editovan)
										; a ulozeni navratove adresy do zasobniku
WAIT1			
				LDR		R2, =4000		; Vlozeni konstanty pro prodlevu do R2
WAIT			SUBS	R2, R2, #1		; Odecteni 1 od R2,tj. R2 = R2 - 1 a nastaveni priznakoveho registru   	
				BNE		WAIT			; Skok na navesti pri nenulovosti R2 (skok dle priznaku)
				
				POP		{R2, PC}		; Navrat z podprogramu, obnoveni hodnoty R2 ze zasobniku
										; a navratove adresy do PC                
;**************************************************************************************************
				NOP
				ALIGN
				END	
