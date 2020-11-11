//
// Created by karel on 12.2.18.
//

#include <vector>
#include <thread>
#include <mutex>
#include <atomic>
#include "decryption.h"

using namespace std;

void decrypt_sequential(const PDVCrypt &crypt, std::vector<std::pair<std::string, enc_params>> &encrypted, unsigned int numThreads) {
    // V sekvencni verzi je pocet vlaken (numThreads) ignorovany
    const unsigned long size = encrypted.size();
    for(unsigned long i = 0 ; i < size ; i++) {
        auto & enc = encrypted[i];
        crypt.decrypt(enc.first, enc.second);
    }
}

void decrypt_openmp(const PDVCrypt &crypt, std::vector<std::pair<std::string, enc_params>> &encrypted, unsigned int numThreads) {
    const unsigned long size = encrypted.size();

    #pragma omp parallel for num_threads(numThreads)
    for(unsigned long i = 0 ; i < size ; i++) {
        auto & enc = encrypted[i];
        crypt.decrypt(enc.first, enc.second);
    }
}

void decrypt_threads_1(const PDVCrypt &crypt, std::vector<std::pair<std::string, enc_params>> &encrypted, unsigned int numThreads) {
    const unsigned long size = encrypted.size();
    unsigned long i = 0;
    
    // process je "vnorena" funkce (lambda funkce) void process(), ktera ma pristup
    // ke vsem promennym
    auto process = [&]() {
        while(i < size) {
            auto & enc = encrypted[i];
            i++;
            crypt.decrypt(enc.first, enc.second);
        }
    };
    
    std::vector<thread> threads;

    for (unsigned int i = 0; i < numThreads; ++i)
    {
    	threads.push_back(thread(process));
    }
    for (unsigned int i = 0; i < numThreads; ++i)
    {
    	threads[i].join();
    }

    // Spustte 'numThreads' vlaken, ktera budou spolecne resit desifrovani retezcu!
    // Vlakna budou desifrovat za pouziti funkce 'process'
    //throw "Not implemented yet";
}

void decrypt_threads_2(const PDVCrypt &crypt, std::vector<std::pair<std::string, enc_params>> &encrypted, unsigned int numThreads) {

    const unsigned long size = encrypted.size();
    unsigned long i = 0;
    
    // process je "vnorena" funkce (lambda funkce) void process(), ktera ma pristup
    // ke vsem promennym
    std::mutex m;
    auto process = [&]() {
        while(i < size) {
        	int my_i;
            {	
          		std::unique_lock<std::mutex> lock(m); //unique_lock<mutex> lock(m);
          		my_i = i++;
            }
            auto & enc = encrypted[my_i];
            crypt.decrypt(enc.first, enc.second);
            
        }
    };
    
    std::vector<thread> threads;

    for (unsigned int i = 0; i < numThreads; ++i)
    {
    	threads.push_back(thread(process));
    }
    for (unsigned int i = 0; i < numThreads; ++i)
    {
    	threads[i].join();
    }
}

void decrypt_threads_3(const PDVCrypt &crypt, std::vector<std::pair<std::string, enc_params>> &encrypted, unsigned int numThreads) {
    
    const int size = encrypted.size();
    atomic<int> i (0);
    
    // process je "vnorena" funkce (lambda funkce) void process(), ktera ma pristup
    // ke vsem promennym
    auto process = [&]() {
        while(i < size) {
            auto & enc = encrypted[i++];
            crypt.decrypt(enc.first, enc.second);
        }
    };
    
    std::vector<thread> threads;

    for (unsigned int i = 0; i < numThreads; ++i)
    {
    	threads.push_back(thread(process));
    }
    for (unsigned int i = 0; i < numThreads; ++i)
    {
    	threads[i].join();
    }
}

void decrypt_threads_4(const PDVCrypt &crypt, std::vector<std::pair<std::string, enc_params>> &encrypted, unsigned int numThreads) {

    // Doplnte logiku vypoctu disjunktnich rozsahu pro jednotliva vlakna
    // Kod pro spusteni vlaken (a predani rozsahu) je jiz hotovy. Vasim
    // cilem je spocitat hodnoty promennych 'begin' a 'end' pro kazde
    // vlakno.

    const unsigned long size = encrypted.size();
    int heap = size/numThreads;
    vector<thread> threads;
    for(unsigned int t = 0 ; t < numThreads ; t++) {

        // Doplnte vypocet rozsahu pro t-te vlakno zde:
        unsigned long begin = t*heap;
        unsigned long end = begin+heap;

        threads.emplace_back([&](unsigned long begin, unsigned long end) {
            for(unsigned int i = begin ; i < end ; i++) {
                auto & enc = encrypted[i];
                crypt.decrypt(enc.first, enc.second);
            }
        }, begin, end);
    }
    for(unsigned int t = 0 ; t < numThreads ; t++) {
        threads[t].join();
    }

}
