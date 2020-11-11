#include "PDVCrypt.h"

PDVCrypt::PDVCrypt(const std::string &alphabet)
        : alphabet_size(alphabet.length()),
          secret(
            (unsigned int *)malloc(alphabet_size *   // Inicializace 5-ti rozmerneho pole
                                   alphabet_size *
                                   alphabet_size *
                                   alphabet_size *
                                   alphabet_size * sizeof(unsigned int)))
{
    // Nejprve nainicializujeme tabulky pro mapovani z ASCII do [0..alphabet_size-1] a zpet
    int i = 0;
    for(unsigned char c : alphabet) {
        map_table[c] = i;
        unmap_table[i] = c;
        i++;
    }
}
PDVCrypt::PDVCrypt(const std::string &alphabet, std::istream &secretStream) : PDVCrypt(alphabet) {
    loadSecret(secretStream);
}

PDVCrypt::~PDVCrypt() {
    // Destruktor uvolni pamet vyhrazenou pro tajny klic
    free(secret);
}

// Nacte sifrovaci tabulku ze vstupniho proudu (typicky souboru)
void PDVCrypt::loadSecret(std::istream &secretStream) {
    const size_t size = 27*27*27*27*27 * sizeof(unsigned int);
    secretStream.read((char*)secret, size);
}

// Vygeneruje nahodnou sifrovaci tabulku
void PDVCrypt::generateSecret() {
    const size_t size = 27*27*27*27*27;
    for(unsigned int i = 0 ; i < size ; i++) secret[i] = 10000 + rand()%1000;
}

// Funkce MAP mapuje znaky z ASCII do [0..alphabet_size-1] a UNMAP je mapuje zpet do ASCII
// Plati x = UNMAP(MAP(x)) pro znaky x z pouzite abecedy
unsigned char PDVCrypt::MAP(unsigned char c) const {
    return map_table[c];
}
unsigned char PDVCrypt::UNMAP(unsigned char c) const {
    return unmap_table[c];
}

// Funkce pro desifrovani retezce "string" zasifrovaneho za pouziti sifrovacich parametru
// params a sifrovaci tabulky secret. Desifrovani probiha "in-place", tedy znaky jsou
// prepisovane primo v retezci "string".
void PDVCrypt::decrypt(std::string & string, const enc_params_t params) const {
    int index = params.start;  // Desifrovani zacina na pozici params.start
    const size_t length = string.length();

    // Provadime params.steps kroku desifrovaciho procesu
    for(unsigned int i = 0 ; i < params.steps ; i++) {

        // [c1,c2,c3,c4,c5] je petice znaku okolo aktualniho indexu, kterou vyuzijeme pro
        // ziskani sifrovaciho klice pro aktualni krok desifrovani.
        const unsigned char c1 = MAP(string[(index+length-2) % length]);
        const unsigned char c2 = MAP(string[(index+length-1) % length]);
        const unsigned char c3 = MAP(string[(index+length+0) % length]);
        const unsigned char c4 = MAP(string[(index+length+1) % length]);
        const unsigned char c5 = MAP(string[(index+length+2) % length]);

        // Nalezneme odpovidajici sifrovaci cislo
        const unsigned int currentSecret = getSecret(c1, c2, c3, c4, c5);

        // A provedeme desifrovaci vypocet (vsimnete si pouziti funkci MAP a UNMAP pro prevod
        // z ASCII do pouzite abecedy a zpet)
        string[index] = UNMAP((c3 + params.p1 * currentSecret) % alphabet_size);
        index = (index + params.p2 * currentSecret) % length; 
    }
}
