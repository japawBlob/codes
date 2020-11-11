#include "bfs.h"
#include <queue>
#include <unordered_set>
using namespace std;

// Naimplementujte efektivni algoritmus pro nalezeni nejkratsi cesty v grafu.
// V teto metode nemusite prilis optimalizovat pametove naroky, a vhodnym algo-
// ritmem tak muze byt napriklad pouziti prohledavani do sirky (breadth-first
// search.
//
// Metoda ma za ukol vratit ukazatel na cilovy stav, ktery je dosazitelny pomoci
// nejkratsi cesty. Pokud je nejkratsich cest vice, vratte ukazatel na stav s nej-
// nizsim identifikatorem (viz metoda 'state::get_identifier()' v 'state.h').
std::shared_ptr<const state> bfs(std::shared_ptr<const state> root) {
    /*std::vector<std::shared_ptr<const state>> blob = root->next_states();

    for(int i = 0; i<blob.size(); i++){
        printf("TUTUTUTU\n");
        printf("%s\n", blob[i]->to_string().c_str());
        printf("TATATATA\n");
    }
     */
    //BARUNKA BEGIN
    std::vector<std::shared_ptr<const state>>expand;
    std::vector<std::shared_ptr<const state>>solutions;
    std::shared_ptr<const state> retval;
    queue<std::vector<std::shared_ptr<const state>>> trii;
    queue<std::shared_ptr<const state>> previousStates;
    expand = root->next_states();
    expand.push_back(root);
    trii.push(expand);
    //previousStates.push(root);
    std::unordered_set<std::shared_ptr<const state>>visited;
    visited.insert(root);
    /*for (int i = 0; i < tree.size(); ++i) {
        expand = tree[i]->next_states();
        for (int j = 0; j < expand.size(); ++j) {
            if(expand[i]->is_goal())return expand[i];
        }
    }*/
    int kolik = 0;
    while(!trii.empty()){
        expand = trii.front();
        trii.pop();

        for (int i = 0; i <expand.size()-1; ++i) {
            if(expand[i] != NULL){
                visited.insert(expand[i]);
                std::vector<std::shared_ptr<const state>> temp;
                for (int j = 0; j < expand[i]->next_states().size(); ++j) {
                    if(expand[i]->next_states()[j] == expand[expand.size()-1]->get_predecessor()){
                        continue;
                    }
                    if(visited.count(expand[i]->next_states()[j]) >= 1){
                        continue;
                    }
                    temp.push_back(expand[i]->next_states()[j]);

                    //printf("%s\n", expand[i]->next_states()[j]->to_string().c_str());
                }
                temp.push_back(expand[i]);
                trii.push(temp);
            } else{
                continue;
            }
            if (expand[i]->is_goal()){
                solutions[i]=expand[i];
                break;
            }
            //printf("%s\n", blob[i]->to_string().c_str());
        }
        //printf("%i\n", kolik++);

    }
    //printf("sem se jeste dostanu");
    for (int j = 0; j < solutions.size(); ++j) {
        if(solutions[j]->get_identifier() < retval->get_identifier()){
            retval = solutions[j];
        }
    }
    return retval;
    //BARUNKA END


    return root;
}