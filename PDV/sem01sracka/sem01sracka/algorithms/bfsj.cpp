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
    //creating return
    std::shared_ptr<const state> ret;
    ret = root;

    //controlling if we start in goal
    if(!ret->is_goal())
    {
        //nessessary Collections
        std::queue<std::shared_ptr<const state>> q;
        std::unordered_set<unsigned long long> visit;
        std::shared_ptr<const state> goal;
        //adding first inserts
        q.push(root);
        visit.insert(root->get_identifier());
        //going through queue
        while(!q.empty())
        {

            std::shared_ptr<const state> cur;
            //CRITICAL SECTION
            cur = q.front();
            q.pop();
            //is node relevant
            printf("We\n");
            if(goal == nullptr or goal->current_cost() > cur->current_cost() or goal->current_cost() == cur->current_cost())
            {
                //is goal
                if(cur->is_goal())
                {
                    if(goal->current_cost() == cur->current_cost() and goal->get_identifier() > cur->get_identifier()){
                        goal = cur;
                    }
                    printf("We are here\n");
                    goal = cur;
                }
                //is not
                else
                {
                    //getting all states
                    std::vector<std::shared_ptr<const state>> nexts;
                    if(cur != nullptr){
                        nexts = cur->next_states();

                    } else {
                        continue;
                    }

                    printf("are \n");
                    for (int i = 0; i < nexts.size(); ++i)
                    {

                        //we were not there
                        if (visit.count(nexts[i]->get_identifier()) == 0)
                        {
                            //CRITICAL SECTION
                            //adding node to visited and queue
                            printf("here\n");
                            q.push(nexts[i]);
                            printf("Wor here\n");
                            visit.insert(nexts[i]->get_identifier());
                            printf("maybe here\n");
                        }
                    }
                }
            }
        }
        //finalizing
        if(goal != nullptr)
        {
            ret = goal;

        }
    }
    return ret;
}

