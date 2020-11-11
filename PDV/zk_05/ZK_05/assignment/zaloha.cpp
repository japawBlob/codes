#include <cmath>
#include "data_table.h"
/*
void filtering(data_table& table, unsigned int iterations) {
    const int S = table.getSize();

    int count = -1;
    for (int iter=0; iter<iterations; ++iter) {
        for (int i = 0; i < S*2-1; ++i) {
            if(i<S){
                count++;
            } else {
                count--;
            }
//#pragma omp parallel for schedule(guided)
            for (int j = count; j >= 0; --j) {
                int xcoord, ycoord;
                if(i>S-1){
                    xcoord = S-1-(count-j);
                    ycoord = S-1-j;
                } else {
                    xcoord = i-j;
                    ycoord = j;
                }
                int old_value = table(xcoord, ycoord);
                int new_value = old_value*old_value;

                // Update hodnoty pocitame na zaklade 4-okoli
                /*new_value += (i-1 >= 0) ? table(i-1,j)*table(i-1,j) : 0;
                new_value += (j-1 >= 0) ? table(i,j-1)*table(i,j-1) : 0;
                new_value += (i+1 < S) ? table(i+1,j)*table(i+1,j) : 0;
                new_value += (j+1 < S) ? table(i,j+1)*table(i,j+1) : 0;

                new_value += (xcoord-1 >= 0) ? table(xcoord-1,ycoord)*table(xcoord-1,ycoord) : 0;
                new_value += (ycoord-1 >= 0) ? table(xcoord,ycoord-1)*table(xcoord,ycoord-1) : 0;
                new_value += (xcoord+1 < S) ? table(xcoord+1,ycoord)*table(xcoord+1,ycoord) : 0;
                new_value += (ycoord+1 < S) ? table(xcoord,ycoord+1)*table(xcoord,ycoord+1) : 0;
                //printf("%i %i", xcoord, ycoord);
                table(xcoord,ycoord) = std::sqrt(new_value/3);
                //table(i,j) = std::sqrt(new_value/3);
            }
            //printf("\n");
        }
    }
}*/
/*
void filtering(data_table& table, unsigned int iterations) {
    const int S = table.getSize();

    for (int iter=0; iter<iterations; ++iter) {
        for (int i = 0; i < S; ++i) {
//#pragma omp parallel for schedule(guided)
            for (int j = 0; j < S; ++j) {
                int old_value = table(i, j);
                int new_value = old_value*old_value;

                // Update hodnoty pocitame na zaklade 4-okoli
                new_value += (i-1 >= 0) ? table(i-1,j)*table(i-1,j) : 0;
                new_value += (j-1 >= 0) ? table(i,j-1)*table(i,j-1) : 0;
                new_value += (i+1 < S) ? table(i+1,j)*table(i+1,j) : 0;
                new_value += (j+1 < S) ? table(i,j+1)*table(i,j+1) : 0;

                table(i,j) = std::sqrt(new_value/3);
            }
        }
    }
}
*/
int compute (int i, int j, data_table& table, int S){
    int old_value = table(i, j);
    int new_value = old_value*old_value;

    // Update hodnoty pocitame na zaklade 4-okoli
    new_value += (i-1 >= 0 && j+1 < S) ? table(i-1,j+1)*table(i-1,j+1) : 0;
    new_value += (j+1 < S && i+1 < S) ? table(i+1,j+1)*table(i+1,j+1) : 0;
    new_value += (i+1 < S) ? table(i+1,j)*table(i+1,j) : 0;
    new_value += (i+1 < S && j-1 >= 0) ? table(i+1,j-1)*table(i+1,j-1) : 0;

    return std::sqrt(new_value/3);
}

void filtering(data_table& table, unsigned int iterations) {
    const int S = table.getSize();
/*
    for (int iter=0; iter<iterations; ++iter) {
        for (int i = 0; i < S; ++i) {
//#pragma omp parallel for schedule(guided)
            for (int j = 0; j < S; ++j) {
                int old_value = table(i, j);
                int new_value = old_value*old_value;

                // Update hodnoty pocitame na zaklade 4-okoli
                new_value += (i-1 >= 0 && j+1 < S) ? table(i-1,j+1)*table(i-1,j+1) : 0;
                new_value += (j+1 < S && i+1 < S) ? table(i+1,j+1)*table(i+1,j+1) : 0;
                new_value += (i+1 < S) ? table(i+1,j)*table(i+1,j) : 0;
                new_value += (i+1 < S && j-1 >= 0) ? table(i+1,j-1)*table(i+1,j-1) : 0;

                table(i,j) = std::sqrt(new_value/3);
            }
        }
    }*/

    //int a = 0, b = 0;
    for (int iter=0; iter<iterations; ++iter) {
        for (int k = 0; k < 3 * S - 2; k++) {
//#pragma omp parallel for
            for (int i = 0, j = k; i < S && j >= 0; i++, j-=2) {
                //here:
                while (j >= S) {
                    //printf("here\n");
                    //b++;
                    i++;
                    j-=2;
                    //goto here;
                }
                //printf("and there\n");
                //a++;
                int old_value = table(i, j);
                int new_value = old_value*old_value;

                // Update hodnoty pocitame na zaklade 4-okoli
                new_value += (i-1 >= 0 && j+1 < S) ? table(i-1,j+1)*table(i-1,j+1) : 0;
                new_value += (j+1 < S && i+1 < S) ? table(i+1,j+1)*table(i+1,j+1) : 0;
                new_value += (i+1 < S) ? table(i+1,j)*table(i+1,j) : 0;
                new_value += (i+1 < S && j-1 >= 0) ? table(i+1,j-1)*table(i+1,j-1) : 0;

                table(i,j) = std::sqrt(new_value/3);
            }
        }

    }
    //printf("S = %i, a = %i, b = %i\n",S, a, b);
}

