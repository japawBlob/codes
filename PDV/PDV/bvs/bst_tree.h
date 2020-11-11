#include <atomic>
#ifndef PDV_HW03_BST_H
#define PDV_HW03_BST_H

class bst_tree {
public:

    // Trida node reprezentuje uzel binarniho vyhledavaciho stromu. Definici teto tridy si
    // muzete upravit, zachovejte ale prosim clenske promenne left, right (pointery, ktere
    // mohou byt atomicke i neatomicke) a clenskou promennou data.
    class node {
    public:
        std::atomic<node *> left { nullptr };     // Ukazatel na koren leveho podstromu
        std::atomic<node *> right { nullptr };    // Ukazatel na koren praveho podstromu
        // Pro pripomenuti: V binarnim vyhledavacim strome jsou uzly s nizsi hodnotou v levem
        // podstromu a uzly s vyssi hodnotou v pravem podstromu.

        long long data;              // Hodnota aktualniho uzlu

        // Konstruktor, ktery nastavi hodnotu aktualniho uzlu
        node(long long data) : data(data) {}
    };

    // Ukazatel na koren stromu
    std::atomic<node *> root { nullptr };

    // Destruktor stromu, ktery uvolni alokovanou pamet
    ~bst_tree();

    // Metoda pro vkladani prvku do binarniho vyhledavaciho stromu, kterou budete implementovat
    void insert(long long data);
};


#endif //PDV_HW03_BST_H
