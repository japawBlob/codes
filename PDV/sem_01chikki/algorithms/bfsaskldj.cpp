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
    //std::vector <std::shared_ptr<const state>> exp;
    std::shared_ptr<const state> goal;
    std::vector<std::shared_ptr<const state>> wtf = root->next_states();
    std::set <unsigned long long> visited;
    goal = NULL;
    int currentBest = 999999999;


    q.push(wtf);
    visited.insert(root->get_identifier());
    //printf("root size %i", visited.size());
    int ooze = 0;
#pragma omp parallel
    while(!q.empty()) {
        std::vector <std::shared_ptr<const state>> exp;
        bool ok = true;
#pragma omp critical
        {
            if (q.empty()){
                ok = false;
            } else {
                exp = q.front();
                q.pop();
            }

        };
        if(!ok){
            continue;
        }
//#pragma omp parallel for schedule(static)
        for (int i = 0; i < exp.size(); ++i) {
           //printf("for 1\n");
           bool pleaseContinue = false;
            if (exp[i] != NULL) {

                    //printf("1\n");
                    if (exp[i]->current_cost() > currentBest) {
#pragma omp critical
                        {
                            visited.insert(exp[i]->get_identifier());
                        }
                        pleaseContinue = true;
                    }
                if(pleaseContinue){
                    continue;
                }
                if (exp[i]->is_goal()) {
                    //printf("added\n");

/*#pragma omp critical
                    {
                        //printf("2\n");
                        if (goal == nullptr) {
                            printf("added\n");
                            goal = exp[i];
                            visited.insert(goal->get_identifier());
                            printf("%s\n", exp[i]->to_string().c_str());
                            currentBest = goal->current_cost();
                        }
                    }*/
#pragma omp critical
                    {
                        if (goal == nullptr || (goal->current_cost() > exp[i]->current_cost()) ||
                           ((goal->current_cost() == exp[i]->current_cost()) &&
                           exp[i]->get_identifier() < goal->get_identifier())) {
                            //printf("added\n");
                            goal = exp[i];
                            visited.insert(goal->get_identifier());
                            //printf("%s\n", exp[i]->to_string().c_str());
                            currentBest = goal->current_cost();
                        }
                        // printf("%s\n", exp[i]->to_string().str_c);
                    }
                    continue;
                    //printf("%s\n", exp[i]->to_string().c_str());
                    //goto blob;
                }
                //printf("3\n");
                std::vector<std::shared_ptr<const state>> tmp1;
                std::vector<std::shared_ptr<const state>> tmp2(exp.size() + 1);
                tmp1 = exp[i]->next_states();
                int pos = 0;
                for (int l = 0; l < tmp1.size(); l++) {
                    //printf("for2\n");
#pragma omp critical
                    {
                    if (visited.count(tmp1[l]->get_identifier()) == 0) {
                        //printf("if check\n");
                        tmp2[pos] = tmp1[l];

                        visited.insert(tmp1[l]->get_identifier());
                    }
                        //printf("add check\n");
                        pos++;
                    }
                }
                //printf("4\n");
#pragma omp critical
            {
                q.push(tmp2);
            };

                //printf("pushed\n");
            }
        }
        //printf("%i\n", ooze++);
        //if(goal != NULL){
        //    break;
        //}
        //printf("%i\n", visited.size());
    }

    //blob:
        std::shared_ptr<const state> ret;
        ret = goal;
        return ret;
}