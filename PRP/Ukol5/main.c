#include <stdio.h>
#include <stdlib.h>

int main(){

    int cipher_max = 5;
    char *cipher;
    cipher = (char*)malloc(cipher_max * sizeof(*cipher));
    
    int cipher_length = 0;
    char c;
    
    while((c = getchar()) != '\n'){
        if((c <= 90 && c>=65) || (c <= 122 && c>=97)){
            cipher[cipher_length] = c;
            cipher_length++;
            if(cipher_length == cipher_max){
                cipher_max = cipher_max * 2;
                cipher = (char*)realloc(cipher,cipher_max* sizeof(char));
            }
        } else {
            fprintf(stderr, "Error: Chybny vstup!\n");
            free(cipher);
            return 100;
        }
    }
/*
    printf("Original sifra je: ");
    for(int i = 0;i<cipher_length;i++){
        printf("%c",cipher[i]);
    } printf("\n");
*/
    int hint_max = 5;
    char* hint;
    hint = (char*)malloc(hint_max * sizeof(*hint));

    int hint_length = 0;

    while((c = getchar()) != '\n'){
        if((c <= 90 && c>=65) || (c <= 122 && c>=97)){
            hint[hint_length] = c;
            hint_length++;
            if(hint_length == hint_max){
                hint_max = hint_max * 2;
                hint = (char*)realloc(hint,hint_max* sizeof(char));
            }
        } else {
            fprintf(stderr, "Error: Chybny vstup!\n");
            free(cipher);
            return 100;
        }
    }
	if(hint_length != cipher_length){
		fprintf(stderr,"Error: Chybna delka vstupu!\n");
		free(cipher);
		free(hint);
		return 101;
	}
	
/*
    printf("Hint je: ");
    for(int i = 0;i<hint_length;i++){
        printf("%c",hint[i]);
    } printf("\n");
*/
/*
    short pole[cipher_length];
    for(int i = 0; i<cipher_length; i++){
        pole[i] = cipher[i];
    }
*/
	int *pole;
	pole = (int*)malloc(cipher_length*sizeof(*pole));
	for(int i = 0; i<cipher_length; i++){
        pole[i] = cipher[i];
    	}
/*
    for(int i = 0; i<cipher_length; i++){
        printf("%c", pole[i]);
    } printf("\n");
*/
	//printf("\n");
	//int help_value = 0;
	int correct = 0;
	int the_best_number_of_corrects = 0;
	int most_acurate_shift = 0;
    for(int i = 0;i<52;i++){
	correct = 0;
        for(int j = 0; j<cipher_length;j++){
//		help_value = cipher[j];
        	if(pole[j] <= 90 && pole[j]+i == 91){
			    pole[j] = 97-i;
		    }
		    if(pole[j] + i >122){
			    pole[j] = 65-i;	
		    }
		    //printf("%c %i", pole[j] + i, i);
		    //printf("%c", pole[j]+i);
		    if(pole[j] + i == hint[j]){
			    correct++;
		    }
        }
	if(correct > the_best_number_of_corrects){
		the_best_number_of_corrects = correct;
		most_acurate_shift = i;
		
	}
	//printf("\n");
    }
	free(pole);
/*
	for(int i = 0; i<cipher_length; i++){
        printf("%c", pole[i]);
    } printf("\n");
*/	
	//printf("Most accurate shift is %i\n", most_acurate_shift);
	
	int overflow = 0;
	int pomocny_cipher =0;
	
	for(int i = 0; i<cipher_length;i++){
		/*if(cipher[i] >= 65 && cipher[i]+most_acurate_shift > 90){
			cipher[i] = 97-most_acurate_shift;
		}
		if(cipher[i] + most_acurate_shift >122){
			cipher[i] = 65-most_acurate_shift;	
		}*/
		if(cipher[i]>=97){
		    if(cipher[i]+most_acurate_shift>122){
		        overflow = cipher[i]+most_acurate_shift-122;
/**/	        cipher[i] = 64+overflow;
		        if(cipher[i]>90){
		            overflow = cipher[i]-90;
/**/                cipher[i] = 96+overflow;
		        }
		        printf("%c",cipher[i]);
		        continue;
		    } else {
		        printf("%c",cipher[i]+most_acurate_shift);
		        continue;
		    }
		}
		if(cipher[i]<=90){
		    if(cipher[i]+most_acurate_shift>90){
		        overflow = cipher[i]+most_acurate_shift-90;
/**/		    pomocny_cipher = 96+overflow;
		        if(pomocny_cipher>122){
		            overflow=pomocny_cipher-122;
/**/                pomocny_cipher=64+overflow;
		        }
		        printf("%c",pomocny_cipher);
		        continue;
		    } else {
		        printf("%c",cipher[i]+most_acurate_shift);
		        continue;
		    }
		}
		
		printf("%c",cipher[i]+most_acurate_shift);
	}
	printf("\n");
    free(hint);
    free(cipher);
    return 0;
}


/*
qrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnop
aHcQefghWjdlmnopqostuvTxyzABCDfFcHdJKLxNOPQmSTUVWjYZ
*/
