#ifndef LOCKFREE_H
#define LOCKFREE_H

#include <vector>
#include <iostream>
#include <atomic>

class Lockfree {
public:
    class Node {
    public:
        unsigned long long value;
        std::atomic<Node*> next { nullptr };

        Node(unsigned long long value) : value(value) {}
    };

    Node * head = new Node(-999999999999L);

    void insert(unsigned long long value) {
        Node * node = new Node(value);

        Node * current = head;         // Ukazatel na aktualni zpracovavany uzel
        while(true) {
            Node * next = current->next;   // a jeho naslednika

            Node * current =  head;

            while(true){
                Node * next = current->next;

                if(next == nullptr || next->value > value){
                    node->next = next;
                    if(current->next.compare_exchange_strong(next, node)) break;
                } else {
                    current = current->next;
                }
            }
            // Doplnte kod pro vlozeni uzlu 'node' na spravnou pozici ve spojovem seznamu
            // Muzete vyjit z Vasi implementace v 'lockBased.h' a pouze nahradit cast
            // zamknuti mutexu, validace stavu a provedeni vlozeni pomoci atomicke operace
            // compare-and-swap (current->next.compare_exchange_strong(...)).

            break;
        }
    }

    // Pokud byste si chteli vyzkouset slozitejsi operaci se spojovym seznamem, muzete
    // si zkusit naimplementovat metodu pro odebrani prvku ze seznamu. Vzpomente si,
    // ze na prednasce jsme si rikali, ze mazani prvku probiha dvoufazove.
    //   1) Nejprve prvek oznacim za smazany. Tim zabranim ostatnim vlaknu vkladat za
    //      nej nove prvky.
    //   2) Pote ho vypojim ze seznamu
    //
    // Oznaceni prvku za smazany muzete provest pomoci atomickych operaci tak, ze ukazatel
    // na naslednika oznacite bitovym priznakem (schematicky napr., current->next | 1ULL).
    //
    // Pro jednoduchost nemusite resit dealokaci pameti po odebrani prvku.
    bool remove(unsigned long long value) {
        return false;
    }
};

#endif