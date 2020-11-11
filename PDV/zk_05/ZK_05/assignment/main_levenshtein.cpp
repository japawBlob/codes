#include <iostream>
#include <chrono>

#include "strings.h"
#include "levenshtein.h"

int main(int argc, char* argv[]) {
    using namespace std::chrono;

    unsigned int SIZE = 200;
    if(argc > 2) {
        std::srand(atoi(argv[1]));
        SIZE = atoi(argv[2]);
    } else {
        std::srand(0);

        std::cout << "You can provide additional parameters when testing: [SEED] [SIZE]" << std::endl;
        std::cout << "  [SEED] - seed used for generating the set of strings" << std::endl;
        std::cout << "  [SIZE] - number of strings generated" << std::endl << std::endl;
    }

    std::vector<std::string> vector;

    // Vygenerovani dat
    generate_strings(vector, SIZE);
    const std::vector<std::string> & cVector = vector;

    unsigned int maxIndex;

    for(int i = 0 ; i < 5 ; i++) {
        auto t_start = std::chrono::high_resolution_clock::now();
        long distance = distances(cVector, maxIndex);
        auto t_end = std::chrono::high_resolution_clock::now();
        double time = duration_cast<microseconds>(t_end - t_start).count() / 1000.0;

        std::cout << "Solution of "<< i+1  <<". instance generated in " << time << "ms" << std::endl
                  << "   Distance:     " << distance << std::endl
                  << "   Max distance idx:     " << maxIndex << std::endl;
    }

    return 0;
}
