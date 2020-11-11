#include "bfs.h"
#include <queue>
#include <bits/stdc++.h>
#include <iostream>
// Naimplementujte efektivni algoritmus pro nalezeni nejkratsi cesty v grafu.
// V teto metode nemusite prilis optimalizovat pametove naroky, a vhodnym algo-
// ritmem tak muze byt napriklad pouziti prohledavani do sirky (breadth-first
// search.
//
// Metoda ma za ukol vratit ukazatel na cilovy stav, ktery je dosazitelny pomoci
// nejkratsi cesty. Pokud je nejkratsich cest vice, vratte ukazatel na stav s nej-
// nizsim identifikatorem (viz metoda 'state::get_identifier()' v 'state.h').

std::shared_ptr<const state> bfs(std::shared_ptr<const state> root) {
        //nessessary Collections
        std::queue<std::shared_ptr<const state>> q;
        std::unordered_set<unsigned long long> visit;
        std::shared_ptr<const state> goal;
        //adding first inserts
        goal = nullptr;
        q.push(root);
        visit.insert(root->get_identifier());
        //going through queue
//#pragma omp parallel
        while(!q.empty())
        {
#pragma omp parallel for schedule(static)
            for (int j = 0; j < q.size(); ++j) {
                std::shared_ptr<const state> cur;

#pragma omp critical
{
                cur = q.front();
                q.pop();
};
                //is node relevant
                if((goal == nullptr or goal->current_cost() > cur->current_cost()))
                {
                //is goal
                    if(cur->is_goal())
                    {
                        printf("GOOOL\n");
                        goal = cur;
                    } else {
                    //getting all states
                        std::vector<std::shared_ptr<const state>> nexts;
                        nexts = cur->next_states();
//#pragma omp parallel for schedule (static)
                        for (int i = 0; i < nexts.size(); ++i)
                        {

                            //we were not there
                            if (visit.count(nexts[i]->get_identifier()) == 0) {
                                //CRITICAL SECTION
                                //adding node to visited and queue
                                if (goal != nullptr and nexts[i]->current_cost() > goal->current_cost()) {
#pragma omp critical{
                                    visit.insert(nexts[i]->get_identifier());
                                };
                                } else {
#pragma omp critical{
                                    q.push(nexts[i]);
                                    visit.insert(nexts[i]->get_identifier());
                            };
                                }
                            }

                        }
                    }
                }
            }
        }

    return goal;
}

