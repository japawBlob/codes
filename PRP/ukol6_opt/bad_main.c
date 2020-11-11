#include <stdio.h>
#include <stdlib.h>

#define TIMES 42
#define PLUS 43
#define MINUS 45

int first_r, first_c;
int** first_matrix;

int second_r, second_c;
int** second_matrix;

int third_r, third_c;
int** third_matrix;

int** help_matrix;

int value;
char operator;
char operator_2;
int x;

int main(){
	
/**/scanf("%i %i", &first_r, &first_c);
	
	first_matrix = (int**)malloc(first_r*sizeof(int*));
	
	for(int i = 0; i<first_r; i++){
		first_matrix[i] = (int*)calloc(first_c, sizeof(int));
	}
	for(int i = 0; i<first_r; i++){
		for(int j = 0; j<first_c; j++){
/**/		scanf("%i", &value);
			first_matrix[i][j] = value;
		}
	}
	
/**/while(scanf(" %c", &operator) != EOF){
		point:
/**/	scanf("%i %i", &second_r, &second_c);
			
		second_matrix = (int**)malloc(second_r*sizeof(int*));
			
		for(int i = 0; i<second_r; i++){
			second_matrix[i] = (int*)calloc(second_c, sizeof(int));
		}
		for(int i = 0; i<second_r; i++){
			for(int j = 0; j<second_c; j++){
/**/		scanf("%i", &value);
				second_matrix[i][j] = value;
			}
		}
	
		if(operator == TIMES){
		
			if(first_c != second_r){
				fprintf(stderr, "ERROR\n");
				return 100;
			}
			
			help_matrix = (int**)malloc(first_r*sizeof(int*));
			
			for(int i = 0; i<first_r; i++){
				help_matrix[i] = (int*)calloc(second_c, sizeof(int));
			}
		
			for(int i = 0; i<first_r; i++){
				for(int j = 0; j<second_c; j++){
					x = 0;
					for(int k = 0; k<first_c; k++){
						x += first_matrix[i][k]*second_matrix[k][j];
					}
					help_matrix[i][j] = x;
				}
			}
			first_c = second_c;
			for(int i = 0; i<first_r; i++){
				first_matrix[i] = (int*)realloc(first_matrix[i],first_c*sizeof(int));
			}
			for(int i = 0; i<first_r; i++){
				for(int j = 0; j<first_c; j++){
					first_matrix[i][j] = help_matrix[i][j];
				}
			}
			for(int i = 0; i<first_r; i++){
				free(help_matrix[i]);
			}
			free(help_matrix);
		} //END OF IF TIMES
		if(operator == PLUS || operator == MINUS){
			plus_minus:
/**/		if(scanf(" %c", &operator_2) != EOF){
				if(operator_2 == PLUS || operator_2 == MINUS){
					if(operator == PLUS){
						for(int i = 0; i<second_r; i++){
            				for(int j = 0; j<second_c; j++){
		            			first_matrix[i][j] = first_matrix[i][j]+second_matrix[i][j];
            				}
        				}
					}
					if(operator == MINUS){
						for(int i = 0; i<second_r; i++){
            				for(int j = 0; j<second_c; j++){
		            			first_matrix[i][j] = first_matrix[i][j]-second_matrix[i][j];
            				}
        				}
					}
					operator = operator_2;
					for(int i = 0; i<second_r; i++){
						free(second_matrix[i]);
					}
					free(second_matrix);
					goto point;
				} // END OF operator_2 == PLUS || operator_2 == MINUS
				if(operator_2 == TIMES){
				
/**/				scanf("%i %i", &third_r, &third_c);
						
					third_matrix = (int**)malloc(third_r*sizeof(int*));
						
					for(int i = 0; i<third_r; i++){
						third_matrix[i] = (int*)calloc(third_c, sizeof(int));
					}
					for(int i = 0; i<third_r; i++){
						for(int j = 0; j<third_c; j++){
/**/						scanf("%i", &value);
							third_matrix[i][j] = value;
						}
					}
					help_matrix = (int**)malloc(second_r*sizeof(int*));
			
					for(int i = 0; i<second_r; i++){
						help_matrix[i] = (int*)calloc(third_c, sizeof(int));
					}
					for(int i = 0; i<second_r; i++){
						for(int j = 0; j<third_c; j++){
							x = 0;
							for(int k = 0; j<second_c; k++){
								x += second_matrix[i][k]*third_matrix[k][j];
							}
							help_matrix[i][j] = x;
						}
					}
					second_c = third_c;
					for(int i = 0; i<second_r; i++){
						second_matrix[i] = (int*)realloc(second_matrix[i],second_c*sizeof(int));
					}
					for(int i = 0; i<second_r; i++){
						for(int j = 0; j<second_c; j++){
							second_matrix[i][j] = help_matrix[i][j];
						}
					}
					for(int i = 0; i<second_r; i++){
						free(help_matrix[i]);
					}
					free(help_matrix);
					
					for(int i = 0; i<third_r; i++){
						free(third_matrix[i]);
					}
					free(third_matrix);
					goto plus_minus;  															//ENDED HERE
				} //END OF operator_2 == TIMES
				
			} //END OF scanF OPERATOR_2
			if(operator == PLUS){
				for(int i = 0; i<second_r; i++){
            		for(int j = 0; j<second_c; j++){
		          		first_matrix[i][j] = first_matrix[i][j]+second_matrix[i][j];
            		}
        		}
			}
			if(operator == MINUS){
				for(int i = 0; i<second_r; i++){
            		for(int j = 0; j<second_c; j++){
		         		first_matrix[i][j] = first_matrix[i][j]-second_matrix[i][j];
            		}
        		}
			}			
			//}
			
		} //END OF PLUS || MINUS
		
		for(int i = 0; i<second_r; i++){
			free(second_matrix[i]);
		}
		free(second_matrix);
	} // END OF WHILE SCANF
	
	printf("%i %i\n", first_r, first_c);
	
	for(int i = 0; i<first_r; i++){
        for(int j = 0; j<first_c; j++){
        	if(j != 0){
        		printf(" ");
        	}
			printf("%i", first_matrix[i][j]);
    	}
    	printf("\n");
    }
	
	for(int i = 0; i<second_r; i++){
		free(second_matrix[i]);
	}
	free(second_matrix);
	
	for(int i = 0; i<first_r; i++){
		free(first_matrix[i]);
	}
	free(first_matrix);
	return 0;
}
