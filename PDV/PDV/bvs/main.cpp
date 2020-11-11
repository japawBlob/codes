#include <cstdio>
#include <chrono>

#include "tests.h"

constexpr unsigned int N1 = 1000000;      // Kolik prvku budeme do BVS vkladat "napreskacku"
constexpr unsigned int N2 = 40000;         // Kolik prvku budeme do BVS vkladat "poporade"

// Tato metoda spousti test definovany ve tride Test (implementaci testu si muzete prohlednout
// ve tride tests.h).
template <typename Test>
void run_test(std::string test_name) {
    using namespace std::chrono;

    // Nejprve si vytvorime instanci testu
    Test test;

    try {
        // Cas zacatku behu testu
        auto begin = steady_clock::now();
        // Beh testu
        test.run_test();
        // Konec behu testu
        auto end = steady_clock::now();

        // Kontrola spravnosti vysledku
        if(!test.verify()) {
            printf("%s       --- wrong result ---\n", test_name.c_str());
        } else {
            printf("%s          %7ldms\n", test_name.c_str(), duration_cast<milliseconds>(end-begin).count());
        }
    } catch(...) {
        printf("%s      --- not implemented ---\n", test_name.c_str());
    }
}

int main() {
    // Test vkladani do BST "napreskacku"
    run_test<shuffled_data<N1>>("Shuffled data");
    // Test vkladani do BST "poporade"
    run_test<sorted_data<N2>>  ("Sorted data  ");

    return 0;
}