#ifndef PDVCRYPT_PDVCRYPT_H
#define PDVCRYPT_PDVCRYPT_H

#include <cstdlib>
#include <fstream>
#include <vector>

/**
 * Datova struktura, ktera obsahuje parametry desifrovaciho procesu
 */
typedef struct enc_params {
    unsigned long long p1;    // Prvocislo p1
    unsigned long long p2;    // Prvocislo p2
    unsigned int start;       // Index v retezci, ze ktereho zahajime desifrovaci proces
    unsigned int steps;       // Pocet kroku desifrovani, ktere mame provest

    enc_params(unsigned long long p1, unsigned long long p2, unsigned int start, unsigned int steps)
            : p1(p1), p2(p2), start(start), steps(steps) {};
    enc_params() : enc_params(0, 0, 0, 0) {}

} enc_params_t;

class PDVCrypt {

private:
    const size_t alphabet_size;                     // Pocet znaku abecedy (v nasem pripade 27: A-Z a mezera)

    unsigned int * secret = nullptr;                // Tabulka tajnych klicu (5-ti rozmerne pole, s 27 moznymi
                                                    // hodnotami v kazde dimenzi). Pomoci teto tabulky muzeme
                                                    // zjistit hodnotu tajneho klice pro kazdou petici znaku.

    unsigned char map_table[255];                   // Tabulka pro mapovani z ASCII znaku do abecedy (v nasem
                                                    // pripade cisel 0-26)
    unsigned char unmap_table[255];                 // Tabulka pro mapovani z 0-26 zpet do ASCII
    // Pro tabulky map_table a unmap_table plati: x = unmap_table[map_table[x]] pro vsechny x z abecedy

    // nasledujici map_table jsou pouze zkratkou pro map_table[c] a unmap_table[c]
    unsigned char MAP(unsigned char c) const;
    unsigned char UNMAP(unsigned char c) const;

public:
    PDVCrypt(const std::string & alphabet);
    PDVCrypt(const std::string & alphabet, std::istream & secretStream);

    ~PDVCrypt();

    // Metoda pro nacteni tajneho klice ze souboru
    void loadSecret(std::istream & secretStream);

    // Pokud nas zajima pouze vykon (a ne "smysl" desifrovani), muzeme si vygenerovat nahodny klic.
    void generateSecret();

    // Metoda pro desifrovani retezce "string", ktery byl zasifrovany pomoci parametru "params"
    // Metoda prepisuje hodnoty v retezci.
    void decrypt(std::string & string, const enc_params_t params) const;

    // Metoda, ktera nam vrati tajne cislo pro petici znaku [c1,c2,c3,c4,c5]
    unsigned int getSecret(unsigned char c1, unsigned char c2, unsigned char c3,
                           unsigned char c4, unsigned char c5) const {
        return secret[27*(27*(27*(27*c1 + c2) + c3) + c4) + c5];
    }
};


#endif //PDVCRYPT_PDVCRYPT_H
