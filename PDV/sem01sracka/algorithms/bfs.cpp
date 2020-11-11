#include "bfs.h"
#include <queue>
#include <bits/stdc++.h>
#include <iostream>

std::shared_ptr<const state> bfs(std::shared_ptr<const state> root) {
        std::queue<std::shared_ptr<const state>> q;
        std::unordered_set<unsigned long long> visit;
        std::shared_ptr<const state> goal;

        goal = nullptr;
        q.push(root);
        visit.insert(root->get_identifier());

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

                if((goal == nullptr or goal->current_cost() >= cur->current_cost()))
                {
                    if(cur->is_goal())
                    {
                        if(goal != nullptr and goal->current_cost() == cur->current_cost() and cur->get_identifier() < goal->get_identifier()){
                                goal = cur;

                        } else {
                                goal = cur;
                        }
                        //printf("GOOOL \n");

                    } else {
                        std::vector<std::shared_ptr<const state>> nexts;
                        nexts = cur->next_states();
                        for (int i = 0; i < nexts.size(); ++i)
                        {
                            if (visit.count(nexts[i]->get_identifier()) == 0) {
                                if (goal != nullptr and nexts[i]->current_cost() > goal->current_cost()) {
#pragma omp critical
                                    {
                                        visit.insert(nexts[i]->get_identifier()); };
                                } else {
#pragma omp critical
                                {
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

