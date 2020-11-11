#include <stdio.h>
#include <stdlib.h>
 
#define TIMES 42
#define PLUS 43
#define MINUS 45
 
int main(){
 
    int first_r, first_c;
     
    if(scanf("%i %i", &first_r, &first_c) != 2){
        fprintf(stderr,"Error: Chybny vstup!\n");
        return 100;
    }
	
    int** first_array;
    
    first_array = (int**)malloc(first_r*sizeof(int*));
    
    for(int i = 0; i<first_r; i++){
        first_array[i] = (int*)calloc(first_c, sizeof(int));
    }
    
    
    int value;
     
    for(int i = 0; i<first_r; i++){
        for(int j = 0; j<first_c; j++){
            if(scanf("%i", &value) != 1){
                fprintf(stderr,"Error: Chybny vstup!\n");
                return 100;
            }
            first_array[i][j] = value;
        }
    }
    /*//VYPIS 2D POLE
    for(int i = 0; i<first_r; i++){
        for(int j = 0; j<first_c; j++){
            printf("%i ", first_array[i][j]);
        }
        printf("\n");
    }
    */
    
    int** second_array;
    int** help_matrix;
    char operator;
    while(scanf(" %c", &operator) != EOF){
       
        if(operator == PLUS || operator == MINUS || operator == TIMES){
        } else {
            fprintf(stderr,"Error: Chybny vstup!\n");
            return 100;
        }
         
        int second_r, second_c;
         
        if(scanf("%i %i", &second_r, &second_c) != 2){
            fprintf(stderr,"Error: Chybny vstup!\n");
            return 100;
        }
        
        
        second_array = (int**)malloc(second_r*sizeof(int*));
        
            
        for(int i = 0; i<second_r; i++){
            second_array[i] = (int*)calloc(second_c, sizeof(int));
        }
        
         
        for(int i = 0; i<second_r; i++){
            for(int j = 0; j<second_c; j++){
                if(scanf("%i", &value) != 1){
                    fprintf(stderr,"Error: Chybny vstup!\n");
                    return 100;
                }
                second_array[i][j] = value;
            }
        }
        
        if(operator == TIMES){
            if(first_c != second_r){
                fprintf(stderr,"Error: Chybny vstup!\n");
                return 100;
            } else {
                printf("%i %i\n", first_r, second_c);
            }
            help_matrix = (int**)malloc(first_r*sizeof(int*));
            
            for(int i = 0; i<first_r; i++){
                help_matrix[i] = (int*)calloc(second_c, sizeof(int));
            }
            
            int x = 0;
            for(int i = 0; i<first_r; i++){
                for(int j = 0; j<second_c; j++){
                    for(int k = 0; k<first_c;k++){
                        x += first_array[i][k]*second_array[k][j];
                    }
                    /*if(j!=0){
                        printf(" ");
                    }
                    printf("%i", x);
                    */
                    help_matrix[i][j] = x;
                }
                printf("\n");
            }
            
            for(int i = 0; i < first_r; i++){
                first_array[i] = (int*)realloc(first_array[i],second_c*sizeof(int));
            }
            first_c = second_c;
            
            for(int i = 0; i < first_r; i++){
                for(int j = 0; j < first_c; j++){
                    first_array[i][j] = help_matrix[i][j];
                }
            }
            for(int i = 0; i < first_r; i++){
                free(help_matrix[i]);
            }
            free(help_matrix);
        }
         
        if(operator == PLUS){
            if(first_c != second_c || first_r != second_r){
                fprintf(stderr,"Error: Chybny vstup!\n");
                return 100;
            } else {
                printf("%i %i\n", first_r, first_c);
            }
            for(int i = 0; i<second_r; i++){
                for(int j = 0; j<second_c; j++){
                    if(j!=0){
                        printf(" ");
                    }
                    printf("%i", first_array[i][j]+second_array[i][j]);
                }
                printf("\n");
            }
        }
        if(operator == MINUS){
            if(first_c != second_c || first_r != second_r){
                fprintf(stderr,"Error: Chybny vstup!\n");
                return 100;
            } else {
                printf("%i %i\n", first_r, first_c);
            }
            for(int i = 0; i<second_r; i++){
                for(int j = 0; j<second_c; j++){
                    if(j!=0){
                        printf(" ");
                    }
                    printf("%i", first_array[i][j]-second_array[i][j]);
                }
                printf("\n");
            }
        }
    }
    for(int i = 0; i<first_r; i++){
        free(first_array[i]);
    }
    for(int i = 0; i<first_r; i++){
        free(second_array[i]);
    }
    free(first_array);
    free(second_array);
    return 0;
}
