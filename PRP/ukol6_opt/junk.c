		if(operator == MINUS){
		    if(first_c != second_c || first_r != second_r){
		        fprintf(stderr,"Error: Chybny vstup!\n");
		        return 100;
		    }
		    scan_operator_2:
		    if(scanf(" %c", &operator_2) != EOF){
				
				if(operator_2 == PLUS || operator_2 == MINUS){
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
					
					int **help;
				
					help = (int**)malloc(second_r*sizeof(int*));
				
					for(int i = 0; i<second_r; i++){
						help[i] = (int*)calloc(third_c,sizeof(int));
					}
					int x = 0;
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
					for(int i = 0; i<third_r; i++){
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
					goto scan_operator_2;
				}//END OF operator_2 == TIMES
			} else {
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
