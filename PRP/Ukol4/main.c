//malloc

#include <stdio.h>

int main(){
	int number = -1;
	int r = 0;
	while(number !=0){	
		r = scanf("%i", &number);
		if(r != 1 || number < 0){
			fprintf( stderr, "Error: Chybny vstup!\n");
			return 100;
		}
		if(number == 0){
			break;
		}
		if(number == 1){
			printf("Prvociselny rozklad cisla %i je:\n%i\n",number, number);
		} else {
			printf("Prvociselny rozklad cisla %i je:\n", number);
			int help = 2;
			while(number != 1 && help<=number){
				int amount = 0;
				while(number%help==0){
					number = number/help;
					amount++;
				}
				if(amount==0){
					help++;
				}
				if(amount>0){
					if(amount==1){
						printf("%i", help);
					} else {
						printf("%i^%i", help, amount);
					}
					help++;
				}
				if(amount != 0 && number != 1){
					printf(" x ");
				}
			}
			printf("\n");
		}
		
	}
	return 0;
}
