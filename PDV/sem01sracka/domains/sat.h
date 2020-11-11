#include <x86intrin.h>
#include <sstream>
#include <math.h>
#include <random>
#include <algorithm>
#include "../state.h"
#include "utils.h"


template <unsigned int NUM_VARS, bool UNIFORM>
class sat_state : public state, public std::enable_shared_from_this<sat_state<NUM_VARS, UNIFORM>> {
private:
    std::vector<unsigned int> conf;
    unsigned long long id;

    const std::vector<std::vector<int>> * FORMULA;

    const unsigned int UNDEFINED_VALUE = 2;

public:
    sat_state(const std::shared_ptr<const state> predecessor, unsigned int cost, const std::vector<unsigned int> & conf,
              const std::vector<std::vector<int>> * formula) : state(predecessor, cost), conf(conf), FORMULA(formula) {
        id = 0ull;
        unsigned long long mult = 1;
        for(unsigned int var = 0 ; var < NUM_VARS ; ++var) {
            id += mult*conf[var];
            mult *= 3;
        }
    }

    sat_state(const std::vector<std::vector<int>> * formula) : state(std::shared_ptr<state>(),0), FORMULA(formula) {
        conf.resize(NUM_VARS);
        for(unsigned int i = 0 ; i < NUM_VARS ; i++) {
            conf[i] = UNDEFINED_VALUE;
        }
        id = 0ull;
        for(unsigned int var = 0 ; var < NUM_VARS ; ++var) {
            id += pow(3,var)*conf[var];
        }
    }

    ~sat_state() {}

    bool satisfiable(std::vector<unsigned int> state) const{
        // check if it is not refuted by setting
        for (int clause  = 0; clause < FORMULA->size(); clause++){
            bool refuted = true;
            for (int var = 0; var < (*FORMULA)[clause].size(); var++){
                bool value = (*FORMULA)[clause][var] >= NUM_VARS ? false : true;
                int varIdx = (*FORMULA)[clause][var] % NUM_VARS;
                if(state[varIdx] == UNDEFINED_VALUE || (state[varIdx] == 1 && value) || (!state[varIdx] && !value)){
                    refuted = false;
                    break;
                }
            }
            if(refuted) return false;
        }
        return true;
    }

    std::vector<std::shared_ptr<const state>> next_states() const override {
        auto tmp_conf = conf;
        std::vector<std::shared_ptr<const state>> succ;

        int last_defined_var = -1;
        for(int i = NUM_VARS-1; i >= 0; i--) {
            if (conf[i] != UNDEFINED_VALUE) {
                last_defined_var = i;
                break;
            }
        }

        int cost;
        for (int i = last_defined_var + 1; i < NUM_VARS; i++){

            cost  = (UNIFORM ? 1 : 1+i );

            tmp_conf[i] = 0;
            if(satisfiable(tmp_conf))
                succ.emplace_back(std::make_shared<sat_state<NUM_VARS, UNIFORM>>(this->shared_from_this(), current_cost() + cost, tmp_conf, FORMULA));

            tmp_conf[i] = 1;
            if(satisfiable(tmp_conf))
                succ.emplace_back(std::make_shared<sat_state<NUM_VARS, UNIFORM>>(this->shared_from_this(), current_cost() + cost, tmp_conf, FORMULA));

            tmp_conf[i] = UNDEFINED_VALUE;
        }
        
        std::random_shuffle(succ.begin(), succ.end());
        return succ;
    }
    bool is_goal() const override {
        for (int clause  = 0; clause < (*FORMULA).size(); clause++){
            bool satisfied = false;
            for (int var = 0; var < (*FORMULA)[clause].size(); var++){
                bool value = (*FORMULA)[clause][var] >= NUM_VARS ? false : true;
                int varIdx = (*FORMULA)[clause][var] % NUM_VARS;
                if((conf[varIdx] == 1 && value) || (!conf[varIdx] && !value)){
                    satisfied = true;
                    break;
                }
            }
            if(!satisfied) return false;
        }

        return true;
    }

    unsigned long long int get_identifier() const override {
        return id;
    }

    std::string to_string() const override {
        std::ostringstream out;
        for(unsigned int i = 0 ; i < NUM_VARS ; i++) {
            out << conf[i];
        }
        return out.str();
    }
};

template <unsigned int NUM_VARS, unsigned int NUM_CLAUSES, unsigned int MAX_CLAUSE_SIZE, unsigned int SEED, bool UNIFORM>
class sat_domain {

private:
    std::vector<std::vector<int>> * formula;


public:

    ~sat_domain(){delete formula;}


    std::shared_ptr<const state> get_root() {

        std::cout << "Domena SAT" << std::endl;
        std::cout << "Pocet promennych = " << NUM_VARS << ", pocet klauzuli = " << NUM_CLAUSES <<
                  ", maximalni velikost klauzule = " << MAX_CLAUSE_SIZE + 1 << std::endl;
        std::cout << "Uniformni ceny = " << (UNIFORM ? "ano" : "ne") << ", seed = " << SEED << std::endl;
        std::cout << "Formule = ";

        std::mt19937 rng(SEED);
        std::uniform_int_distribution<int> uni(0,2*NUM_VARS - 1);

        std::vector<int> solution;
        for (int i = 0; i < NUM_VARS; i++) {
            solution.push_back(uni(rng) % 2);
        }

        formula = new std::vector<std::vector<int>>(NUM_CLAUSES);
        for(int i = 0; i < NUM_CLAUSES; i++){
            int size = (uni(rng) % MAX_CLAUSE_SIZE) + 1;
            std::cout << "( ";
            for(int j = 0; j < size; j++) {
                int var = uni(rng);
                (*formula)[i].push_back(var);
                if (var >= NUM_VARS )
                    std::cout << "~" << (var % NUM_VARS) << " ";
                else
                    std::cout << var << " ";
            }
            int satisfyingIdx = uni(rng) % NUM_VARS;
            (*formula)[i].push_back(satisfyingIdx + solution[satisfyingIdx]*NUM_VARS);
            if (solution[satisfyingIdx])
                std::cout << "~" << satisfyingIdx ;
            else
                std::cout << satisfyingIdx + solution[satisfyingIdx]*NUM_VARS ;
            std::cout << " )";
            if (i != NUM_CLAUSES - 1) std::cout << " & ";
        }
        std::cout << std::endl << std::endl;

        return std::make_shared<sat_state<NUM_VARS, UNIFORM>>(formula);
    }

};
