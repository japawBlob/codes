#include <x86intrin.h>
#include <sstream>
#include <math.h>
#include <random>
#include <algorithm>
#include "../state.h"
#include "utils.h"


template <unsigned int SIZE>
class sp_state : public state, public std::enable_shared_from_this<sp_state<SIZE>> {
private:
    std::vector<unsigned int> conf;
    unsigned long long id;

    const unsigned int BLANK = SIZE*SIZE - 1;

public:
    sp_state(const std::shared_ptr<const state> predecessor, unsigned int cost, std::vector<unsigned int> conf)
            : state(predecessor, cost), conf(conf){
        id = 0ull;
    	unsigned long long mult = 1;
        for(unsigned int i = 0 ; i < SIZE; i++) {
            for(unsigned int j = 0 ; j < SIZE; j++) {
                id += mult * conf[i*SIZE + j];
                mult *= BLANK+1;
            }
        }
    }


    ~sp_state() {}


    std::vector<std::shared_ptr<const state>> next_states() const override {
        auto tmp_conf = conf;
        std::vector<std::shared_ptr<const state>> succ;

        int blank_x = 0;
        int blank_y = 0;

        // find blank
        for (int i = 0; i < SIZE; i++){
            for(int k = 0; k < SIZE; k++){
                if(conf[i*SIZE + k] == BLANK){
                    blank_x = i;
                    blank_y = k;
                }
            }
        }

        // 4 possibilities
        if (blank_x - 1 >= 0){
            tmp_conf[blank_x *SIZE + blank_y] = conf[(blank_x - 1) *SIZE + blank_y];
            tmp_conf[(blank_x - 1) *SIZE + blank_y] = BLANK;
            succ.emplace_back(std::make_shared<sp_state<SIZE>>(this->shared_from_this(), current_cost() + 1, tmp_conf));
            tmp_conf[blank_x *SIZE + blank_y] = conf[blank_x *SIZE + blank_y];
            tmp_conf[(blank_x - 1) *SIZE + blank_y] = conf[(blank_x - 1) *SIZE + blank_y];
        }

        if (blank_x + 1 < SIZE){
            tmp_conf[blank_x *SIZE + blank_y] = conf[(blank_x + 1) *SIZE + blank_y];
            tmp_conf[(blank_x + 1) *SIZE + blank_y] = BLANK;
            succ.emplace_back(std::make_shared<sp_state<SIZE>>(this->shared_from_this(), current_cost() + 1, tmp_conf));
            tmp_conf[blank_x *SIZE + blank_y] = conf[blank_x *SIZE + blank_y];
            tmp_conf[(blank_x + 1) *SIZE + blank_y] = conf[(blank_x + 1) *SIZE + blank_y];
        }

        if (blank_y - 1 >= 0){
            tmp_conf[blank_x *SIZE + blank_y] = conf[blank_x *SIZE + blank_y - 1];
            tmp_conf[blank_x *SIZE + blank_y - 1] = BLANK;
            succ.emplace_back(std::make_shared<sp_state<SIZE>>(this->shared_from_this(), current_cost() + 1, tmp_conf));
            tmp_conf[blank_x *SIZE + blank_y] = conf[blank_x *SIZE + blank_y];
            tmp_conf[blank_x *SIZE + blank_y - 1] = conf[blank_x *SIZE + blank_y - 1];
        }

        if (blank_y + 1 < SIZE){
            tmp_conf[blank_x *SIZE + blank_y] = conf[blank_x *SIZE + blank_y + 1];
            tmp_conf[blank_x *SIZE + blank_y + 1] = BLANK;
            succ.emplace_back(std::make_shared<sp_state<SIZE>>(this->shared_from_this(), current_cost() + 1, tmp_conf));
        }
        
        std::random_shuffle(succ.begin(), succ.end());
        return succ;
    }

    bool is_goal() const override {
        for (int i = 0; i < SIZE; i++){
            for(int k = 0; k < SIZE; k++){
                if(i == SIZE - 1 && k == SIZE - 1) return true;
                if (conf[i *SIZE + k] != i*SIZE + k)
                    return false;
            }
        }
        return false;
    }

    unsigned long long int get_identifier() const override {
        return id;
    }

    std::string to_string() const override {
        std::ostringstream out;
        out << "[ ";
        for(unsigned int i = 0 ; i < SIZE; i++) {
            for(unsigned int j = 0 ; j < SIZE; j++) {
                out << conf[i *SIZE + j] << " ";
            }
            if (i != SIZE - 1) out << "| ";
            else out << "]";
        }
        return out.str();
    }

    std::vector<unsigned int> get_conf() const {
        return conf;
    }
};

template <unsigned int SIZE, unsigned int SOLUTION_DEPTH, unsigned int SEED>
class sp_domain {

public:

    std::shared_ptr<const state> get_root() {

        std::cout << "Domena Loyduv hlavolam" << std::endl;
        std::cout << "Sirka desky = " << SIZE << ", seed = " << SEED << std::endl;
        std::cout << "Pocatecni deska = ";

        std::vector<unsigned int> rootState(SIZE*SIZE);
        for (int i = 0; i < SIZE; i++) {
            for (int k = 0; k < SIZE; k++) {
                rootState[i * SIZE + k] = i * SIZE + k;
            }
        }

        std::mt19937 rng(SEED);
        std::uniform_int_distribution<int> uni(0,3);
        std::shared_ptr<const state> s = std::make_shared<sp_state<SIZE>>(std::shared_ptr<state>(), 0, rootState);
        for (int i = 0; i < SOLUTION_DEPTH; i++){
            std::vector<std::shared_ptr<const state>> succ = s->next_states();
            s = succ[uni(rng) % succ.size()];
        }

        auto ss = std::static_pointer_cast<const sp_state<SIZE>>(s);

        std::cout << ss->to_string() << std::endl << std::endl;

        return std::make_shared<const sp_state<SIZE>>(std::shared_ptr<const state>(), 0, ss->get_conf());
    }

};
