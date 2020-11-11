#include "config.h"
#include <stdlib.h>
#include <stdio.h>
#include <sysLib.h>
#include <time.h>

int end = 0;
int prioRunning;
int worstCaseScenario = 0;


int timespec_subtract (
		   struct timespec *result,
           struct timespec *x,
           struct timespec *y);

void highPrioTask (int numberOfMeasurements);
void midPrioTask ();
void lowPrioTask ()

void do_work_for_some_time(int x);

void CreateTasks (int stateOfPrio, int numberOfMeasurements){
	sysClkRateSet(CLOCK_RATE);
	prioRunning = stateOfPrio;
	if(prioRunning != 1 || prioRunning != 2){
		return ;
	}
	taskSpawn(tLPrio, LOW_PRIORITY, 0, 4096, (FUNCPTR) lowPrioTask, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	taskSpawn(tMPrio, MID_PRIORITY, 0, 4096, (FUNCPTR) midPrioTask, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	taskSpawn(tHPrio, HIGH_PRIORITY, 0, 4096, (FUNCPTR) highPrioTask, numberOfMeasurements, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

void highPrioTask  (int numberOfMeasurements){
	printf("Measurement started\n");
	int counter = 0;
	while (counter < numberOfMeasurements) {
	  	struct timespec result, tend, tstart;
	  	clock_gettime(CLOCK_MONOTONIC, &tstart);
	  	if (semTake(mutex, WAIT_FOREVER) == ERROR)
	  		fprintf(stderr, "semTake error\n");
	  	clock_gettime(CLOCK_MONOTONIC, &tend);
	  	semGive(mutex);
	  	int ret = timespec_subtract(&result, &tend, &tstart);
	  	/* Handle measurement and print if necessary */
	  	if (ret == 1){
	  		fprintf(stderr, "overfloading happend\n");
	  		continue;
	  	} else {
	  		long msec = result.tv_sec * 1000 + result.tv_nsec/1000000;
	  		if (msec > worstCaseScenario){
	  			worstCaseScenario = msec;
	  			printf("%li\n", msec);
	  		}
	  	}

	  	taskDelay(HIGH_PRIORITY_DELAY); /* let other tasks run */
	  	n++;
	}
	end = 1;
	printf("Measurement finished\n");
}
void midPrioTask (){
	while (!end) {
  		do_work_for_some_time(MID_PRIORITY_WORK);
  		taskDelay(MID_PRIORITY_DELAY); /* wait to let the low priority task run */
	}
}
void lowPrioTask(){
	while (!end) {
	  	semTake(mutex, WAIT_FOREVER);
	  	do_work_for_some_time(LOW_PRIORITY_WORK);
	  	semGive(mutex);
	  	taskDelay(LOW_PRIORITY_DELAY); /* this delay can be even zero - do you know why? */
	}

}
/* Subtract the `struct timespec' values X and Y,
   storing the result in RESULT (result = x - y).
   Return 1 if the difference is negative, otherwise 0.  */

int
timespec_subtract (struct timespec *result,
           struct timespec *x,
           struct timespec *y)
{
  /* Perform the carry for the later subtraction by updating Y. */
  	if (x->tv_nsec < y->tv_nsec) {
    	int num_sec = (y->tv_nsec - x->tv_nsec) / 1000000000 + 1;
    	y->tv_nsec -= 1000000000 * num_sec;
    	y->tv_sec += num_sec;
  	}
  	if (x->tv_nsec - y->tv_nsec > 1000000000) {
    	int num_sec = (x->tv_nsec - y->tv_nsec) / 1000000000;
    	y->tv_nsec += 1000000000 * num_sec;
    	y->tv_sec -= num_sec;
  	}

  /* Compute the time remaining to wait.
     `tv_nsec' is certainly positive. */
  	result->tv_sec = x->tv_sec - y->tv_sec;
  	result->tv_nsec = x->tv_nsec - y->tv_nsec;

  	/* Return 1 if result is negative. */
  	return x->tv_sec < y->tv_sec;
}

void do_work_for_some_time(int x)
{
    long int len = x * 100000000;
    while (len > 0) len--;
}