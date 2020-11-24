#include <intLib.h>
#include <iv.h>
#include <semLib.h>
#include <taskLib.h>
#include <xlnx_zynq7k.h>
#include "config.h"
#include <stdio.h>
#include <memLib.h>

#include <sysLib.h>
#include <tickLib.h>



#define INIT_HIST_SIZE (15)

int startHistSize = INIT_HIST_SIZE;
int handleHistSize = INIT_HIST_SIZE;

/*#define MAX_HIST_SIZE ((startHistSize) > (handleHistSize) ? startHistSize : handleHistSize)
*/
int histSize = INIT_HIST_SIZE;

int* startHistogram;
int* handleHistogram;
/*
int startHistogram[HISTSIZE];
int handleHistogram[HISTSIZE];*/
/*int *startHistogram;
int *handleHistogram;*/

int end = 0;
int printfCounter = 0;

int tMonitor, tService;

int startTime;
void zeroHistograms();
void timer_isr(void){
	/*int startTime = ZYNQ_TIMER_COUNTER_VAL;*/
	
	startTime = TTC0_TIMER2_COUNTER_VAL;
	TTC0_TIMER2_INTERRUPT;
	semGive(isr_semaphore);
}

void ServiceTask(int o){
	int handleTime;
	while(1){
		semTake(isr_semaphore, WAIT_FOREVER);
		handleTime = TTC0_TIMER2_COUNTER_VAL;
		TTC0_TIMER2_INTERRUPT;

		int x = handleTime * 36/1000;

		if(x < histSize){
			handleHistogram[x]++;
		} else {
			void* blob = handleHistogram;
			int i = histSize;
			histSize += x;
			handleHistogram = (int*)realloc(blob, sizeof(int)*histSize);
			blob = startHistogram;
			startHistogram = (int*)realloc(blob, sizeof(int)*histSize);
			while(i < histSize){
				handleHistogram[i++] = 0;
				startHistogram[i++] = 0;
			}
			handleHistogram[x] = 1;
		}
		x = startTime * 36/1000;
		if(x < histSize){
			startHistogram[x]++;
		} else {
			void* blob = startHistogram;
			int i = histSize;
			histSize += x;
			startHistogram = (int*)realloc(blob, sizeof(int)*histSize);
			blob = handleHistogram;
			handleHistogram = (int*)realloc(blob, sizeof(int)*histSize);
			while(i < histSize){
				startHistogram[i++] = 0;
				handleHistogram[i++] = 0;
			}
			startHistogram[x] = 1;
		}
		if(end){
			break;
		}
	}
	return ;
}

void MonitorTask(int o){
	printf("Measurement started\n");
	/*int firstFiveIterations = 0;*/
	do{
		taskDelay(1000);
		int i;
		/*int max = startHistSize > handleHistSize ? startHistSize : handleHistSize;*/
		
		for (i = 0; i < histSize; i++) {
			printf("%i,", i);
		} printf("\n");
		for (i = 0; i < histSize; i++) {
			printf("%i,\t", startHistogram[i]);
		} printf("\n");
		for (i = 0; i < histSize; i++) {
			printf("%i,\t", handleHistogram[i]);
		} printf("\n");
		/*zeroHistograms();*/
		/*if(firstFiveIterations < 5){
			firstFiveIterations++;
			zeroHistograms();
		}*/
		o--;
		
	} while (o != 0);
	printf("Measurement finished\n");
	end = 1;
	taskWait(tService, WAIT_FOREVER);
	return ;
}

void CreateTasks(int measurements){
	/* timer init (see TRM 8.5.5) */
	sysClkRateSet(CLOCK_RATE);
	
	TTC0_TIMER2_COUNTER_CTRL = CTRL_DIS;
	TTC0_TIMER2_CLOCK_CTRL = CLOCK_PRESCALE | CLOCK_PRESCALE_EN;
	TTC0_TIMER2_INTERVAL = 8333; /* See "Choosing the timer period" below */
	TTC0_TIMER2_INTERRUPT_EN = INTERRUPT_EN_IV;
	TTC0_TIMER2_COUNTER_CTRL = CTRL_INT | CTRL_EN;
	
	/*sysTimestampEnable();*/
	
	isr_semaphore = semBCreate(SEM_Q_FIFO, 0);
	
	intConnect((void*)INT_VEC_TTC0_2, timer_isr, 0);
	intEnable(INT_LVL_TTC0_2);
	
	startHistogram = (int*)malloc(sizeof(int)*histSize);
	handleHistogram = (int*)malloc(sizeof(int)*histSize);
	
	zeroHistograms();
	/*
	int timer = ZYNQ_TIMER_COUNTER_VAL;
	int blob = TTC0_TIMER2_INTERRUPT;
	int timer2 = ZYNQ_TIMER_COUNTER_VAL;

	printf("INTERRUPT: %i\n", blob);
	printf(.
	"COUNTER_VAL: %i\n", timer);
	printf("COUNTER_VAL2: %i\n", timer2);
	*/
	tMonitor = taskSpawn("tMonitor", 220, 0, 4096, (FUNCPTR) MonitorTask, measurements, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	tService = taskSpawn("tService", 99, 0, 4096, (FUNCPTR) ServiceTask, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

	
	taskWait(tMonitor, WAIT_FOREVER);

	free(startHistogram);
	free(handleHistogram);
	
	semDelete(isr_semaphore);
	TTC0_TIMER2_COUNTER_CTRL = CTRL_DIS;
	intDisable(INT_LVL_TTC0_2);
	intDisconnect((void*)INT_VEC_TTC0_2, timer_isr, 0);
}

void zeroHistograms(){
	int i;
	for (i = 0; i < histSize; i++) {
		startHistogram[i] = 0;
		handleHistogram[i] = 0;
	}
	if(histSize>INIT_HIST_SIZE){
		int* blob = startHistogram;
		histSize = INIT_HIST_SIZE;
		startHistogram = (int *)realloc(blob,sizeof(int)*histSize);
		blob = handleHistogram;
		handleHistogram = (int *)realloc(blob,sizeof(int)*histSize);
	}
}
