//
// Created by karel on 12.2.18.
//

#include <chrono>
#include <iostream>
#include <thread>
#include "PDVCrypt.h"
#include "decryption.h"

using namespace std;
using namespace std::chrono;

typedef vector<pair<string,enc_params>> messages_t;

int main(int argc, char ** argv) {

    // Inicializace pomoci nahodneho tajneho klice
    // Tajny klic slouzi k porovnani jednotlivych paralizacnich metod
    PDVCrypt crypt(" ABCDEFGHIJKLMNOPQRSTUVWXYZ");
    crypt.generateSecret();

    // Nastaveni parametru: pocet zprav, jejich delka a pouzita prvocisla
    const unsigned long n_messages = argc > 1 ? atol(argv[1]) : 20000000;
    const unsigned int message_length = 13;
    const unsigned long long p1 = 11;
    const unsigned long long p2 = 23;

    // Generuje zasifrovane zpravy
    messages_t encrypted;
    for(unsigned long i = 0 ; i < n_messages ; i++) {
        string s(message_length, ' ');
        for(unsigned int j = 0 ; j < message_length ; j++) {
            unsigned char rnd = rand() % 27;
            s[j] = rnd ? rnd+64 : ' ';
        }
        enc_params params(p1, p2, 0, rand() % 5);

        encrypted.emplace_back(s, params);
    }

    // Spocita referencni reseni pomoci OpenMP
    messages_t reference = encrypted;
    decrypt_openmp(crypt, reference, std::thread::hardware_concurrency());

    constexpr unsigned int n_methods = 6;
    decrypt_t methods[] = {
            decrypt_sequential,
            decrypt_openmp,
            decrypt_threads_1,
            decrypt_threads_2,
            decrypt_threads_3,
            decrypt_threads_4
    };
    const char * method_names[] = {
            "decrypt_sequential(...)",
            "decrypt_openmp(...)    ",
            "decrypt_threads_1(...) ",
            "decrypt_threads_2(...) ",
            "decrypt_threads_3(...) ",
            "decrypt_threads_4(...) "
    };

    // Porovna kazdou z Vami implementovanych metod
    for(unsigned int i = 0 ; i < n_methods ; i++) {
        messages_t messages = encrypted;

        try {
            // Desifruje a zmeri, jak dlouho to trvalo
            std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
            (*methods[i])(crypt, messages, std::thread::hardware_concurrency());
            std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();

            // Zkontroluje korektnost reseni
            unsigned long incorrect = 0;
            #pragma omp parallel for
            for(unsigned long j = 0 ; j < n_messages ; j++) {
                if(messages[j].first != reference[j].first) incorrect++;
            }

            printf("%s   %7ldms   (%ld/%ld decryptions incorrect)\n",
                method_names[i], duration_cast<milliseconds>(end-begin).count(), incorrect, n_messages);
        } catch(...) {
            printf("%s           ------ not implemented yet ------\n", method_names[i]);
        }
    }

    return EXIT_SUCCESS;
}
