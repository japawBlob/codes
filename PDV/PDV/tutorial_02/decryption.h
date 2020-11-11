//
// Created by karel on 12.2.18.
//

#ifndef PDVCRYPT_DECRYPTION_H
#define PDVCRYPT_DECRYPTION_H

#include <vector>
#include <string>
#include "PDVCrypt.h"

typedef void (*decrypt_t)(const PDVCrypt&, std::vector<std::pair<std::string,enc_params>>&, unsigned int);

// Desifrovaci metody z prvniho cviceni
void decrypt_sequential(const PDVCrypt & crypt, std::vector<std::pair<std::string,enc_params>> & encrypted, unsigned int numThreads);
void decrypt_openmp(const PDVCrypt & crypt, std::vector<std::pair<std::string,enc_params>> & encrypted, unsigned int numThreads);

// Desifrovaci metody, tela metod si naimplementujete sami
void decrypt_threads_1(const PDVCrypt & crypt, std::vector<std::pair<std::string,enc_params>> & encrypted, unsigned int numThreads);
void decrypt_threads_2(const PDVCrypt & crypt, std::vector<std::pair<std::string,enc_params>> & encrypted, unsigned int numThreads);
void decrypt_threads_3(const PDVCrypt & crypt, std::vector<std::pair<std::string,enc_params>> & encrypted, unsigned int numThreads);
void decrypt_threads_4(const PDVCrypt & crypt, std::vector<std::pair<std::string,enc_params>> & encrypted, unsigned int numThreads);

#endif //PDVCRYPT_DECRYPTION_H
