#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <pthread.h>
#include <unistd.h>
#include <time.h>
#include <stdbool.h>
#define _PHASE_COUNT 6

typedef struct worker {
    int x;
    char *text;
    int index;  //mas index, obcane?
} worker_t;

/* You can use these functions and data structures to transform strings to numbers and used them in arrays*/
enum place {
  NUZKY, VRTACKA, OHYBACKA, SVARECKA, LAKOVNA, SROUBOVAK, FREZA,
  _PLACE_COUNT
};

pthread_mutex_t workLock;
pthread_cond_t cond;
pthread_cond_t conds[_PLACE_COUNT];
bool working = false;
bool reading = true;

const char *place_str[_PLACE_COUNT] = {
        [NUZKY] = "nuzky",
        [VRTACKA] = "vrtacka",
        [OHYBACKA] = "ohybacka",
        [SVARECKA] = "svarecka",
        [LAKOVNA] = "lakovna",
        [SROUBOVAK] = "sroubovak",
        [FREZA] = "freza",
};

const int makeA[_PHASE_COUNT] = { NUZKY, VRTACKA, OHYBACKA, SVARECKA, VRTACKA, LAKOVNA};
const int makeB[_PHASE_COUNT] = { VRTACKA, NUZKY, FREZA, VRTACKA, LAKOVNA, SROUBOVAK};
const int makeC[_PHASE_COUNT] = { FREZA, VRTACKA, SROUBOVAK, VRTACKA, FREZA, LAKOVNA};
int getOutOfHereWorker[32] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,};

enum product {
    A, B, C,
    _PRODUCT_COUNT
};

const char *product_str[_PRODUCT_COUNT] = {
        [A] = "A",
        [B] = "B",
        [C] = "C",
};

int find_string_in_array(const char **array, int length, char *what) {
   for (int i = 0; i < length; i++)
      if (strcmp(array[i], what) == 0)
            return i;
   return -1;
}

int ready_places[_PLACE_COUNT];
int occupiedWs[_PLACE_COUNT];
bool works[_PLACE_COUNT];
bool cantWork = false;


int parts[_PRODUCT_COUNT][_PHASE_COUNT];

void * work(void* temp){
    worker_t *worker = (worker_t*) temp;
    int tuple[2] = {-1, -1};
    fprintf(stderr, "here1\n");
    while(true){
        tuple[0] = -1;
        tuple[1] = -1;
        pthread_mutex_lock(&workLock);
        fprintf(stderr, "here2\n");
        if(getOutOfHereWorker[worker->index] == 1){
            pthread_mutex_unlock(&workLock);
            return NULL;
        }
        fprintf(stderr, "here5\n");
        for (int i = 0; i < _PLACE_COUNT; ++i)
        {
            fprintf(stderr, "%i", ready_places[i]);
        }
        fprintf(stderr, "\n");
        fprintf(stderr, "%i\n", worker->x);

        if(ready_places[worker->x] > 0) {
        	fprintf(stderr, "here6\n");
            for (int i = _PHASE_COUNT -1; i >= 0; --i){
                if(parts[A][i] >= 1 && makeA[i] == worker->x){
                    tuple[0] = i;
                    tuple[1] = A;
                    break;
                }
                if(parts[B][i] >= 1 && makeB[i] == worker->x){
                    tuple[0] = i;
                    tuple[1] = B;
                    break;
                }
                if(parts[C][i] >= 1 && makeC[i] == worker->x){
                    tuple[0] = i;
                    tuple[1] = C;
                    break;
                }
                if(!working && !reading){
                    if(parts[A][i] == 1 && (i+1) != 6 && !working){
                        if(parts[A][i+1] == 0 && occupiedWs[makeA[i+1]] < 1){
                            cantWork = true;
                            pthread_cond_signal(&cond);
                            fprintf(stderr, "cond1\n");
                        }
                    }
                    if(parts[B][i] == 1 && (i+1) != 6 && !working){
                        if(parts[B][i+1] == 0 && occupiedWs[makeB[i+1]] < 1){
                            cantWork = true;
                            pthread_cond_signal(&cond);
                            fprintf(stderr, "cond2\n");
                        }
                    }
                    if(parts[C][i] == 1 && (i+1) != 6 && !working){
                        if(parts[C][i+1] == 0 && occupiedWs[makeC[i+1]] < 1){
                            cantWork = true;
                            pthread_cond_signal(&cond);
                            fprintf(stderr, "cond3\n");
                        }
                    }
                }
            }

            if(tuple[0] != -1 && tuple[1] != -1){
                pthread_cond_signal(&cond);
                printf("%s %s %d %s\n", worker->text, place_str[worker->x], tuple[0]+1, product_str[tuple[1]]);
                ready_places[worker->x] -= 1;
                parts[tuple[1]][tuple[0]] -= 1;
                works[worker->index] = true;
                fprintf(stderr, "working\n");
                pthread_mutex_unlock(&workLock);
                switch(worker->x){
                    case NUZKY:
                        usleep(100000);
                    break;

                    case VRTACKA:
                        usleep(200000);
                    break;

                    case OHYBACKA:
                        usleep(150000);
                    break;

                    case SVARECKA:
                        usleep(300000);
                    break;

                    case LAKOVNA:
                        usleep(400000);
                    break;

                    case SROUBOVAK:
                        usleep(250000);
                    break;

                    case FREZA:
                        usleep(500000);
                    break;
                }
                pthread_mutex_lock(&workLock);
                works[worker->index] = false;
                ready_places[worker->x] += 1;
                if((tuple[0] + 1) == _PHASE_COUNT){
                    printf("done %s\n", product_str[tuple[1]]);
                } else {
                    parts[tuple[1]][tuple[0] + 1] += 1;
                    switch(tuple[1]){
                        case A:
                            pthread_cond_broadcast(&conds[makeA[tuple[0] + 1]]);
                        break;

                        case B:
                            pthread_cond_broadcast(&conds[makeB[tuple[0] + 1]]);
                        break;

                        case C:
                            pthread_cond_broadcast(&conds[makeC[tuple[0] + 1]]);
                        break;
                    }
                }
                pthread_cond_signal(&cond);
            } else{
            	fprintf(stderr, "waiting here1\n");
                pthread_cond_wait(&conds[worker->x], &workLock);
            } 
        } else {
        	fprintf(stderr, "waiting here2\n");
            pthread_cond_wait(&conds[worker->x], &workLock);
        }
        pthread_mutex_unlock(&workLock);
    }
  
}

int main(int argc, char **argv) {
    int workNum = 0;
    int workIndex = 0;
    worker_t **workers;
    workers = malloc(sizeof(worker_t) * 33);
    for (int i = 0; i < 33; ++i)
    {
    	workers[i] = malloc(sizeof(worker_t));
    }
    pthread_t *workThreads;
    workThreads = malloc(sizeof(pthread_t) * 33);
    pthread_mutex_init(&workLock, NULL);
    pthread_cond_init(&cond, NULL);

    char *line, *cmd, *arg1, *arg2, ch;
    while (1) {
        int s = scanf(" %m[^\n]", &line), s2;
        if (s == 1) {
            if (strncmp(line, "start", 5) == 0) {
                s2 = sscanf(line, "%m[a-zA-Z] %m[a-zA-Z] %m[a-zA-Z]%c", &cmd, &arg1, &arg2, &ch);
                if ((s2 == 3) && (0 == strcmp(cmd, "start"))) {
                    int temp;
                    if((temp = find_string_in_array(place_str, _PLACE_COUNT, arg2)) != -1){
                        workers[workNum]->x = temp;
                        //printf("\nx: %i\n", workers[workNum].x);
                        //usleep(10000);
                        workers[workNum]->text = strdup(arg1);
                        workers[workNum]->index = workIndex;
                        //printf("\nindex: %i\n", workers[workNum].x);
                        //usleep(10000);
                        occupiedWs[find_string_in_array(place_str, _PLACE_COUNT, arg2)] += 1;
                        workIndex += 1;
                        //printf("Got worker %s \n",workers[workNum].text );
                        pthread_create(&workThreads[workNum], NULL, work, workers[workNum]);
                        workNum += 1;
                        //printf(" number of workers %d\n", workNum);

                    }
                }
                if (s2 >= 3) {
                    free(arg2);
                }
            } else {
                s2 = sscanf(line, "%m[a-zA-Z] %m[a-zA-Z]%c", &cmd, &arg1, &ch);
                if ((s2 == 2) && (0 == strcmp(cmd, "make"))) {
                    //printf("make \n");
                  int product = find_string_in_array(product_str, _PRODUCT_COUNT, arg1);
                  //printf("%d \n", product );
                  if(product >= 0){ 
                    pthread_mutex_lock(&workLock);
                    parts[product][0] += 1;
                    //printf("parts %d %d \n",product, parts[product][0] );
                    if(product == A){
                       // printf("Prod is A\n");
                      pthread_cond_broadcast(&conds[makeA[0]]);
                    }
                    if(product == B){
                      //  printf("Prod is B\n");
                      pthread_cond_broadcast(&conds[makeB[0]]);  
                    }
                    if(product == C){
                      //  printf("Prod is C\n");
                      pthread_cond_broadcast(&conds[makeC[0]]);  
                    }
                    pthread_mutex_unlock(&workLock);
                  }
                } else if ((s2 == 2) && (0 == strcmp(cmd, "end"))) {
                  for(int i = 0; i < workNum; i++){
                    if( strcmp(workers[i]->text, strdup(arg1)) == 0){
                        pthread_mutex_lock(&workLock);
                        getOutOfHereWorker[i] = 1;
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
                    //printf("added place %s \n", arg1 );
                } else if ((s2 == 2) && (0 == strcmp(cmd, "remove"))) {
                    //if(ready_places[find_string_in_array(place_str, _PLACE_COUNT, arg1)] >= 1 ){
                      pthread_mutex_lock(&workLock);
                      ready_places[find_string_in_array(place_str, _PLACE_COUNT, arg1)] -=1;
                      pthread_mutex_unlock(&workLock);
                    //}
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
    while(1){
        bool ok = false;
        bool dontCast = false;
        pthread_mutex_lock(&workLock);
        reading = false;
        for(int w =  0; w < _PLACE_COUNT; w++){
            if(works[w] == true){
                working = true;
                break;
            } else {
                working = false;
            }
        }

        if(!working){
            //fprintf(stderr, "not working\n" );
            
            for (int i = 0; i < _PRODUCT_COUNT; ++i)
            {
                if(ready_places[i] > 0 && occupiedWs[i] > 0){
                    for (int j = 0; j < _PHASE_COUNT; ++j){ //get through the parts and if all are done
                                                
                        if(parts[i][j] == 1){
                            //printf("part %d %d done \n", i, j);
                            //fprintf(stderr, "!working, OK, break 1\n" );
                            ok = true;
                            break;
                        }
                    }
                }
                if(ok){
                    //fprintf(stderr, "break 2\n" );
                    break;
                }
            }
        } else {
            ok = true;
            dontCast = true;
            pthread_cond_wait(&cond, &workLock);
        }
        if(!ok || cantWork){//we done
            fprintf(stderr, "we done\n" );
            pthread_mutex_unlock(&workLock);
            break;
        }
        else if(!dontCast){
            //fprintf(stderr, "send sig\n" );
            for (int i = 0; i < _PLACE_COUNT; ++i)  //if I keep getting signals, soemone is working
            {
                pthread_cond_broadcast(&conds[i]);
                //fprintf(stderr, "sending sig\n" );
            }
            pthread_cond_wait(&cond, &workLock);
            //printf("got signal\n");
        }
        //fprintf(stderr, "end of while\n" );
        pthread_mutex_unlock(&workLock);
    } // end of while

    //printf("start end\n");
    pthread_mutex_lock(&workLock);  //give signal to end to workers  
    for (int i = 0; i < workNum; ++i)
    {
        //printf("%d workeer out\n", i);
        getOutOfHereWorker[i] = 1;
    }

    for (int i = 0; i < _PLACE_COUNT; ++i)
    {
        //printf("%d signal out\n", i);
        pthread_cond_broadcast(&conds[i]); //and send it
    }
    pthread_mutex_unlock(&workLock);

    for (int i = 0; i < workNum; ++i)
    {
        //printf("%d join \n", i);
        pthread_join(workThreads[i], NULL);
    }

    
    for (int i = 0; i < workNum; ++i)
    {
        //printf("%d free\n", i);
        free(workers[i]->text);
        free(workers[i]);
    }
    free(workers);
    free(workThreads);

    pthread_cond_destroy(&cond);
    for (int i = 0; i < _PLACE_COUNT; ++i)
    {
        //printf("%d destroy\n", i);
        pthread_cond_destroy(&conds[i]);
    }

    pthread_mutex_destroy(&workLock);
    //printf("end\n");
}
