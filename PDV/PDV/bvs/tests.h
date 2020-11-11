#ifndef PDV_HW03_TESTS_H
#define PDV_HW03_TESTS_H

#include <vector>
#include <numeric>
#include <algorithm>
#include <functional>
#include <cstdlib>

#include "bst_tree.h"

// Oba nase testy se skladaji ze vkladani sekvence cisel 0..N-1 do Vaseho binarniho vyhledavaciho
// stromu (at uz v serazenem nebo neserazenem poradi). Oba tyto testy jsou v zakladu velice podob-
// ne, a implementujeme proto na zaklade stejne tridy 'base_test'.
template <unsigned int N>
class base_test {
public:
    std::vector<long long> data;   // Data, ktera budeme do stromu vkladat
    bst_tree tree;                 // Instance stromu

    base_test() : data(N) {
        // Vytvorime si sekvenci cisel 0..N-1
        std::iota(data.begin(), data.end(), 0);
    }

    // Beh testu
    void run_test() {
        // Test se sklada ze vkladani prvku vektoru 'data' do binarniho vyhledavaciho stromu paralelne
        // vice vlakny. Vsimnete si, ze pouzivame dynamicky scheduling, protoze chceme alespon castecne
        // dodrzet poradi vkladani prvku do stromu. (Pokud bychom pouzili staticky scheduling, vlakna 
        // s vyssim indexem by zacinala se vkladanim prvku z prostredku pole, presneji na indexech
        // k*N/omp_get_num_threads()).
        #pragma omp parallel for schedule(dynamic)
        for(unsigned int i = 0 ; i < N ; i++) {
            tree.insert(data[i]);
        }
    }

    // Kontrola spravnosti vysledku
    bool verify() {
        // Strom prochazime v poradi inorder a jeho prvky si vkladame do pole. Diky vlastnostem binarniho
        // vyhledavaciho stromu by vysledkem melo byt serazene pole.
        std::vector<long long> content;
        std::function<void(bst_tree::node*)> inorder = [&](bst_tree::node * node) {
            if(node != nullptr) {
                inorder(node->left);
                content.push_back(node->data);
                inorder(node->right);
            }
        };
        inorder(tree.root);

        // Nyni zkontrolujeme, ze pole 'content' skutecne obsahuje serazena cisla 0..N-1
        if(content.size() != N) return false;
        for(unsigned int i = 0 ; i < N ; i++) {
            if(content[i] != i) return false;
        }
        return true;
    }
};

// Test 'shuffled_data' se od zakladniho testu lisi pouze tim, ze vstupni data, ktera se vkladaji do
// binarniho vyhledavaciho stromu jsou zprehazena.
template <unsigned int N>
class shuffled_data : public base_test<N> {
public:
    shuffled_data() {
        srand(0L);
        std::random_shuffle(this->data.begin(), this->data.end());
    }
};

// Test se serazenymi daty je identicky jako zakladni test.
template <unsigned int N>
class sorted_data : public base_test<N> {
};

#endif //PDV_HW03_TESTS_H
