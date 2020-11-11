#ifndef PDV_SEARCH_DOMAIN_H
#define PDV_SEARCH_DOMAIN_H

#include <vector>
#include <memory>

/**
 * Abstraktni trida reprezentujici stav problemu. Jednotlive problemy imple-
 * mentuji tuto tridu.
 *
 * POZOR! V prubehu prohledavani muze pro jeden stav problemu existovat vice
 * instanci tridy state.
 */
class state {
private:
    const unsigned int cost;
    const std::shared_ptr<const state> predecessor;

public:

    /**
     * Metoda 'next_states()' vraci seznam nasledniku aktualniho stavu problemu.
     * Nasledniky stavu si muzete predstavit jako sousedni vrcholy v prohleda-
     * vanem grafu.
     *
     * @return Seznam nasledniku aktualniho stavu jako vektor ukazatelu
     */
    virtual std::vector<std::shared_ptr<const state>> next_states() const = 0;

    /**
     * Metoda pro zjisteni, zda je aktualni stav cilovym stavem.
     *
     * POZOR! V nekterych problemech muze byt vice cilovych stavu (napr., pri
     * splnovani logicke funkce v problemu 'sat_domain' muze existovat vice
     * modelu.
     *
     * @return 'true' pokud je aktualni stav cilovym
     */
    virtual bool is_goal() const = 0;

    /**
     * Metoda pro ziskani celkove ceny cesty vedouci do aktualniho stavu.
     * Muzete predpokladat, ze cena kazde hrany je vzdy >= 1.
     *
     * @return Cena cesty vedouci do aktualniho stavu
     */
    unsigned int current_cost() const {
        return cost;
    }

    /**
     * Tuto metodu muzete pouzit pro ziskani identifikatoru aktualniho stavu.
     * Tento identifikator bude pro dany stav unikatni (bez ohledu na cestu,
     * kterou jste pro jeho dosazeni pouzili).
     *
     * POZOR! Pokud prekrocite povolene rozsahy parametrizace domeny, garanci
     * unikatnosti identifikatoru ztracite!
     *
     * @return Identifikator aktualniho stavu.
     */
    virtual unsigned long long get_identifier() const = 0;

    /**
     * V nekterych pripadech se Vam muze hodit zjistit, jakou cestou byl dany
     * stav dosazeny (napr., pro jednoduchou implementaci closed-listu). Tato
     * metoda vraci predchudce aktualniho stavu na pouzite ceste (pokud exis-
     * tuje). V opacnem pripade je pointer nastaven na 'nullptr'.
     *
     * Priklad pouziti:
     *   std::vector<std::shared_ptr<const state>> path;
     *   std::shared_ptr<const state> state = ...;
     *
     *   while(state) {
     *     path.push_back(state);
     *     state = state->get_predecessor();
     *   }
     *
     *   std::reverse(path.begin(), path.end());
     *
     *
     * @return Ukazatel na predchazejici stav na ceste pouzite pro dosazeni
     *         aktualniho stavu
     */
    std::shared_ptr<const state> get_predecessor() const {
        return predecessor;
    }

    /**
     * Metoda pro ziskani textove reprezentace aktualniho stavu. Tuto metodu
     * muzete vyuzit napriklad pri ladeni Vaseho kodu.
     *
     * @return Textova reprezentace aktualniho stavu.
     */
    virtual std::string to_string() const = 0;


    // Nasledujici metody nejsou urcene pro bezne uziti:
    state(const std::shared_ptr<const state> predecessor, unsigned int cost)
            : predecessor(predecessor), cost(cost) {}
    virtual ~state() {}
};


#endif //PDV_SEARCH_DOMAIN_H
