

#include <cstdlib>
#include <vector>
#include <iostream>
#include "data_table.h"

int random(int max) {
    return rand() % max;
}

void generate_data(data_table& table) {
    const unsigned int S = table.getSize();
    for (int i=0; i<S; i++) {
        for (int j=0; j<S; j++) {
            table(i,j) = random(MAX_VALUE);
        }
    }
}

long long generate_checksum(const std::vector<unsigned int>& vector) {
    double result = 0;

    for (int i = 0; i < vector.size(); i++) {
        result += i * vector[i] * 31 + 17;
    }

    return result;
}
