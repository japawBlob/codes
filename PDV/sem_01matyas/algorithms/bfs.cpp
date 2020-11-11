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
    std::shared_ptr<const state> goal;
    std::set <unsigned long long> visited;

    goal = NULL;

    int currentBest = 999999999;

    if (root->is_goal()){return root;}

    q.push(root);
    visited.insert(root->get_identifier());

    while(!q.empty()) {
#pragma omp parallel for schedule(static)
        for (int i = 0; i < q.size(); ++i) {
            std::shared_ptr<const state> blob;
            bool ok = true;
#pragma omp critical
            {
                if (q.empty()) {
                    ok = false;
                } else {
                    blob = q.front();
                    q.pop();
                }
            };
            if (!ok) {continue;}

            if (blob != NULL) {
                if (blob->current_cost() > currentBest) {
#pragma omp critical
                    {
                        visited.insert(blob->get_identifier());
                    }
                    continue;
                }
                std::vector<std::shared_ptr<const state>> neighbours;
                neighbours = blob->next_states();
                for (int j = 0; j < neighbours.size(); j++) {
                    if (visited.count(neighbours[j]->get_identifier()) == 0) {
                        if(neighbours[j]->is_goal()){

                            if (goal == nullptr || (currentBest > neighbours[j]->current_cost()) ||
                                ((currentBest == neighbours[j]->current_cost()) &&
                                 neighbours[j]->get_identifier() < goal->get_identifier())) {
#pragma omp critical
                                {
                                    goal = neighbours[j];
                                    currentBest = goal->current_cost();
                                }
                            }
#pragma omp critical
                            {
                                visited.insert(goal->get_identifier());
                            }
                            continue;
                        }
                        if (neighbours[j]->current_cost() < currentBest) {
#pragma omp critical
                            {
                                q.push(neighbours[j]);
                            }
                        }
#pragma omp critical
                        {
                            visited.insert(neighbours[j]->get_identifier());
                        }
                    }
                }
            }
        }
    }
        return goal;
}