#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// You can use these functions and data structures to transform strings to numbers and used them in arrays
typedef struct worker {
  int x;
  char* text;
  int myWorkHasEnded;
  int currentlyWorking;
} worker_t;

pthread_mutex_t mutex;
pthread_cond_t cond;
pthread_cond_t conds[_PLACE_COUNT];

enum place {
  NUZKY, VRTACKA, OHYBACKA, SVARECKA, LAKOVNA, SROUBOVAK, FREZA,
  _PLACE_COUNT
};


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

const int makeA[_PHASE_COUNT] = { NUZKY, VRTACKA, OHYBACKA, SVARECKA, VRTACKA, LAKOVNA};
const int makeB[_PHASE_COUNT] = { VRTACKA, NUZKY, FREZA, VRTACKA, LAKOVNA, SROUBOVAK};
const int makeC[_PHASE_COUNT] = { FREZA, VRTACKA, SROUBOVAK, VRTACKA, FREZA, LAKOVNA};

int find_string_in_array(const char **array, int length, char *what) {
   for (int i = 0; i < length; i++)
      if (strcmp(array[i], what) == 0)
         return i;
   return -1;
}

void* work(void* temp);
void getToWork(int type);


/* It is not necessary to represent each working place with a dynamically allocated object.
 * You can store only number of ready places
 * 
 */

/* It is not necessary to represent each part as a dynamically allocated object.
 * you can have only number of parts for each working phase
 */
int ready_places[_PLACE_COUNT];
#define _PHASE_COUNT 6
int parts[_PRODUCT_COUNT][_PHASE_COUNT]
 

int main(int argc, char **argv) {
    /* init your internal structures, mutexes and conddition variables */

    int numberOfWorkers = 0;
    worker_t **workers;
    workers* = workers = malloc(sizeof(worker_t) * 25);
    pthread_t *workThreads;
    workThreads = malloc(sizeof(pthread_t) * 25);
    pthread_mutex_init(&mutex, NULL);
    pthread_cond_init(&cond, NULL);

    char *line, *cmd, *arg1, *arg2, ch;
    while (1) {
        int s = scanf(" %m[^\n]", &line), s2;
        if (s == 1) {
            if (strncmp(line, "start", 5) == 0) {
                s2 = sscanf(line, "%m[a-zA-Z] %m[a-zA-Z] %m[a-zA-Z]%c", &cmd, &arg1, &arg2, &ch);
                if ((s2 == 3) && (0 == strcmp(cmd, "start"))) {
                    workers[numberOfWorkers]->x = find_string_in_array(place_str, _PLACE_COUNT, arg2);
                    workers[numberOfWorkers]->text = strdup(arg1);
                    workers[numberOfWorkers]->myWorkHasEnded = 0;

                    pthread_create(&workThreads[numberOfWorkers], NULL, work, &workers[numberOfWorkers]);
                    numberOfWorkers++;
                }
                if (s2 >= 3) {
                    free(arg2);
                }
            } else {
                s2 = sscanf(line, "%m[a-zA-Z] %m[a-zA-Z]%c", &cmd, &arg1, &ch);
                if ((s2 == 2) && (0 == strcmp(cmd, "make"))) {
                    int product = find_string_in_array(product_str, _PRODUCT_COUNT, arg1);
                     
                    if (product>=0) {
                        pthread_mutex_lock(&workLock);
                        parts[product][0] += 1;
                        if(product == A){
                          pthread_cond_broadcast(&conds[makeA[0]]);
                        }
                        if(product == B){
                          pthread_cond_broadcast(&conds[makeB[0]]);  
                        }
                        if(product == C){
                          pthread_cond_broadcast(&conds[makeC[0]]);  
                        }
                        pthread_mutex_unlock(&workLock);
                    }
                     
                } else if ((s2 == 2) && (0 == strcmp(cmd, "end"))) {
                    for(int i = 0; i < numberOfWorkers; i++){
                        if(strcmp(workers[i]->text, strdup(arg1)) == 0){
                            pthread_mutex_lock(&workLock);
                            workers[i]->myWorkHasEnded = 1;
                            //printf("getout of here worker %d\n", i);
                            occupiedWs[workers[i]->x] -= 1;
                            pthread_cond_broadcast(&conds[workers[i]->x]);
                            pthread_mutex_unlock(&workLock);
                        }
                    }
                } else if ((s2 == 2) && (0 == strcmp(cmd, "add"))) {
                    pthread_mutex_lock(&workLock);
                    ready_places[find_string_in_array(place_str, _PLACE_COUNT, arg1)] += 1;
                    pthread_cond_signal(&conds[find_string_in_array(place_str, _PLACE_COUNT, arg1)]);
                    pthread_mutex_unlock(&workLock);
                } else if ((s2 == 2) && (0 == strcmp(cmd, "remove"))) {
                    pthread_mutex_lock(&workLock);
                    ready_places[find_string_in_array(place_str, _PLACE_COUNT, arg1)] -=1;
                    pthread_mutex_unlock(&workLock);
                }
            }
            if (s2 > 0) {
                free(cmd);
            }
            if (s2 > 1) {
                free(arg1);
            }
            free(line);
        } else if (s < 0) {
            break;
        }
    }

    /* check if every worker finished work and nobody can continue */
}

void * work(void* temp){
    worker_t *worker = (worker_t*) temp;

    while(true){
        int productPhase = -1;
        int productType = -1;
        pthread_mutex_lock(&workLock);
        if(worker->myWorkHasEnded == 1){
            pthread_mutex_unlock(&workLock);
            break;
        }
        if(ready_places[worker->x] > 0) {
            int i = _PHASE_COUNT;
            while(i >= 0){
                if(makeA[i] == worker->x && parts[A][i] >= 1){
                    productPhase = i;
                    productType = A;
                    break;
                }
                if(makeB[i] == worker->x && parts[B][i] >= 1){
                    productPhase = i;
                    productType = B;
                    break;
                }
                if(makeC[i] == worker->x  && parts[C][i] >= 1){
                    productPhase = i;
                    productType = C;
                    break;
                }
                i--;
            }
            if(!working && !reading){
                i = _PHASE_COUNT;
                while(i >= 0){
                    if(parts[A][i] == 1 && (i+1) != 6 && !working){
                        if(parts[A][i+1] == 0 && occupiedWs[makeA[i+1]] < 1){
                            cantWork = true;
                            pthread_cond_signal(&cond);
                        }
                    }
                    if(parts[B][i] == 1 && (i+1) != 6 && !working){
                        if(parts[B][i+1] == 0 && occupiedWs[makeB[i+1]] < 1){
                            cantWork = true;
                            pthread_cond_signal(&cond);
                        }
                    }
                    if(parts[C][i] == 1 && (i+1) != 6 && !working){
                        if(parts[C][i+1] == 0 && occupiedWs[makeC[i+1]] < 1){
                            cantWork = true;
                            pthread_cond_signal(&cond);
                        }
                    }
                    i--;
                }   
            }
            //FOUND SOMETHING TO DO
            if(productPhase != -1 && productType != -1){
                pthread_cond_signal(&cond);
                printf("%s %s %d %s\n", worker->text, place_str[worker->x], productPhase+1, product_str[productType]);
                ready_places[worker->x] -= 1;
                parts[productType][productPhase] -= 1;
                worker->currentlyWorking = 1;
                pthread_mutex_unlock(&workLock);
                
                getToWork(worker->x);

                pthread_mutex_lock(&workLock);
                worker->currentlyWorking = false;
                ready_places[worker->x] += 1;
                if((productPhase) == _PHASE_COUNT-1){
                    printf("done %s\n", product_str[productType]);
                } else {
                    parts[productType][productPhase + 1] += 1;
                    switch(productType){
                        case A:
                            pthread_cond_broadcast(&conds[makeA[productPhase + 1]]);
                        break;

                        case B:
                            pthread_cond_broadcast(&conds[makeB[productPhase + 1]]);
                        break;

                        case C:
                            pthread_cond_broadcast(&conds[makeC[productPhase + 1]]);
                        break;
                    }
                }
                pthread_cond_signal(&cond);
            } else{
                pthread_cond_wait(&conds[worker->x], &workLock);
            } 
        } else {
            pthread_cond_wait(&conds[worker->x], &workLock);
        }
        pthread_mutex_unlock(&workLock);
    } 
}

const int workTimer[_PLACE_COUNT] = {
    [NUZKY] = 100000,
    [VRTACKA] = 200000,
    [OHYBACKA] = 150000,
    [SVARECKA] = 300000,
    [LAKOVNA] = 400000,
    [SROUBOVAK] = 250000,
    [FREZA] = 500000,
};

void getToWork(int type){
    usleep(workTimer[type]);
}