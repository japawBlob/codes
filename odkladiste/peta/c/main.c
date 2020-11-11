#include <stdio.h>
#include <stdlib.h>

#define REPS_PRIM_NUM 1000000


int is_prime_num(int number)
{
    // osetrime minimum
    if(number < 2) return 0;
    if(number == 2) return 1;
    if(number % 2 == 0) return 0; 

    for(int i = 3; i < number; ++i){
        
        if(number % i == 0){
            return 0;
        }
    }

    return 1;
}

void print_array(int array[], int array_long){
    
    for(int i = 0; i < array_long; ++i){
        fprintf(stdout,"%d ", array[i]);
    }
    fprintf(stdout,"\n\n");
}

void erathostenovo_sito(int arr[], int arr_length, int *count_prime_num){
    
    int i, j;

    // 1... je prvocislo
    //arr[0] = 1;
    //arr[1] = 1;
    for(i = 2; i < arr_length; ++i){
        arr[i] = 1;
    }
    for(i = 2; i < arr_length; ++i){
        // odchyti jiz vyrazena cisla
        if(arr[i] == 0){
            continue;
        }
        // ulozi si prvocislo
        ++ *count_prime_num;

        // procisti nasobky prvocisla
        for(j = 2*i; j < arr_length; j += i){
            arr[j] = 0;
        }
    }
    // test print
    //print_array(arr, arr_length);

    j = 0;
    for(i = 2; i < arr_length; ++i){
        if(arr[i] == 1){
            arr[j] = i;
            ++j;
        }
    }

    // test print
    // print_array(arr, *count_prime_num);
}

void primar_numbers(long long int number, int arr[], int arr_length){

    fprintf(stdout,"Prvociselny rozklad cisla %lld je:\n", number);

    if(number < REPS_PRIM_NUM && (is_prime_num(number) == 1 || number == 1)){
        fprintf(stdout,"%lld", number);
    } else {

        int i = 0;
        int prim_num = arr[i];
        int count_use_prim = 0;
        int is_first_out_num = 1;

        while(number != 1){
            // deli dokud lze celociselne
            while(number % prim_num == 0){
                number = number / prim_num;
                ++ count_use_prim;
            }

            // pokud neni prvocislo delitelem, preskoc vypisovani
            if(count_use_prim != 0){

                // zajistuje tisknuti x
                if(is_first_out_num == 0){
                    fprintf(stdout," x ");
                }
                is_first_out_num = 0;

                // vypise zname informace
                if(count_use_prim == 1){
                    fprintf(stdout,"%d", prim_num);
                } else {
                    fprintf(stdout,"%d^%d", prim_num, count_use_prim);
                }
            }

            // nacte dalsi prvocislo
            ++i;
            prim_num = arr[i];

            // vynuluje counter
            count_use_prim = 0;
        }
    }

    fprintf(stdout,"\n");
}

/* The main program */
int main(int argc, char *argv[]){

    int proces_OK = 1; // Ok = 1 | Problem = 0
    long long int number;

    /* vytvari seznam prvocisel*/ 
    int primar_num[REPS_PRIM_NUM];
    int count_prime_num = 0;
    
    erathostenovo_sito(primar_num, REPS_PRIM_NUM, &count_prime_num);

    // test print
    // print_array(primar_num,count_prime_num);

    while(proces_OK == 1){
        if(scanf("%lld", &number) != 1){
            fprintf(stderr,"Error: Chybny vstup!\n");
            return 100;
        }
        if(number < 0){
            fprintf(stderr,"Error: Chybny vstup!\n");
            return 100;
        }
        if(number == 0){
            break;
        }

        primar_numbers(number, primar_num, count_prime_num);
    }
  
    return 0;
}
