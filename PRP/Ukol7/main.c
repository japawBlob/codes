#include <stdio.h>
#include <stdlib.h>
 
int main(int argc, char *argv[])
{
     
    char opt[] = "--color=always"; 
       
    char c;
    int mode = 0;
	if(argc > 2){
		for(int i = 0; i>-1; i++){
			if(opt[i] != argv[1][i]){
				break;
			}
			if(opt[i] == '\0' && argv[1][i] == '\0'){
				mode = 1;
				break;
			}
		}
	}
     
    char* pole;
    int pole_max = 10;
    pole = (char*)malloc(pole_max*sizeof(char));
     
    int ret = 1;    
 
    int h = 0;
    int count = 0;
    //printf("argv[1][2] == %c\n", argv[1][2]);
     
    if(argc <3){
        //argv[1] = PATTERN
        while((c = getchar()) != EOF){
            pole[count++] = c;
            if(count == pole_max){
                pole_max *= 2;
                pole = (char*)realloc(pole, pole_max*sizeof(char));
            }
            //printf("%c", c);
            if(c != argv[1][h]){
                h = 0;
            }
            if(c == argv[1][h]){
                h++;
                if(argv[1][h] == '\0'){
                    while((c = getchar()) != '\n'){
                        pole[count++] = c;
                        if(count == pole_max){
                            pole_max *= 2;
                            pole = (char*)realloc(pole, pole_max*sizeof(char));
                        }
                    }
                    //printf("\nVYSLEDNY RADEK\n\n");
                    for(int i = 0; i<count; i++){
                        printf("%c", pole[i]);
                    }
                    printf("\n");
                    ret = 0;
                }
            }
            if(c == '\n'){
                count = 0;
                pole_max = 10;
                pole = (char*)realloc(pole, pole_max*sizeof(char));
            }
        }
        free(pole);
        return ret;
    }
    int open = 2;
 	if(mode == 1){
    	open = 3;
    }
 
    FILE* f;
     
    f = fopen(argv[open], "r");
 
    if(mode == 1){
    
    	char* color;
    	int color_length = 0;
		int color_max = 10;
		color = (char*)malloc(color_max*sizeof(char));
    	
    	int start = 0;
    	int end = 0;
    	
    	int good = 0;
    	int blanik = 0;
    	
    	while((c = getc(f)) != EOF){
		    pole[count++] = c; 
		    if(count+2 == pole_max){
		        pole_max *= 2;
		        pole = (char*)realloc(pole, pole_max*sizeof(char));
		    }
		    if(c != argv[2][h]){
		        h = 0;
		    }
		    if(c == argv[2][h]){
		    	if(h == 0){
		    		start = count-1;
		    	}
		        h++;
		        if(argv[2][h] == '\0'){
		        	good++;
		        	end = count;
		        	color[color_length++] = start;
		        	color[color_length++] = end;
		        	if(color_length+2 == color_max){
		        		color_max *= 2;
		        		color = (char*)realloc(color, color_max*sizeof(char));
		        	} 
		        }
		    }
		    if(c == '\n'){
		    	if(good>0){
		    		int on = 0;
		    		for(int i = 0; i<count; i++){
		    			if(blanik<color_length){
							if(i == color[blanik]){
								if(on == 0){
									printf("\033[01;31m\033[K");
									on = 1;
								} else {
									printf("\033[m\033[K");
									on = 0;
								}
								blanik++;
							}
						}
		    			printf("%c",pole[i]);
		    		}
		    		good=0;
		    	}
		        count = 0;
		        pole_max = 10;
		        pole = (char*)realloc(pole, pole_max*sizeof(char));
		    }
		}
		ret = 0;
    	free(color);
    } else {
    
    	while((c = getc(f)) != EOF){
		    pole[count++] = c;
		    if(count == pole_max){
		        pole_max *= 2;
		        pole = (char*)realloc(pole, pole_max*sizeof(char));
		    }
		    //printf("%c", c);
		    if(c != argv[1][h]){
		        h = 0;
		    }
		    if(c == argv[1][h]){
		        h++;
		        if(argv[1][h] == '\0'){
		            while((c = getc(f)) != '\n'){
		                pole[count++] = c;
		                if(count == pole_max){
		                    pole_max *= 2;
		                    pole = (char*)realloc(pole, pole_max*sizeof(char));
		                }
		            }
		            //printf("\nVYSLEDNY RADEK\n\n");
		            for(int i = 0; i<count; i++){
		                printf("%c", pole[i]);
		            }
		            printf("\n");
		            ret = 0;
		        }
		    }
		    if(c == '\n'){
		        count = 0;
		        pole_max = 10;
		        pole = (char*)realloc(pole, pole_max*sizeof(char));
		    }
		}
	}
/*
    printf("PRINTENI MALLOCU\n");
    for(int i = 0; i<count; i++){
        printf("%c",pole[i]);
    }
*/
	
    free(pole);
    fclose(f);
    return ret;
}

