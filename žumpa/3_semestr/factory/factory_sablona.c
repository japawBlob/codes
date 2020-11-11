#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdbool.h>
#include <pthread.h>

typedef struct worker {
    int x;
    char *text;
} worker_t;

 //You can use these functions and data structures to transform strings to numbers and used them in arrays
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

int find_string_in_array(const char **array, int length, char *what) {
   for (int i = 0; i < length; i++)
      if (strcmp(array[i], what) == 0)
         return i;
   return -1;
}


/* It is not necessary to represent each working place with a dynamically allocated object.
 * You can store only number of ready places*/
int ready_places[_PLACE_COUNT];
bool isWork = false;
pthread_cond_t canWork;
pthread_mutex_t workLock;
bool working [_PLACE_COUNT];

/* It is not necessary to represent each part as a dynamically allocated object.
 * you can have only number of parts for each working phase*/
#define _PHASE_COUNT 6
int parts[_PRODUCT_COUNT][_PHASE_COUNT];

void workCheck(worker_t *worker){
	if(ready_places[worker->x]!= 0){
		ready_places[worker->x] -=1;
		switch(worker->x){
			case NUZKY:
				if(parts[1][1] == 1){
					working[0] = false;
					parts[1][1] = 0;
					printf("%s %s %d %s\n",worker->text, "nuzky", 2, "B" );
					pthread_mutex_unlock(&workLock);
					usleep(100000);
					pthread_mutex_lock(&workLock);
					parts[1][2] = 1;
					working[6] = true;
				}
				if(parts[0][0] == 1){
					for (int i = 0; i < 6; ++i)
					{
						printf("%d ", parts[0][i]);
					}
					printf("\n");
					working[0] = false;
					parts[0][0] = 0;
					printf("wtf\n");
					printf("%s %s %d %s\n",worker->text, "nuzky", 1, "A" );
					pthread_mutex_unlock(&workLock);
					printf("whyy\n");
					usleep(100000);
					pthread_mutex_lock(&workLock);
					printf("locked again\n");
					parts[0][1] = 1;
					working[1] = true;
					for (int i = 0; i < 6; ++i)
					{
						printf("%d ", parts[0][i]);
					}
					printf("\n");
				}
			break;
			case VRTACKA:
				if(parts[0][4] == 1){
					working[1] = false;
					parts[0][4] = 0;
					printf("%s %s %d %s\n",worker->text, "vrtacka", 5, "A" );
					pthread_mutex_unlock(&workLock);
					usleep(200000);
					pthread_mutex_lock(&workLock);
					working[4] = true;
					parts[0][5] = 1;
				}
				if(parts[1][3] == 1){
					working[1] = false;
					parts[1][3] = 0;
					printf("%s %s %d %s\n",worker->text, "vrtacka", 4, "B" );
					pthread_mutex_unlock(&workLock);
					usleep(200000);
					pthread_mutex_lock(&workLock);
					working[4] = true;
					parts[1][4] = 1;
				}
				if(parts[2][3] == 1){
					working[1] = false;
					parts[2][3] = 0;
					printf("%s %s %d %s\n",worker->text, "vrtacka", 4, "C" );
					pthread_mutex_unlock(&workLock);
					usleep(200000);
					pthread_mutex_lock(&workLock);
					working[6] = true;
					parts[2][4] = 1;
				}
				if(parts[0][1] == 1){
					working[1] = false;
					parts[0][1] = 0;
					printf("%s %s %d %s\n",worker->text, "vrtacka", 2, "A" );
					pthread_mutex_unlock(&workLock);
					usleep(200000);
					pthread_mutex_lock(&workLock);
					working[2] = true;
					parts[0][2] = 1;
				}
				if(parts[2][1] == 1){
					working[1] = false;
					parts[2][1] = 0;
					printf("%s %s %d %s\n",worker->text, "vrtacka", 2, "C" );
					pthread_mutex_unlock(&workLock);
					usleep(200000);
					pthread_mutex_lock(&workLock);
					working[5] = true;
					parts[2][2] = 1;
				}
				if(parts[1][0] == 1){
					working[1] = false;
					parts[1][0] = 0;
					printf("%s %s %d %s\n",worker->text, "vrtacka", 1, "B" );
					pthread_mutex_unlock(&workLock);
					usleep(200000);
					pthread_mutex_lock(&workLock);
					working[0] = true;
					parts[1][1] = 1;
				}
			break;
			case OHYBACKA:
				if(parts[0][2] == 1){
					working[2] = false;
					parts[0][2] = 0;
					printf("%s %s %d %s\n",worker->text, "ohybacka", 3, "A" );
					pthread_mutex_unlock(&workLock);
					usleep(150000);
					pthread_mutex_lock(&workLock);
					working[3] = true;
					parts[0][3] = 1;
				}
			break;
			case SVARECKA:
				if(parts[0][3] == 1){
					working[3] = false;
					parts[0][3] = 0;
					printf("%s %s %d %s\n",worker->text, "svarecka", 4, "A" );
					pthread_mutex_unlock(&workLock);
					usleep(300000);
					pthread_mutex_lock(&workLock);
					working[1] = true;
					parts[0][4] = 1;
				}
				break;
			case LAKOVNA:
				if(parts[0][5] == 1){
					working[4] = false;
					parts[0][5] = 0;
					//parts[0][1] = 1;
					printf("%s %s %d %s\n",worker->text, "lakovna", 6, "A" );
					pthread_mutex_unlock(&workLock);
					usleep(400000);
					pthread_mutex_lock(&workLock);
					printf("%s %s\n","done","A" );
				}
				if(parts[2][5] == 1){
					parts[2][5] = 0;
					working[4] = false;
					//parts[0][] = 1;
					printf("%s %s %d %s\n",worker->text, "lakovna", 6, "C" );
					pthread_mutex_unlock(&workLock);
					usleep(400000);
					pthread_mutex_lock(&workLock);
					printf("%s %s\n","done","C" );
				}
				if(parts[1][4] == 1){
					working[4] = false;
					parts[1][4] = 0;
					printf("%s %s %d %s\n",worker->text, "lakovna", 5, "B" );
					pthread_mutex_unlock(&workLock);
					usleep(400000);
					pthread_mutex_lock(&workLock);
					working[5] = true;
					parts[1][5] = 1;
				} 
			break;
			case SROUBOVAK:
				if(parts[1][5] == 1){
					parts[1][5] = 0;
					//parts[0][1] = 1;
					working[5] = false;
					printf("%s %s %d %s\n",worker->text, "sroubovak", 6, "B" );
					pthread_mutex_unlock(&workLock);
					usleep(250000);
					pthread_mutex_lock(&workLock);
					printf("%s %s\n","done","B" );
				}
				if(parts[2][2] == 1){
					working[4] = false;
					parts[2][2] = 0;
					printf("%s %s %d %s\n",worker->text, "sroubovak", 3, "C" );
					pthread_mutex_unlock(&workLock);
					usleep(250000);
					pthread_mutex_lock(&workLock);
					working[1] = true;
					parts[2][3] = 1;
				} 
			break;
			case FREZA:
				if(parts[2][4] == 1){
					working[5] = false;
					parts[2][4] = 0;
					printf("%s %s %d %s\n",worker->text, "nuzky", 5, "C" );
					pthread_mutex_unlock(&workLock);
					usleep(500000);
					pthread_mutex_lock(&workLock);
					working[4] = true;
					parts[2][5] = 1;
				}
				if(parts[1][2] == 1){
					working[5] = false;
					parts[1][2] = 0;
					printf("%s %s %d %s\n",worker->text, "nuzky", 3, "B" );
					pthread_mutex_unlock(&workLock);
					usleep(500000);
					pthread_mutex_lock(&workLock);
					working[1] = true;
					parts[1][3] = 1;
				}
				if(parts[2][0] == 1){
					working[5] = false;
					parts[2][0] = 0;
					printf("%s %s %d %s\n",worker->text, "nuzky", 1, "C" );
					pthread_mutex_unlock(&workLock);
					usleep(500000);
					pthread_mutex_lock(&workLock);
					working[1] = false;
					parts[2][1] = 1;
				} 
			break;
		}
		ready_places[worker->x] +=1;
		printf("end work \n");
	} 
}

void *work (void *worker){
	worker_t *name = (worker_t*)worker;
	while(1){
		pthread_mutex_lock(&workLock);
		while(!isWork && !working[name->x]){
			printf("nowork\n");
			pthread_cond_wait(&canWork, &workLock);
			printf("unlock\n");
		}
		if(isWork && working[name->x]){
			isWork = false;
			printf(" %s started work \n", name->text);
			workCheck(name);
			isWork= true;
			pthread_cond_signal(&canWork);

		}
		pthread_mutex_unlock(&workLock);
	}
}





int main(int argc, char **argv) {
    /* init your internal structures, mutexes and conddition variables */
    //printf("WTF\n");
    int workNum = 0;
    worker_t *worker;
    worker_t *workers;
    workers = malloc(sizeof(worker_t) * 33);
    pthread_t *workThreads;
    workThreads = malloc(sizeof(pthread_t) * 33);
    pthread_mutex_init(&workLock, NULL);

    char *line, *cmd, *arg1, *arg2, ch;
   // printf("got to while\n");
    while (1) {
        int s = scanf(" %m[^\n]", &line), s2;
        //printf("%d \n", s);
        if (s == 1) {
            if (strncmp(line, "start", 5) == 0) {
            	//printf("start\n");
                s2 = sscanf(line, "%m[a-zA-Z] %m[a-zA-Z] %m[a-zA-Z]%c", &cmd, &arg1, &arg2, &ch);
               //	printf("%d s2 \n",s2);
                if ((s2 == 3) && (0 == strcmp(cmd, "start"))) {
                	//fprintf(stderr, "found worker\n" );
                	workers[workNum].x = find_string_in_array(place_str, _PLACE_COUNT, arg2);
                	workers[workNum].text = strdup(arg1);
                	worker = &workers[workNum];
                	printf("Got worker %s \n",workers[workNum].text );
                	/* start new thread for new worker */
                	pthread_create(&workThreads[workNum], NULL, work, worker);
                    /* copy worker name from arg1, the arg1 will be removed at the end of scanf
                     * cycle */
                    /* workers should have dynamic objects, you don't know total number of workers
                     */

                	workNum++;
                	//workers = realloc(workers, sizeof(worker_t) * (workNum+1)); //make simpler
                	//workThreads = realloc(workThreads, sizeof(pthread_t) * (workNum+1));//make static or a pointer field, mozna spojak
                }
                if (s2 >= 3) {
                    free(arg2);
                }
            } else {
                s2 = sscanf(line, "%m[a-zA-Z] %m[a-zA-Z]%c", &cmd, &arg1, &ch);
                if ((s2 == 2) && (0 == strcmp(cmd, "make"))) {
                    int product = find_string_in_array(product_str, _PRODUCT_COUNT, arg1);
                     if (product>=0) {
                     	fprintf(stderr, "got make %s\n", arg1);
                     	if(product == 0){
                     		working[0] = true;
                     	}
                     	if(product == 1){
                     		working[1] = true;
                     	}
                     	if(product == 2){
                     		working[6] = true;
                     	}
                     	parts[product][0] = 1;
                     	isWork = true;
                     	pthread_cond_signal(&canWork);

                     }
                     /*   add the part to factory cycle
                     *   you need to wakeup worker to start working if possible
                     */

                } else if ((s2 == 2) && (0 == strcmp(cmd, "end"))) {
                    /* tell the worker to finish
                     * the worker has to finish work first
                     * you should not wait here for the worker to finish */
                	for(int i = 0; i < workNum; i++){
                		if( strcmp(workers[i].text, strdup(arg1)) == 0){
//HERE?
                		}
                	}
                    /* if the worker is waiting for work
                       you need to wakeup the worker */
                } else if ((s2 == 2) && (0 == strcmp(cmd, "add"))) {
                    /* add new place */
                    //printf("place add\n");
                    ready_places[find_string_in_array(place_str, _PLACE_COUNT, arg1)] += 1;
                    printf("added placce %s \n", arg1 );
                    /* if worker and part is ready, start working - wakeup worker */
                } else if ((s2 == 2) && (0 == strcmp(cmd, "remove"))) {
                    /* if you cannot remove empty place you cannot wait for finish work */
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
    pthread_mutex_destroy(&workLock);
}
