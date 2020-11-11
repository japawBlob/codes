#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct{
    int value;
    int d;
    int days[50];
} Experiment;

int scanForSpace(int curvalue, Experiment *rest, int *curspace, int exp);
int * duparray(int const * src);
int countDays(int * array);

//globalni promenne
int maxvalue = 0;
int maxdays = 0;
int d = 0;

int main (int argc, char *argv[])
{
    int n;
    //cteni hlavy
    scanf("%d %d", &n, &d);

    Experiment *e = (Experiment *)malloc(n*sizeof(Experiment));

    //cteni
    for(int i = 0; i < n; ++i){
        scanf("%d %d", &(e + i)->d, &(e + i)->value);
        for(int j = 0; j < (e + i)->d; ++j){
            scanf("%d", &(e+i)->days[j]);
        }
        (e + i)->days[(e+i)->d] = -1;
    }
    //algoritmus
    int *time = (int *)calloc(d, sizeof(int));
    if (scanForSpace(0, e, time, n) == 0) printf("%d %d\n", maxvalue, maxdays);



    //uvolneni
    free(time);
    free(e);
    return 0;
}

int scanForSpace(int curvalue, Experiment *rest, int *curspace, int exp)
{
    //setup
    int ret = 0;
    int nextExp = (exp - 1);
    int value = 0;
    //prochazeni vsech experimentu
    for(int i = 0; i < exp; ++i){
        int broken = 0;
        //duplikace pole s aktualnim rozvrhem
        int *space = duparray(curspace);
        //rozdil aktualniho experimentu prvniho a posledniho dne
        int diff = (rest + i)->days[((rest + i)->d - 1)];
        //vejde se mi do rozvrhu experiment?
        for(int j = 0; j < (d - diff); ++j){
            int br = 0;
            for(int k = 0; k < (rest + i)->d; ++k){
                if(curspace[j + (rest + i)->days[k]] == 0) ++br;
                else br = 0;
            }
            //vesel se, zapis to do duplikatu
            if (br == (rest + i)->d) {
                broken = 1;
                for(int k = 0; k < (rest + i)->d; ++k) space[j + (rest + i)->days[k]] = 1;
                break;
                }
        }
        //pouzil jsem experiment?
        if (broken == 0) {
            //ne -> jdi dal
            free(space);
            continue;
        } 
        //vytvoreni noveho pole experimentu bez aktualniho pro dalsi generaci
        Experiment *next = (Experiment *)malloc(nextExp*sizeof(Experiment));
        for(int j = 0; j < nextExp; ++j){
            if(i == j) next[j] = rest[nextExp];
            else next[j] = rest[j];
        }
        value = curvalue + (rest + i)->value;
        //kontrola nejvyssi hodnoty
        if(value > maxvalue) { 
            maxvalue = value;
            maxdays = countDays(space);
        }
        //rekurze
        scanForSpace(value, next, space, nextExp);
        //uvolneni
        free(space);
        free(next);
    }
    return 0;
}

//duplikace pole
int * duparray(int const * src)
{
   int * array = malloc(d * sizeof(int));
   memcpy(array, src, d * sizeof(int));
   return array;
}

//pocitani dnu
int countDays(int * array)
{
    int days = 0;
    for (int i = 0; i < d; ++i){
        if (array[i] == 1) ++days;
    }
    return days;
}