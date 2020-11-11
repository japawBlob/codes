#include "sort.h"
#include <iostream>

using namespace std;

// implementace vaseho radiciho algoritmu. Detalnejsi popis zadani najdete v "sort.h"
void radix_par(std::vector<std::string *> &vector_to_sort, const MappingFunction &mappingFunction,
               unsigned long alphabet_size, unsigned long string_lengths) {

    // sem prijde vase implementace. zakomentujte tuto radku

    // abeceda se nemeni. jednotlive buckety by mely reprezentovat znaky teto abecedy. poradi znaku v abecede
    // dostanete volanim funkce mappingFunction nasledovne: mappingFunction((*p_retezec).at(poradi_znaku))

    // vytvorte si spravnou reprezentaci bucketu, kam budete retezce umistovat

    // pro vetsi jednoduchost uvazujte, ze vsechny retezce maji stejnou delku - string_lengths. nemusite tedy resit
    // zadne krajni pripady

    // na konci metody by melo byt zaruceno, ze vector pointeru - vector_to_sort bude spravne serazeny.
    // pointery budou serazeny podle retezcu, na ktere odkazuji, kdy retezcu jsou serazeny abecedne

    vector<vector<string *>> bucket (alphabet_size, vector<string *>(0));
    vector<int> start (alphabet_size);

    //core radix sort
    /*for (int i = vector_to_sort.size()-1; i >= 0; i--) {
        string *s = vector_to_sort[i];
        int e = mappingFunction(s->at(vector_to_sort.at(0)->size() - string_lengths));
        bucket[e].push_back(s);
    }*/
    for (int i = vector_to_sort.size()-1; i >= 0; i--) {
        string *currentString = vector_to_sort[i];
        int whichLetter = mappingFunction(currentString->at(vector_to_sort.at(0)->size() - string_lengths));
        //printf("cely: %i, \n vnitrek: %i \n", currentString->at(vector_to_sort.at(0)->size() - string_lengths), vector_to_sort.at(0)->size() - string_lengths);
        bucket[whichLetter].push_back(currentString);
    }

    //if there is something left to sort... well sort it...
    if(string_lengths > 1){
#pragma omp parallel for schedule (guided)
        for (int i = 0; i < alphabet_size; i++) {
            radix_par(bucket[i], mappingFunction, alphabet_size, string_lengths - 1);
        }
    }
    //figure out where is the buckets ingex in final vector
    for (int i = 0; i < alphabet_size-1; i++){
        //printf("start: %i", start[i]);
        start[i+1] = start[i] + bucket[i].size();
    }
    //final combination of buckets into one final vector
#pragma omp parallel for schedule (dynamic)
    for (int i = 0; i < alphabet_size; i++) {
        for (int j = 0; j < bucket[i].size(); j++) {
            vector_to_sort[start[i] + j] = bucket[i][j];
        }
    }
}