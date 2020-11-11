#include <x86intrin.h>
#include <sstream>
#include <math.h>
#include <random>
#include <iostream>
#include <algorithm>
#include "../state.h"
#include "utils.h"


template <unsigned int SIZE, bool UNIFORM>
class maze_state : public state, public std::enable_shared_from_this<maze_state<SIZE, UNIFORM>> {
private:
    std::vector<unsigned int> conf;
    unsigned long long id;

    const std::vector<bool> * MAZE;
    const std::vector<unsigned int> * GOAL;

public:
    maze_state(const std::shared_ptr<const state> predecessor, unsigned int cost, std::vector<unsigned int> conf,
               const std::vector<bool> * maze, const std::vector<unsigned int> * goal)
            : state(predecessor, cost), conf(conf), MAZE(maze), GOAL(goal){
        id = conf[0]*SIZE + conf[1];
    }

    ~maze_state() {}


    std::vector<std::shared_ptr<const state>> next_states() const override {
        auto tmp_conf = conf;
        std::vector<std::shared_ptr<const state>> succ;

        unsigned int cost = UNIFORM ? 1 : (id % 5);
        if (!((*MAZE)[ (conf[0] - 1)*SIZE + conf[1]])){
            tmp_conf[0] = conf[0] - 1;
            succ.emplace_back(std::make_shared<maze_state<SIZE, UNIFORM>>(this->shared_from_this(), current_cost() + cost, tmp_conf, MAZE, GOAL));
            tmp_conf[0] = conf[0];
        }

        if (!((*MAZE)[ (conf[0] + 1)*SIZE + conf[1]])){
            tmp_conf[0] = conf[0] + 1;
            succ.emplace_back(std::make_shared<maze_state<SIZE, UNIFORM>>(this->shared_from_this(), current_cost() + cost, tmp_conf, MAZE, GOAL));
            tmp_conf[0] = conf[0];
        }

        if (!((*MAZE)[ (conf[0])*SIZE + conf[1] - 1])){
            tmp_conf[1] = conf[1] - 1;
            succ.emplace_back(std::make_shared<maze_state<SIZE, UNIFORM>>(this->shared_from_this(), current_cost() + cost, tmp_conf, MAZE, GOAL));
            tmp_conf[1] = conf[1];
        }

        if (!((*MAZE)[ (conf[0])*SIZE + conf[1] + 1])){
            tmp_conf[1] = conf[1] + 1;
            succ.emplace_back(std::make_shared<maze_state<SIZE, UNIFORM>>(this->shared_from_this(), current_cost() + cost, tmp_conf, MAZE, GOAL));
        }
        
        std::random_shuffle(succ.begin(), succ.end());
        return succ;
    }

    bool is_goal() const override {
        return conf[0] == (*GOAL)[0] && conf[1] == (*GOAL)[1];
    }

    unsigned long long int get_identifier() const override {
        return id;
    }

    std::string to_string() const override {
        std::ostringstream out;
        out << "[ " << conf[0] << ", " << conf[1] << " ]";
        return out.str();
    }
};

template <unsigned int WIDTH, unsigned int HEIGHT, unsigned int SEED, bool UNIFORM>
class maze_domain {

    const float COMPLEXITY = 0.75;
    const float DENSITY = 0.75;


public:

    ~maze_domain(){delete maze; delete goal;}

    std::shared_ptr<const state> get_root() {

        std::cout << "Domena Bludiste" << std::endl;
        std::cout << "Sirka plochy = " << WIDTH << ", vyska plochy = " << HEIGHT << ", uniformni ceny = " << (UNIFORM ? "ano" : "ne") << ", seed = " << SEED << std::endl;
        std::cout << "Plocha = " << std::endl;

        loc_seed = SEED;

        std::vector<unsigned int> rootState(2);
        rootState[0] = 1; rootState[1] = 1;

        goal = new std::vector<unsigned int> (2);
        (*goal)[0] = HEIGHT - 2; (*goal)[1] = WIDTH - 2;

        generate_maze();

        for(int i = 0; i < 10; i++){
            if ( (*maze)[rootState[0]*WIDTH + rootState[1]] || (*maze)[(*goal)[0]*WIDTH + (*goal)[1]] ){
                std::cout << "Spatne vygenerovane bludiste #" << i << ". Generuji znovu ... ";
                loc_seed++; (*goal)[0] --; (*goal)[1] --;
                generate_maze();
                std::cout << "hotovo." << std::endl;
            }
            else break;
        }

        if ( (*maze)[rootState[0]*WIDTH + rootState[1]] || (*maze)[(*goal)[0]*WIDTH + (*goal)[1]] ){
            std::cout << "Vsechny pokusy vygenerovat validni bludiste selhaly. Zkuste pouzit LICHE rozmery." << std::endl;
            exit(1);
        }

        for(int i = 0; i < HEIGHT; i++){
            for(int j = 0; j < WIDTH; j++){
                if (i == rootState[0] && j == rootState[1]){
                    std::cout << "S"; continue;
                }
                if (i == (*goal)[0] && j == (*goal)[1]){
                    std::cout << "G"; continue;
                }
                std::cout << ((*maze)[i*WIDTH + j] ? "X" : " ") ;
            }
            std::cout << std::endl;
        }

        std::cout << std::endl;

        return std::make_shared<maze_state<WIDTH, UNIFORM>>(std::shared_ptr<state>(), 0, rootState, maze, goal);
    }

private:

    std::vector<bool> * maze;
    std::vector<unsigned int> * goal;

    unsigned int loc_seed;

    void generate_maze(){

        std::mt19937 rng(loc_seed);

        int shape[2] = {(int)(WIDTH / 2) * 2 + 1, (int)(HEIGHT / 2) * 2 + 1};
        // Adjust complexity and density relative to maze size
        int complexity = (int)(COMPLEXITY * (5 * (shape[0] + shape[1])));
        int density    = (int)(DENSITY * ((int)(shape[0] / 2) * (shape[1] / 2)));
        // Build actual maze
        maze = new std::vector<bool>(WIDTH * HEIGHT);
        // Fill borders
        for(int i = 0; i < WIDTH; i++) {
            (*maze)[i] = true;
            (*maze)[WIDTH*(HEIGHT-1) + i] = true;
        }
        for(int j = 0; j < HEIGHT; j++){
            (*maze)[j*WIDTH] = true;
            (*maze)[j*WIDTH + WIDTH - 1] = true;
        }

        // Make aisles
        std::uniform_int_distribution<int> uniX(0,(int)(shape[1] / 2 ));
        std::uniform_int_distribution<int> uniY(0,(int)(shape[0] / 2 ));
        for(int i = 0; i <  density; i++) {
            int x = 2 * uniX(rng);
            int y = 2 * uniY(rng);
            (*maze)[x * WIDTH + y] = true;
            for (int j = 0; j < complexity; j++) {
                std::vector<unsigned int> neighbours;
                if (x > 1) {
                    neighbours.push_back(y);
                    neighbours.push_back(x - 2);
                }
                if (x < shape[1] - 2) {
                    neighbours.push_back(y);
                    neighbours.push_back(x + 2);
                }
                if (y > 1) {
                    neighbours.push_back(y - 2);
                    neighbours.push_back(x);
                }
                if (y < shape[0] - 2) {
                    neighbours.push_back(y + 2);
                    neighbours.push_back(x);
                }
                if (neighbours.size()) {
                    std::uniform_int_distribution<int> uni(0, (int) (neighbours.size() / 2) - 1);
                    int ridx = uni(rng);
                    int y_ = neighbours[2 * ridx];
                    int x_ = neighbours[2 * ridx + 1];
                    if (!(*maze)[x_ * WIDTH + y_]) {
                        (*maze)[x_ * WIDTH + y_] = true;
                        (*maze)[(x_ + (int) ((x - x_) / 2)) * WIDTH + y_ + (int) ((y - y_) / 2)] = true;
                        x = x_;
                        y = y_;
                    }
                }
            }
        }
    }

};
