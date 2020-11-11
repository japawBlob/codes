#include <chrono>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <immintrin.h>
#include <iostream>

// Pro ucely porovnani v nasem kodu pouzivame jednoduchou aproximaci
// funkce exp(x) - jak pro skalarni tak vektorizovanou verzi. Pokud
// byste chteli pouzit vyrazne presnejsi aproximaci, muzete vyuzit
// funkce exp256_ps(...) z hlavickoveho souboru avx_mathfun.h .
#include "avx_mathfun.h"

inline float exp_scalar(float x) {
    float addthree = x + 3.0;
    float subthree = x - 3.0;

    return (
        (addthree * addthree + 3) / (subthree * subthree + 3)
    );
}

// Skalarni implementace funkce, ktera vypocte hodnotu hustotni funkce
// normalniho rozdeleni (s parametry mu a sigma) nad polem dat 'data'.
void normaldist_scalar(float mu, float sigma, float *data, size_t length) {
    float expdiv = -2 * sigma * sigma;
    float normalizer = sqrt(2 * M_PI * sigma * sigma);

    for(unsigned int i = 0 ; i < length ; i++) {
        float sc_data = data[i] - mu;
        sc_data = sc_data * sc_data;
        sc_data = sc_data / expdiv;
        sc_data = exp_scalar(sc_data);
        sc_data = sc_data / normalizer;
        data[i] = sc_data;
    }
}

// Vektorova implementace funkce 'exp_scalar(...)'
inline __m256 exp_vec(__m256 x) {
    __m256 three = _mm256_set1_ps(3.0f);
    __m256 addthree = _mm256_add_ps(x, three);
    __m256 subthree = _mm256_sub_ps(x, three);

    return _mm256_div_ps(
        _mm256_add_ps(_mm256_mul_ps(addthree, addthree), three),
        _mm256_add_ps(_mm256_mul_ps(subthree, subthree), three)
    );
}

// Vektorova implementace funkce 'normaldist_scalar(...)'.
void normaldist_vec(float mu, float sigma, float * data, size_t length) {
    __m256 mm_mu = _mm256_set1_ps(mu);
    __m256 mm_expdiv = _mm256_set1_ps(-2 * sigma * sigma);
    __m256 mm_normalizer = _mm256_set1_ps(sqrt(2*M_PI*sigma*sigma));
    for(unsigned int i = 0 ; i < length ; i += 8) {
        __m256 mm_data = _mm256_loadu_ps(&data[i]);
        mm_data = _mm256_sub_ps(mm_data, mm_mu);
        mm_data = _mm256_mul_ps(mm_data, mm_data);
        mm_data = _mm256_div_ps(mm_data, mm_expdiv);

        mm_data = exp_vec(mm_data);
        mm_data = _mm256_div_ps(mm_data, mm_normalizer);



        _mm256_storeu_ps(&data[i], mm_data);
        // Doplnte vektorove operace pro vypocet hodnoty hustotni funkce
        // normalniho rozdeleni s parametry mu a sigma. Muzete predpokladat,
        // ze length%8==0. Vsimnete si, ze se for smycka posouva o 8 prvku.
        // To je proto, ze do jednoho __m256 vektoru se nam vejde 8 cisel
        // typu 'float' (8x32bit = 256bit).
    }
}

int main() {
    using namespace std::chrono;

    // Vygenerujeme data
    constexpr size_t N = 8 * 10000000;
    std::vector<float> data(N);
    for(unsigned int i = 0 ; i < N ; i++) {
        data[i] = 3 * rand() / (float)RAND_MAX;
    }

    // Vytvorime kopie dat
    auto data1 = data;
    auto data2 = data;
    unsigned long elapsedScalar = 0ULL;

    // Pustime skalarni verzi
    {
        auto begin = steady_clock::now();
        normaldist_scalar(0.0f, 1.0f, &data1[0], N);
        auto end = steady_clock::now();
        elapsedScalar = duration_cast<microseconds>(end - begin).count();

        printf("Cas skalarni verze:          %dms  \tspeedup 1x\n",elapsedScalar);
    }

    // Pustime vektorizovanou verzi
    {
        try {
            auto begin = steady_clock::now();
            normaldist_vec(0.0f, 1.0f, &data2[0], N);
            auto end = steady_clock::now();
            unsigned long elapsedVectorized = duration_cast<microseconds>(end - begin).count();

            double speedup = (double) elapsedScalar / elapsedVectorized;
            printf("Cas vektorizovane verze:     %dms  \tspeedup %.2fx\n", elapsedVectorized, speedup);
        }
        catch(...){
            printf("Cas vektorizovane verze:     --- not implemented ---\n");
        }
    }

    // Spocitame rozdily v approximaci
    double diff = 0.0f;
    for(unsigned int i = 0 ; i < N ; i++) {
        double cdiff = (double)data1[i] - (double)data2[i];
        diff += (cdiff < 0 ? -cdiff : cdiff);
    }
    printf("Absolutni chyba vypoctu:     %.2f\n",diff);

    return 0;
}