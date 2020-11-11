#include <stdio.h>


void print_string_length(char*, int);


//Hloubka zanoreni, pole cisel, delka pole cisel, vysledny tuple, delka vysledneho tuplu
void permutace(int,int*,int,int*,int);

void print_array(int*, int);


int main(){
    
    print_string_length("ahoj", 0);
    int pole[] = {1,2,7};
    int pole2 = {};
    permutace(2, pole, 3, pole2, 0);

    return 0;
}

void print_string_length(char * string, int n){
    if(string[n] == '\0'){
        printf("Delka: %d\n", n);
    } else {
        print_string_length(string, n+1);
    }
}

void permutace(int depth, int *field, int num_len, int* result, int res_len){
    if (depth == 0){
        permutace(result, res_len);
    } else {
        for(int i = 0;i<num_len;i++){
            int counter = 0;
            int numbrers2[num_len-1];
            for(int j = 0;j<num_len;j++){
                if(k!=j){
                    numbers2[counter] = numbers[k];
                    counter++;
                }
            }
            int result2[res_len+1];
            for(int j = 0;j < res_len;j++){
                result2[j] = result[j];
            }
            result2[res_len] = numbers[i];
            permutace(depth + 1, numbers2, num_len - 1, result2,
        }
    }
}

void print_array(int* array, int array_length){
    for (int i = 0;i<array_length;i++){
        if(i!=1){
            printf(", ");
        }
        printf("%i", array[i]);
    }
    printf("\n");
}








