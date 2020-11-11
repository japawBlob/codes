#include "bfs.h"
#include "../state.h"
#include <iostream>
#include <queue>
#include <set>

// Naimplementujte efektivni algoritmus pro nalezeni nejkratsi cesty v grafu.
// V teto metode nemusite prilis optimalizovat pametove naroky, a vhodnym algo-
// ritmem tak muze byt napriklad pouziti prohledavani do sirky (breadth-first
// search.
//
// Metoda ma za ukol vratit ukazatel na cilovy stav, ktery je dosazitelny pomoci
// nejkratsi cesty. Pokud je nejkratsich cest vice, vratte ukazatel na stav s nej-
// nizsim identifikatorem (viz metoda 'state::get_identifier()' v 'state.h').
std::shared_ptr<const state> bfs(std::shared_ptr<const state> root) {

    std::queue <std::vector<std::shared_ptr<const state>>> q;
    std::vector <std::shared_ptr<const state>> exp;
    std::vector <std::shared_ptr<const state>> goal(10);
    std::vector<std::shared_ptr<const state>> wtf = root->next_states();
    std::set <unsigned long long> visited;
/*    int count = 0;*/

    q.push(wtf);
    visited.insert(root);
    //printf("Visited Size %lu\n", visited.size());

    while(!q.empty()){
        exp = q.front();
        q.pop();

        for (int i = 0; i <exp.size(); ++i) {
            //printf("for 1\n");

            if(exp[i] != NULL){
                if (exp[i]->is_goal()) {
                    if(goal[0] == nullptr){
                        printf("added\n");
                        goal[0] = exp[i];

                    }
                    if(goal[0]->current_cost() == 0 || goal[0]->current_cost() > exp[i]->current_cost()){
                        printf("added\n");
                        goal[0] = exp[i];

                    }

                    printf("%s val = %i\n", exp[i]->to_string().c_str(), exp[i]->current_cost());
                    printf("Visited Size %lu\n", visited.size());
                    //goto blob;
                }
                std::vector<std::shared_ptr<const state>> tmp1;
                std::vector<std::shared_ptr<const state>> tmp2(exp.size()+1);
                tmp1 = exp[i]->next_states();
                int pos = 0;
                for(int l = 0; l < tmp1.size(); l++){
                    //printf("for2\n");
                    if(visited.count(tmp1[l]) == 0){
                        //printf("if check\n");
                        tmp2[pos] = tmp1[l];
                        visited.insert(tmp1[l]);
                        //printf("add check\n");
                        printf("%s val = %i\n", exp[i]->to_string().c_str(), exp[i]->current_cost());
                        printf("%p\n", (void*)tmp1[l].get());
                        pos++;
                    }
                }
                q.push(tmp2);
                //printf("pushed\n");
            }
        }
    }

    //blob:
        std::shared_ptr<const state> ret;
        /*for (int j = 0; j < goal.size(); ++j) {
            if (goal[j]->get_identifier() < ret->get_identifier()) {
                ret = goal[j];
            }
        }*/
        ret = goal[0];
    return ret;
}