#include <iostream>
#include <memory>
#include <random>
#include <chrono>
#include <algorithm>

#include "state.h"
#include "domains/hanoi.h"
#include "domains/sat.h"
#include "domains/slidingPuzzle.h"
#include "domains/maze.h"

#include "algorithms/bfs.h"
#include "algorithms/iddfs.h"


// Vsechny funkce, ktere budete implementovat by mely implementovat nasledujici rozhrani.
// Mely by to tedy byt funkce s nasledujici hlavickou:
//   std::shared_ptr<const state> jmeno_funkce(std::shared_ptr<const state> root)
//
// Funkce dostane na vstupu ukazatel na pocatecni stav problemu (zdrojovy vrchol prohledavani,
// a mely by vratit ukazatel na cilovy stav, ktery je dosazitelny pomoci nejkratsi/nejlevnejsi
// cesty. Pokud je nejkratsich/nejlevnejsich cest vice, vracejte ukazatel na cilovy stav, ktery
// ma nejnizsi identifikator (viz metoda 'state::get_identifier()' v 'state.h')
//
// Vsimnete si, ze ukazatele jsou typu 'std::shared_ptr' - coz Vam doufame usnadni hodne prace
// pri sprave pameti:
//   1) Na rozdil od 'const state *', 'std::shared_ptr<const state>' se stara o spravu pameti
//      automaticky (alokovana pamet pro stav zanikne automaticky po tom, co zanikne posledni
//      std::shared_ptr, ktery na ni ukazuje.
//   2) Na rozdil od 'std::unique_ptr<const state>' vlastnictvi ukazatele neni unikatni. To
//      znamena, ze pointer muzete predavat do ostatnich funkci/datovych struktur bez omezeni.
// Cenou za to je mirne zvysena rezie pri pristupech do pameti pres 'std::shared_ptr<...>'.
typedef std::shared_ptr<const state> (*searchfn_t)(std::shared_ptr<const state>);


// Evaluacni funkce, ktera spusti prohledavaci algoritmus 'search' z pocatecniho stavu 'root'.
void evaluate(std::shared_ptr<const state> &root, searchfn_t search) {
    using namespace std::chrono;

    std::cout << " **** " << std::endl;
    auto begin = steady_clock::now();
    auto result = search(root);
    auto end = steady_clock::now();

    if (result != nullptr) {
        if(result->is_goal()) {
            std::cout << "Solution with identifier " << result->get_identifier() << " found. Cost=" << result->current_cost() << std::endl;
        } else {
            std::cout << "Search returned a solution - but it is not a goal!" << std::endl;
        }
    } else {
        std::cout << "No solution found." << std::endl;
    }

    std::cout << "Time: " << duration_cast<milliseconds>(end - begin).count() << "ms" << std::endl;

    // Pro snazsi ladeni zrekonstruujeme a vypiseme nalezenou cestu
    std::vector<std::shared_ptr<const state>> path;
    while (result) {
        path.push_back(result);
        result = result->get_predecessor();
    }
    std::reverse(path.begin(), path.end());
    for (auto s : path) {
        std::cout << s->to_string() << std::endl;
    }

    std::cout << " **** " << std::endl;
}


int main() {

    // Vytvoreni instance hanojskych vezi s 3 koliky, 1 vezi (umistenou na
    // prvnim koliku a 4 kotouci ve vezi.
    auto d = hanoi_domain<3,1,4>();

    // Vytvorit domenu "splnovani booleovskych funkci" muzete vytvorit na-
    // sledovne:
    //   auto d = sat_domain<30,7,3,1,true>();
    // Tato domena pak ma:
    //   - 30 booleovskych promennych
    //   - 7 termu (ktere jsou spojeny disjunkci)
    //   - kazdy term obsahuje maximalne 3 literaly
    //   - seed nahodneho generatoru je 1
    //   - cena za prirazeni hodnoty jednomu literalu je uniformni (1)
    //     (v pripade 'false' je cena za prirazeni hodnoty i-te promenne i)


    // Vytvorit domenu sliding-puzzle hranou na hraci plose 4x4 (15-puzzle)
    // muzete takto:
    //   auto d = sp_domain<4, 70, 0>();
    // Inicialni pozice je generovana provedenim 70 nahodnych tahu (nahodny
    // generator je inicializovany seedem 0).

    // Posledni domenou jsou bludiste. Bludiste o rozmerech 31x21 muzete
    // vytvorit pomoci:
    //   auto d = maze_domain<31, 21, 0, false>();
    // Bludiste je generovano nahodne za pouziti seedu 0. V pripade, ze
    // nastavite posledni parametr na 'true', cena za jeden pohyb v bludisti
    // nebude uniformni.
    //
    // POZOR! Rozmery bludiste musi byt licha cisla!

    auto root = d.get_root();

    evaluate(root, bfs);
    evaluate(root, iddfs);

    return 0;
}
