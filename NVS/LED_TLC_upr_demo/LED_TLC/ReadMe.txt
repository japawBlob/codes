

Popis instrukci pouzitych v programu LED_TLC:
-----------------------------------------------


Istrukce presunu:
					MOV	R0, R1		; kopie R1 do R0, R0 = R1 
					MOV R0, #1		; kopie 1 do R0, R0 = 1

					LDR	R0, =0x200	; kopie 0x200 do R0, R0 = 0x200
					LDR	R1, [R0]	; kopie hodnoty na adrese v R0 do R1, R1 = hodnota z adresy v R0
					STR	R1, [R0]	; kopie hodnoty z R1 na adresu v R0

					PUSH {R0,LR}	; ulozeni hodnoty v R0 a LR do zasobniku
					POP	 {R0,PC}	; vyzvednuti hodnoty ze zasobniku do PC a R0

Instrucke skoku:
					B	NAVESTI		; skok na adresu, kde je uvedeno navesti NAVESTI
					BL	NAVESTI		; skok na adresu, kde je uvedeno navesti NAVESTI a ulozeni navratove adresy do LR
					BX	LR			; skok na adresu umitenou v registru LR
					BEQ	NAVESTI		; skok na adresu navesti NAVESTI podle vysledku predchozi instrukce,
									; tj. skok pri vysledku rovno nula
					BNE	NAVESTI		; skok na adresu navesti NAVESTI podle vysledku predchozi instrukce,
									; tj. skok pri vysledku nerovno nula

Instrukce aritmeticke:

					ADD	 R4, R4, #1	; R4 = R4 + 1
					SUB  R0, R1, #1	; R0 = R1 - 1
					SUBS R0, R1, #1	; R0 = R1 - 1 a nastaveni registru priznaku (PSR)

Instrukce logicke:
					BIC	R1, R1, R2	; R1 = R1 & (/R2) - logicky soucin s R1 a negovanym R2
					ORR	R1, R1, R2	; R1 = R1 | R2 - logicky soucet R1 s R2

Instrukce porovnani:
					CMP R0,#1		; R0 - 1 a nastaveni priznaku, ale hodnota v R0 se nezmeni
					TST	R0,#1		; R0 & 1 a nastaveni priznaku, ale hodnota v R0 se nezmeni


Informace k pouzitemu Hardwaru:
--------------------------------

LED na vyvodech PC8 a PC9 se rozsveci log."1" (pull-down)
Tlacitko na vyvodu PA0 ma v nestisknutem stavu na PA0 = log."0" a pri stisknuti PA0 = log."1"




	 

	
		  
