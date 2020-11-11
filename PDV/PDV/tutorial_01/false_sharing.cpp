#include <thread>
#include <cstdio>
#include <vector>

using namespace std;

constexpr size_t NTHREADS = 8;
constexpr size_t STEP = 1;//Kdyz se step zvedne na 16 brutalne se to zrychli, nebo i vic - jde to to, ay thready nepristupovali k pameti, ktera je blizko u sebe a nemuseli resit synchronizaci

int data[NTHREADS * STEP];

// Tuto funkci vykonava NTHREADS vlaken soucasne. Kazde vlakno zapisuje pouze
// do pametove bunky odkazovane pomoci ukazatele x.
void inc(volatile int * x)
{
    for (unsigned long long i = 0L; i < 1'000'000'000; ++i) {
        if (i & 1) ++*x;
        else *x = (*x) * (*x);
    }
}

int main(int argc, char ** argv) {
    std::vector<std::thread> threads;
    std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();

    for(unsigned int t = 0 ; t < NTHREADS ; t++) {
        // Nyni spustime vlakna. Kazde vlakno bude cist a zapisovat do promenne na pozici
        // t * STEP v poli data. Pokud zvolime hodnotu STEP=1, promenne se nachazi ve stejne
        // cache-line (a proto hrozi, ze dojde k false-sharingu, protoze vic jader bude mit
        // stejnou cache-line ve sve privatni cache). Pokud hodnotu navysime, napriklad na
        // STEP=16, vzdalenost mezi dvemi sousednimi promennymi bude 16 * sizeof(int). Pokud
        // sizeof(int)=4 a velikost cache-line je 64B, promenne se nikdy nebudou nachazet ve
        // stejne cache-line, a k false-sharingu tak nedojde.
        threads.emplace_back(inc, &data[t * STEP]);
    }

    // Na zaver jeste pockame na dokonceni vsech vlaken
    for(unsigned int t = 0 ; t < NTHREADS ; t++) {
        threads[t].join();
    }

    std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();

    printf("Took: %ldms\n", chrono::duration_cast<chrono::milliseconds>(end-begin).count());

    return 0;
}