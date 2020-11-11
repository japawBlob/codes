#include "bfs.h"
#include "../state.h"
#include <iostream>
#include <queue>
#include <set>

std::shared_ptr<const state> bfs(std::shared_ptr<const state> root) {

    std::queue <std::vector<std::shared_ptr<const state>>> q;
    std::vector <std::shared_ptr<const state>> exp;
    std::shared_ptr<const state> goal;
    std::set <unsigned long long int> visited;

    q.push(root->next_states());
    visited.insert(root->get_identifier());

    while(!q.empty()){
        exp = q.front();
        q.pop();

//#pragma omp parallel for
        for (int i = 0; i <exp.size(); ++i) {
            if(exp[i] != NULL){
                if (exp[i]->is_goal()) {

                    if(goal == nullptr){
                        goal = exp[i];
                    }
                    if(goal->current_cost() > exp[i]->current_cost()) {
                        goal = exp[i];

                    }
                }
                std::vector<std::shared_ptr<const state>> tmp1;
                std::vector<std::shared_ptr<const state>> tmp2(exp.size()+1);
                tmp1 = exp[i]->next_states();
                int pos = 0;
                for(int l = 0; l < tmp1.size(); l++){
                    if(visited.count(tmp1[l]->get_identifier()) == 0){
                        if(goal != nullptr){
                            if(tmp1[l]->current_cost() < goal->current_cost()){
                                tmp2[pos] = tmp1[l];
                                visited.insert(tmp1[l]->get_identifier());
                                pos++;
                            }
                        } else {
                            tmp2[pos] = tmp1[l];
                            visited.insert(tmp1[l]->get_identifier());
                            pos++;
                        }

                    }
                }
                q.push(tmp2);
            }
        }
    }
    return goal;
}