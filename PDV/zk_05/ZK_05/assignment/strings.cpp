#include "strings.h"

#include <cmath>

constexpr unsigned int MAX_LENGTH = 50;

// vrati nahodne cislo v intervalu [0, max)
int random(int max) {
    return std::rand() % max;
}

char get_random_character() {
    return static_cast<char>(random(26) + 65);
}

void generate_strings(std::vector<std::string>& vector, unsigned int size) {
    for (unsigned int i=0; i<size; i++) {
        unsigned int length = MAX_LENGTH + (i<10 ? 2*MAX_LENGTH : 0);
        std::string s(length,' ');
        for (int k = 0; k < length; k++) {
            s[k] = get_random_character();
        }
        vector.emplace_back(s);
    }
}

void generate_strings_basic(std::vector<std::string>& vector, unsigned int size) {
    for (unsigned int i=0; i<size; i++) {
        unsigned int length = random(MAX_LENGTH/2);
        std::string s(length,' ');
        for (int k = 0; k < length; k++) {
            s[k] = get_random_character();
        }
        vector.emplace_back(s);
    }
}
