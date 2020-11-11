#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <pthread.h>
#include <unistd.h>
#define _PHASE_COUNT 6

pthread_mutex_t mutex;
pthread_cond_t cond;
 
enum place{
    NUZKY, VRTACKA, OHYBACKA, SVARECKA, LAKOVNA, SROUBOVAK, FREZA,
    _PLACE_COUNT
};
pthread_cond_t conditions[_PLACE_COUNT];

const char *place_str[_PLACE_COUNT] = {
    [NUZKY] = "nuzky",
    [VRTACKA] = "vrtacka",
    [OHYBACKA] = "ohybacka",
    [SVARECKA] = "svarecka",
    [LAKOVNA] = "lakovna",
    [SROUBOVAK] = "sroubovak",
    [FREZA] = "freza",
};

enum product {
    A, B, C,
    _PRODUCT_COUNT
};
 
const char *product_str[_PRODUCT_COUNT] = {
    [A] = "A",
    [B] = "B",
    [C] = "C",
};

struct worker_t{
   char * name;
   int type;
   bool done;
   pthread_t thread;
};

struct worker_t * workers;

int curently_working = 0;

const unsigned long wait_time[_PLACE_COUNT] = {
    [NUZKY] = 100000,
    [VRTACKA] = 200000,
    [OHYBACKA] = 150000,
    [SVARECKA] = 300000,
    [LAKOVNA] = 400000,
    [SROUBOVAK] = 250000,
    [FREZA] = 500000,
};

const int manual[_PLACE_COUNT][6][2] = {
    [NUZKY][0][0] = 1, [NUZKY][0][1] = 1,
    [NUZKY][1][0] = 0, [NUZKY][1][1] = 0,
    [NUZKY][2][0] = -1,
    [VRTACKA][0][0] = 0, [VRTACKA][0][1] = 4,
    [VRTACKA][1][0] = 1, [VRTACKA][1][1] = 3,
    [VRTACKA][2][0] = 2, [VRTACKA][2][1] = 3,
    [VRTACKA][3][0] = 0, [VRTACKA][3][1] = 1,
    [VRTACKA][4][0] = 2, [VRTACKA][4][1] = 1,
    [VRTACKA][5][0] = 1, [VRTACKA][5][1] = 0,
    [OHYBACKA][0][0] = 0, [OHYBACKA][0][1] = 2,
    [OHYBACKA][1][0] = -1,
    [SVARECKA][0][0] = 0, [SVARECKA][0][1] = 3,
    [SVARECKA][1][0] = -1,
    [LAKOVNA][0][0] = 0, [LAKOVNA][0][1] = 5,
    [LAKOVNA][1][0] = 2, [LAKOVNA][1][1] = 5,
    [LAKOVNA][2][0] = 1, [LAKOVNA][2][1] = 4,
    [LAKOVNA][3][0] = -1,
    [SROUBOVAK][0][0] = 1, [SROUBOVAK][0][1] = 5,
    [SROUBOVAK][1][0] = 2, [SROUBOVAK][1][1] = 2,
    [SROUBOVAK][2][0] = -1,
    [FREZA][0][0] = 2, [FREZA][0][1] = 4,
    [FREZA][1][0] = 1, [FREZA][1][1] = 2,
    [FREZA][2][0] = 2, [FREZA][2][1] = 0,
    [FREZA][3][0] = -1,
};
 
int find_string_in_array(const char **array, int length, char *what)
{
    for (int i = 0; i < length; i++)
	if (strcmp(array[i], what) == 0)
	    return i;
    return -1;
}

int ready_places[_PLACE_COUNT];
 
int parts[_PRODUCT_COUNT][_PHASE_COUNT];

int phases[_PRODUCT_COUNT][_PHASE_COUNT] = {
    [A][0] = 0, [A][1] = 1, [A][2] = 2, [A][3] = 3, [A][4] = 1, [A][5] = 4,
    [B][0] = 1, [B][1] = 0, [B][2] = 6, [B][3] = 1, [B][4] = 4, [B][5] = 5,
    [C][0] = 6, [C][1] = 1, [C][2] = 5, [C][3] = 1, [C][4] = 6, [C][5] = 4
};

void * worker(void* argv){

    struct worker_t * info = (struct worker_t *)argv;
    int prod;
    int phase;

    while(1){
        prod = -1;
        phase = -1;
        pthread_mutex_lock(&mutex);
        if(info->done){
            pthread_mutex_unlock(&mutex);
            return NULL;
        }
        if(ready_places[info->type] > 0){
            for(int i = 0; i < _PHASE_COUNT; i++){

                if(manual[info->type][i][0] == -1){
                    break;
                }
                else{
                    if(parts[manual[info->type][i][0]][manual[info->type][i][1]] > 0){
                        prod = manual[info->type][i][0];
                        phase = manual[info->type][i][1];
                        break;
                    }
                }
            }
            if(phase != -1 && prod != -1){
                pthread_cond_signal(&cond);
                printf("%s %s %d %s\n", info->name, place_str[info->type], phase+1, product_str[prod]);
                parts[prod][phase]--;
                ready_places[info->type]--;
                curently_working++;
                pthread_mutex_unlock(&mutex);
                usleep(wait_time[info->type]);
                pthread_mutex_lock(&mutex);
                curently_working--;
                ready_places[info->type]++;
                if(phase == 5){
                    printf("done %s\n", product_str[prod]);  
                }
                else{
                    parts[prod][phase+1]++;
                    pthread_cond_broadcast(&conditions[phases[prod][phase+1]]);
                }
                pthread_cond_signal(&cond);
            }
            else{
                printf("%s waiting \n", info->name);
                pthread_cond_wait(&conditions[info->type], &mutex);
                printf("%s stop waiting \n", info->name);

            }
        }
        else{
            printf("%s waiting \n", info->name);
            pthread_cond_wait(&conditions[info->type], &mutex);
            printf("%s stop waiting \n", info->name);
        }
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}

int main(int argc, char **argv)
{
    pthread_cond_init(&cond, NULL);
    pthread_mutex_init(&mutex, NULL);
    int workers_max = 20;
    int workers_counter = 0;
    int workers_on_places[_PLACE_COUNT];
    int places_counter[_PLACE_COUNT];
    workers = (struct worker_t*)malloc(sizeof(struct worker_t)*workers_max);

    for(int i = 0; i < _PLACE_COUNT; i++){
        pthread_cond_init(&conditions[i], NULL);
        ready_places[i] = 0;
        places_counter[i] = 0;
        workers_on_places[i] = 0;
    }
    for (int i = 0; i < _PRODUCT_COUNT; i++){
        for (int j = 0; j < _PHASE_COUNT; j++){
            parts[i][j] = 0;
        }
    } 
 
    while (1) {
        char *line, *cmd, *arg1, *arg2, *arg3, *saveptr;
        int s = scanf(" %m[^\n]", &line);
        if (s == EOF)
            break;
        if (s == 0)
            continue;
    
        cmd  = strtok_r(line, " ", &saveptr);
        arg1 = strtok_r(NULL, " ", &saveptr);
        arg2 = strtok_r(NULL, " ", &saveptr);
        arg3 = strtok_r(NULL, " ", &saveptr);
        
        if (strcmp(cmd, "start") == 0 && arg1 && arg2 && !arg3) {
            int temp;
            if(workers_counter >= workers_max){
                pthread_mutex_lock(&mutex);
                workers_max *= 2;
                workers = (struct worker_t*)realloc(workers, sizeof(struct worker_t)*workers_max);
                pthread_mutex_unlock(&mutex);
            }
            if((temp = find_string_in_array(place_str, _PLACE_COUNT, arg2)) != -1){
                workers_on_places[temp]++;
                workers[workers_counter].done = false;
                workers[workers_counter].type = temp;
                workers[workers_counter].name = strdup(arg1);
                pthread_create(&workers[workers_counter].thread, NULL, &worker, &workers[workers_counter]);
                workers_counter++;
            }

        } else if (strcmp(cmd, "make") == 0 && arg1 && !arg2) {

            int product = find_string_in_array(product_str, _PRODUCT_COUNT, arg1);
            if (product >= 0) {
                pthread_mutex_lock(&mutex);
                parts[product][0]++;
                pthread_cond_signal(&conditions[phases[product][0]]);
                pthread_mutex_unlock(&mutex);
            }

        } else if (strcmp(cmd, "end") == 0 && arg1 && !arg2) {

            for (int i = 0; i < workers_counter; i++){
                if (strcmp(workers[i].name, arg1) == 0){

                    pthread_mutex_lock(&mutex);
                    workers[i].done = true;
                    workers_on_places[workers[i].type]--;
                    pthread_cond_broadcast(&conditions[workers[i].type]);
                    pthread_mutex_unlock(&mutex);

                }
            }

        } else if (strcmp(cmd, "add") == 0 && arg1 && !arg2) {

            int place = find_string_in_array(place_str, _PLACE_COUNT, arg1);
            if (place >= 0) {

                places_counter[place]++;
                pthread_mutex_lock(&mutex);
                ready_places[place]++;
                pthread_cond_signal(&conditions[place]);
                pthread_mutex_unlock(&mutex);
            }

        } else if (strcmp(cmd, "remove") == 0 && arg1 && !arg2) {
            
            int place = find_string_in_array(place_str, _PLACE_COUNT, arg1);
            if(place != -1 && places_counter[place] > 0){
                pthread_mutex_lock(&mutex);
                ready_places[place]--;
                places_counter[place]--; 
                pthread_mutex_unlock(&mutex);   
            }
            
        } else {
            fprintf(stderr, "Invalid command: %s\n", line);
        }
        free(line);
    }

    while(true){
        int done = 0;
        int temp = 1;
        pthread_mutex_lock(&mutex);
        if(!curently_working){
            fprintf(stderr, "not working\n" );
            for(int i = 0; i < _PLACE_COUNT; i++){
                if(workers_on_places[i] && places_counter[i]){
                    fprintf(stderr, "fuck thiscondition\n" );
                    for(int j = 0; j < _PHASE_COUNT; j++){
                        fprintf(stderr, "manual break\n" );
                        if(manual[i][j][0] == -1) break;
                        else{
                            if(parts[manual[i][j][0]][manual[i][j][1]] > 0){
                                fprintf(stderr, "!working, OK, break 1\n" );
                                done = 1;
                                break;
                            }
                        }
                    }
                }
                if(done){
                    fprintf(stderr, "OK, break 2\n" );
                    break;
                }
            }
        }
        else {

            done = 1;
            temp = 0;
            pthread_cond_wait(&cond, &mutex);
        }
        if(!done){
            fprintf(stderr, "done\n" );
            pthread_mutex_unlock(&mutex);
            break;
        }
        else if(temp){
            for(int i = 0; i < _PLACE_COUNT; i++){
                pthread_cond_broadcast(&conditions[i]);
            }
            pthread_cond_wait(&cond, &mutex);
        } 
        pthread_mutex_unlock(&mutex);
    }
    pthread_mutex_lock(&mutex);
    for(int i = 0; i < workers_counter; i++){
        workers[i].done = true;
    }
    for(int i = 0; i < _PLACE_COUNT; i++){
        pthread_cond_broadcast(&conditions[i]);
    }
    pthread_mutex_unlock(&mutex);
    for(int i = 0; i < workers_counter; i++){
        pthread_join(workers[i].thread, NULL);
        free(workers[i].name);
    }
    free(workers);
    pthread_cond_destroy(&cond);
    for(int i = 0; i < _PLACE_COUNT; i++){
        pthread_cond_destroy(&conditions[i]);
    }
    pthread_mutex_destroy(&mutex);
}