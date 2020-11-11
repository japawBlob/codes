#include <stdio.h>
#include <stdlib.h>
 
#define TIMES 42
#define PLUS 43
#define MINUS 45


char operator;
char operator_2;
int value;
int **help;
int x;

int first_r, first_c;
int **first_matrix;

int second_r, second_c;
int **second_matrix;

int third_r, third_c;
int** third_matrix;
 
int main(){
 
    
     
    if(scanf("%i %i", &first_r, &first_c) != 2){
        fprintf(stderr,"Error: Chybny vstup!\n");
        return 100;
    }
     
    
	
	first_matrix = (int**)malloc(first_r*sizeof(int*));
	
	for(int i = 0; i<first_r; i++){
		first_matrix[i] = (int*)calloc(first_c,sizeof(int));
	}
	
    
     
    for(int i = 0; i<first_r; i++){
        for(int j = 0; j<first_c; j++){
            if(scanf("%i", &value) != 1){
                fprintf(stderr,"Error: Chybny vstup!\n");
                return 100;
            }
            first_matrix[i][j] = value;
        }
    }
    
    scan_operator:
    if(scanf(" %c", &operator) != EOF){
    	having_opperator:
    	
		 
		if(scanf("%i %i", &second_r, &second_c) != 2){
		    fprintf(stderr,"Error: Chybny vstup!\n");
		    return 100;
		}
		

		
		second_matrix = (int**)malloc(second_r*sizeof(int*));
		
		for(int i = 0; i<second_r; i++){
			second_matrix[i] = (int*)calloc(second_c,sizeof(int));
		}
		 
		for(int i = 0; i<second_r; i++){
		    for(int j = 0; j<second_c; j++){
		        if(scanf("%i", &value) != 1){
		            fprintf(stderr,"Error: Chybny vstup!\n");
		            return 100;
		        }
		        second_matrix[i][j] = value;
		    }
		}
    	
    	if(operator == TIMES){
		    if(first_c != second_r){
		        fprintf(stderr,"Error: Chybny vstup!\n");
		        return 100;
		    }
		    
		    
		
			help = (int**)malloc(first_r*sizeof(int*));
		
			for(int i = 0; i<first_r; i++){
				help[i] = (int*)calloc(second_c,sizeof(int));
			}
		    
		    
		    x = 0;
		    for(int i = 0; i<first_r; i++){
		        for(int j = 0; j<second_c; j++){
		            for(int k = 0; k<first_c;k++){
		                x += first_matrix[i][k]*second_matrix[k][j];
		            }
		            help[i][j] = x;
		            x=0;
		        }
		    }
		    for(int i = 0; i<first_r; i++){
				first_matrix[i] = (int*)realloc(first_matrix[i],second_c*sizeof(int));
			}
			first_c = second_c;
/**/		for(int i = 0; i<first_r; i++){
		        for(int j = 0; j<second_c; j++){
		            first_matrix[i][j] = help[i][j];
		        }
		    }
		    for(int i = 0; i<first_r; i++){
				free(help[i]);
			}
			free(help);
			for(int i = 0; i<second_r; i++){
				free(second_matrix[i]);
			}
    		free(second_matrix);
			goto scan_operator;
		} //END OF TIMES
		
		
		 
		if(operator == PLUS){
		    jump:
		    if(scanf(" %c", &operator_2) != EOF){
				
				if(operator_2 == PLUS || operator_2 == MINUS){
					if(first_c != second_c || first_r != second_r){
						fprintf(stderr,"Error: Chybny vstup!\n");
						return 100;
					}
					for(int i = 0; i<second_r; i++){
						for(int j = 0; j<second_c; j++){
						    first_matrix[i][j] = first_matrix[i][j]+second_matrix[i][j];
						}
					}
					operator = operator_2;
					
					for(int i = 0; i<second_r; i++){
						free(second_matrix[i]);
					}
					free(second_matrix);
					
					goto having_opperator;
				}
				if(operator_2 == TIMES){
					if(scanf("%i %i", &third_r, &third_c) != 2){
						fprintf(stderr,"Error: Chybny vstup!\n");
						return 100;
					}
					third_matrix = (int**)malloc(third_r*sizeof(int*));
		
					for(int i = 0; i<third_r; i++){
						third_matrix[i] = (int*)calloc(third_c,sizeof(int));
					}
					for(int i = 0; i<third_r; i++){
						for(int j = 0; j<third_c; j++){
							if(scanf("%i", &value) != 1){
								fprintf(stderr,"Error: Chybny vstup!\n");
								return 100;
							}
							third_matrix[i][j] = value;
						}
					}
					if(second_c != third_r){
						fprintf(stderr,"Error: Chybny vstup!\n");
						return 100;
					}
					
					
				
					help = (int**)malloc(second_r*sizeof(int*));
				
					for(int i = 0; i<second_r; i++){
						help[i] = (int*)calloc(third_c,sizeof(int));
					}
					x = 0;
					for(int i = 0; i<second_r; i++){
						for(int j = 0; j<third_c; j++){
						    for(int k = 0; k<second_c;k++){
						        x += second_matrix[i][k]*third_matrix[k][j];
						    }
						    help[i][j] = x;
						    x=0;
						}
					}
					for(int i = 0; i<second_r; i++){
						second_matrix[i] = (int*)realloc(second_matrix[i],third_c*sizeof(int));
					}
					second_c = third_c;
/**/				for(int i = 0; i<second_r; i++){
						for(int j = 0; j<third_c; j++){
						    second_matrix[i][j] = help[i][j];
						}
					}
					for(int i = 0; i<second_r; i++){
						free(help[i]);
					}
					free(help);
					for(int i = 0; i<third_r; i++){
						free(third_matrix[i]);
					}
					free(third_matrix);
					goto jump;
				}//END OF operator_2 == TIMES
			} else {
				if(first_c != second_c || first_r != second_r){
					fprintf(stderr,"Error: Chybny vstup!\n");
					return 100;
				}
				for(int i = 0; i<second_r; i++){
					for(int j = 0; j<second_c; j++){
					    first_matrix[i][j] = first_matrix[i][j]+second_matrix[i][j];
					}
				}
				operator = operator_2;
				
				for(int i = 0; i<second_r; i++){
					free(second_matrix[i]);
				}
				free(second_matrix);
			}//END OF operator_2 != EOF
		} //END OF operator == PLUS
		if(operator == MINUS){
		    point:
		    if(scanf(" %c", &operator_2) != EOF){
				
				if(operator_2 == PLUS || operator_2 == MINUS){
					if(first_c != second_c || first_r != second_r){
						fprintf(stderr,"Error: Chybny vstup!\n");
						return 100;
					}
					for(int i = 0; i<second_r; i++){
						for(int j = 0; j<second_c; j++){
						    first_matrix[i][j] = first_matrix[i][j]-second_matrix[i][j];
						}
					}
					operator = operator_2;
					
					for(int i = 0; i<second_r; i++){
						free(second_matrix[i]);
					}
					free(second_matrix);
					
					goto having_opperator;
				}
				if(operator_2 == TIMES){
					if(scanf("%i %i", &third_r, &third_c) != 2){
						fprintf(stderr,"Error: Chybny vstup!\n");
						return 100;
					}
					third_matrix = (int**)malloc(third_r*sizeof(int*));
		
					for(int i = 0; i<third_r; i++){
						third_matrix[i] = (int*)calloc(third_c,sizeof(int));
					}
					for(int i = 0; i<third_r; i++){
						for(int j = 0; j<third_c; j++){
							if(scanf("%i", &value) != 1){
								fprintf(stderr,"Error: Chybny vstup!\n");
								return 100;
							}
							third_matrix[i][j] = value;
						}
					}
					if(second_c != third_r){
						fprintf(stderr,"Error: Chybny vstup!\n");
						return 100;
					}
					
					//int **help;
				
					help = (int**)malloc(second_r*sizeof(int*));
				
					for(int i = 0; i<second_r; i++){
						help[i] = (int*)calloc(third_c,sizeof(int));
					}
					x = 0;
					for(int i = 0; i<second_r; i++){
						for(int j = 0; j<third_c; j++){
						    for(int k = 0; k<second_c;k++){
						        x += second_matrix[i][k]*third_matrix[k][j];
						    }
						    help[i][j] = x;
						    x=0;
						}
					}
					for(int i = 0; i<second_r; i++){
						second_matrix[i] = (int*)realloc(second_matrix[i],third_c*sizeof(int));
					}
					second_c = third_c;
/**/				for(int i = 0; i<second_r; i++){
						for(int j = 0; j<third_c; j++){
						    second_matrix[i][j] = help[i][j];
						}
					}
					for(int i = 0; i<second_r; i++){
						free(help[i]);
					}
					free(help);
					for(int i = 0; i<third_r; i++){
						free(third_matrix[i]);
					}
					free(third_matrix);
					goto point;
				}//END OF operator_2 == TIMES
			} else {
				if(first_c != second_c || first_r != second_r){
					fprintf(stderr,"Error: Chybny vstup!\n");
					return 100;
				}
				for(int i = 0; i<second_r; i++){
					for(int j = 0; j<second_c; j++){
					    first_matrix[i][j] = first_matrix[i][j]-second_matrix[i][j];
					}
				}
				operator = operator_2;
				
				for(int i = 0; i<second_r; i++){
					free(second_matrix[i]);
				}
				free(second_matrix);
			}//END OF operator_2 != EOF
		} //END OF operator == MINUS
	}//END of operator != EOF
	
	
    printf("%i %i\n", first_r, first_c);
    for(int i = 0; i<first_r; i++){
        for(int j = 0; j<first_c; j++){
            if(j!=0){
                printf(" ");
            }
            printf("%i", first_matrix[i][j]);
        }
        printf("\n");
    }
    
    for(int i = 0; i<first_r; i++){
		free(first_matrix[i]);
	}
	
    free(first_matrix);
    
    return 0;
}
