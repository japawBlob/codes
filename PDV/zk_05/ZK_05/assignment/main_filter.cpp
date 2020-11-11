#include <iostream>
#include <chrono>

#include "data_table.h"
#include "filter.h"

// Maximalni pocet iteraci
const unsigned int MAX_ITERATIONS = 10;

int main(int argc, char* argv[]) {
    using namespace std::chrono;

    unsigned int SIZE = 3000;
    if(argc > 2) {
        std::srand(atoi(argv[1]));
        SIZE = atoi(argv[2]);
    } else {
        std::srand(0);

        std::cout << "You can provide additional parameters when testing: [SEED] [SIZE]" << std::endl;
        std::cout << "  [SEED] - seed used for generating numbers in the table" << std::endl;
        std::cout << "  [SIZE] - dimension of the square table" << std::endl << std::endl;
    }

    data_table table(SIZE);
    generate_data(table);

    for(int i = 0 ; i < 10 ; i++) {
        auto t_start = std::chrono::high_resolution_clock::now();
        filtering(table, MAX_ITERATIONS);
        auto t_end = std::chrono::high_resolution_clock::now();
        double duration = duration_cast<microseconds>(t_end - t_start).count() / 1000.0;
        long long check_sum = generate_checksum(table.getData());

        std::cout << "Checksum " << check_sum << " computed in " << duration << "ms" << std::endl;
    }
}


