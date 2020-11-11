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

    std::queue <std::shared_ptr<const state>> q;
    //std::vector <std::shared_ptr<const state>> exp;
    std::shared_ptr<const state> goal;
//    std::vector<std::shared_ptr<const state>> wtf = root->next_states();
    std::set <unsigned long long> visited;
    goal = NULL;
    int currentBest = 999999999;

    if (root->is_goal()){
       return root;
    }

    q.push(root);

    visited.insert(root->get_identifier());
    //printf("root size %i", visited.size());
   // int ooze = 0;

    while(!q.empty()) {
#pragma omp parallel for schedule(static)
        for (int i = 0; i < q.size(); ++i) {
            std::shared_ptr<const state> blob;
            bool ok = true;
           // bool gotGoal = false;
#pragma omp critical
            {
                if (q.empty()) {
                    ok = false;
                } else {
                    blob = q.front();
                    q.pop();
                }

            };
            if (!ok) {
                continue;
            }
//#pragma omp parallel for schedule(static)
            //       for (int i = 0; i < exp.size(); ++i) {
            //printf("for 1\n");
            //bool pleaseContinue = false;
            if (blob != NULL) {

                //printf("1\n");
                if (blob->current_cost() > currentBest) {
#pragma omp critical
                    {
                        visited.insert(blob->get_identifier());
                    }
                    continue;
                }
               // if (pleaseContinue) {
               //     continue;
               // }
                /*if (blob->is_goal()) {
                    //printf("added\n");

//#pragma omp critical
//                    {
//                        //printf("2\n");
//                        if (goal == nullptr) {
//                            printf("added\n");
//                            goal = exp[i];
//                            visited.insert(goal->get_identifier());
//                            printf("%s\n", exp[i]->to_string().c_str());
//                            currentBest = goal->current_cost();
//                        }
//                    }

                        if (goal == nullptr || (goal->current_cost() > blob->current_cost()) ||
                            ((goal->current_cost() == blob->current_cost()) &&
                             blob->get_identifier() < goal->get_identifier())) {
                            //printf("added\n");
                            //visited.insert(goal->get_identifier());
                            //printf("%s\n", exp[i]->to_string().c_str());

#pragma omp critical
                            {
                                goal = blob;
                                currentBest = goal->current_cost();
                                gotGoal = true;
                                ooze = 1;
                            }
                        }
                        // printf("%s\n", exp[i]->to_string().str_c);
#pragma omp critical
                    {
                        visited.insert(goal->get_identifier());
                    }
                    continue;
                    //printf("%s\n", exp[i]->to_string().c_str());
                    //goto blob;
                }*/
                //printf("3\n");
                std::vector<std::shared_ptr<const state>> tmp1;
                //std::vector<std::shared_ptr<const state>> tmp2(blob->next_states().size() + 1);
                tmp1 = blob->next_states();
                //int pos = 0;
                for (int j = 0; j < tmp1.size(); j++) {

                    //printf("for2\n");

                    if (visited.count(tmp1[j]->get_identifier()) == 0) {
                        //printf("if check\n");
                        if(tmp1[j]->is_goal()){
                            if (goal == nullptr || (goal->current_cost() > tmp1[j]->current_cost()) ||
                              ((goal->current_cost() == tmp1[j]->current_cost()) &&
                                tmp1[j]->get_identifier() < goal->get_identifier())) {
                                //printf("added\n");
                                //visited.insert(goal->get_identifier());
                                //printf("%s\n", exp[i]->to_string().c_str());

#pragma omp critical
                                {
                                    goal = tmp1[j];
                                    currentBest = goal->current_cost();
                                    //gotGoal = true;
                                    //ooze = 1;
                                }
                            }
                            // printf("%s\n", exp[i]->to_string().str_c);
#pragma omp critical
                            {
                                visited.insert(goal->get_identifier());
                            }
                            continue;
                            //printf("%s\n", exp[i]->to_string().c_str());
                            //goto blob;
                        }
                        if (tmp1[j]->current_cost() <= currentBest) {
#pragma omp critical
                            {
                                q.push(tmp1[j]);
                            }
                        }

#pragma omp critical
                        {
                            visited.insert(tmp1[j]->get_identifier());
                        }

                    }
                    //printf("add check\n");
                    //pos++;

                }
                //printf("4\n");
/*#pragma omp critical
            {
                q.push(tmp2);
            };*/

                //printf("pushed\n");
            }
            //      }
            //printf("%i\n", ooze++);
            //if(goal != NULL){
            //    break;
            //}
            //printf("%i\n", visited.size());
/*            if(gotGoal == true){
#pragma omp cancel for
            }*/
        }
        /*if(ooze == 1){
            break;
        }*/
    }

    //blob:
        //std::shared_ptr<const state> ret;
        //ret = goal;
        return goal;
}