#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct {
	int requieredDays;
	int income;
	int value;
	int* activeDays;
} experiment_t;

int func (int* schedule, int experimentNO, int currentBest, int top, experiment_t** experiments);

int numberOfExperiments;
int numberOfDays;
int daysToReturn;
int allTimeBestIncome = 0;
int localBest = 0;
/*
int highest_income = 0;
int highest_day = 0;
int maxdays = 0;
int profitt= 0;
int presumedd = 0;
int loaded_value =  0;
int diminish = 0;
*/
//experiment_t** experiments;

int main(int argc, char const *argv[])
{	
	
	//int numberOfExperiments= 0;
	scanf("%i %i", &numberOfExperiments, &numberOfDays);

	experiment_t *originalExperiments[numberOfExperiments];

	int absoluteBest=0;

	for (int i = 0; i < numberOfExperiments; i++){
		originalExperiments[i] = malloc(sizeof(experiment_t));
		scanf("%i %i", &originalExperiments[i]->requieredDays, &originalExperiments[i]->income);
		absoluteBest+=originalExperiments[i]->income;
		originalExperiments[i]->value = originalExperiments[i]->income/originalExperiments[i]->requieredDays;
		originalExperiments[i]->activeDays = malloc(originalExperiments[i]->requieredDays * sizeof(int));
		for (int j = 0; j < originalExperiments[i]->requieredDays; j++){
			scanf("%i", &originalExperiments[i]->activeDays[j]);
		}
	}
/*
	printf("%i %i\n", numberOfExperiments, numberOfDays);
	for (int i = 0; i < numberOfExperiments; i++){
		printf("%i %i\n", originalExperiments[i]->requieredDays, originalExperiments[i]->income);
		for (int j = 0; j < originalExperiments[i]->requieredDays; j++){
			printf("%i ", originalExperiments[i]->activeDays[j]);
		}
		printf("\n");
		printf("$$ %i $$\n", originalExperiments[i]->value);
		free(originalExperiments[i]->activeDays);
		free(originalExperiments[i]);
	}
*/
	//printf("AAAAAAAAAAAAAA %i\n", originalExperiments[0]->activeDays[originalExperiments[0]->requieredDays-1] );
	//printf("BBBBBBBBBBBBBB %i\n", originalExperiments[numberOforiginalExperiments-1]->activeDays[originalExperiments[numberOforiginalExperiments-1]->requieredDays-1]);

	int schedule[numberOfDays];

	for (int i = 0; i < numberOfDays; ++i)
	{
		schedule[i]=0;
	}

	//printf("%i\n", originalExperiments[0]->activeDays[originalExperiments[0]->requieredDays-1]);
	//printf("%i\n", originalExperiments[0]->activeDays[originalExperiments[0]->requieredDays-1]);

	//printf("CURRENT BEST: %i\n", func(schedule, 0, 0,absoluteBest, originalExperiments));

	func(schedule, numberOfExperiments, 0, absoluteBest, originalExperiments);

	printf("%i %i\n", numberOfExperiments, numberOfDays);
	for (int i = 0; i < numberOfExperiments; i++){
		printf("%i %i\n", originalExperiments[i]->requieredDays, originalExperiments[i]->income);
		for (int j = 0; j < originalExperiments[i]->requieredDays; j++){
			printf("%i ", originalExperiments[i]->activeDays[j]);
		}
		printf("\n");
		printf("$$ %i $$\n", originalExperiments[i]->value);
		free(originalExperiments[i]->activeDays);
		free(originalExperiments[i]);
	}

	printf("%i %i\n", allTimeBestIncome, daysToReturn);
	//free(originalExperiments);
	//free(originalExperiments[numberOfExperiments]);
	return 0;
}
//(int* schedule, int experimentNO, int currentBest, int top, experiment_t** experiments)
//(int *labsched, int load_val, int currentBest, int top, experiment_t **experiments)
//(int numberOfExperiments, int load_val, experiment_t **experiments, int *labsched)

int func (int* schedule, int numberOfRemainingExperiments, int currentBest, int top, experiment_t** experiments){
	//int shift = 0;
	//printf("%i\n", experiments[0]->income);
	//printf("%i\n", experiments[0]->activeDays[experiments[0]->requieredDays-1]);
	//printf("\n");
	/*for (int i = 0; i < numberOfExperiments; ++i)
	{
		printf("%i \n", experiments[i]->income);
	}*/
	int blob = 0;
	//int ret = 0;
	//int j = 0;
	//int increment = 0;
	//int localBest = 0;

	
	//printf("%i\n", tempSched[0]);
	//printf("%i\n", tempSched[numberOfDays-1]);
	/*for (int i = 0; i < numberOfDays; ++i)
	{
		tempSched[i]=schedule[i];
	}*/
	//int experimentNO = 0;
	for(int experimentNO = 0; experimentNO < numberOfRemainingExperiments; experimentNO++){
		printf("%i\n", experimentNO);
		int *tempSched = (int*)malloc(numberOfDays * sizeof(int));
		/*nextExperiment:
		if (experimentNO >= numberOfRemainingExperiments)
		{
			break;
		}*/
		int breakingPoint=0;
		for (int i = 0; i < numberOfDays; ++i)
		{
			tempSched[i]=schedule[i];
		}

		for (int j = 0; j < numberOfDays-experiments[experimentNO]->activeDays[experiments[experimentNO]->requieredDays-1]; ++j){
			blob=0;
			//j=j+shift;
			//printf("%i\n", experiments[experimentNO]->activeDays[experiments[experimentNO]->requieredDays-1]+j);
			//BOŽE ZA CO ME TRESTAS????????
			//printf("%i\n", experimentNO);
			//if((experiments[experimentNO]->activeDays[experiments[experimentNO]->requieredDays-1]+j)<numberOfDays){
				//printf("OK\n");
				for (int k = 0; k < experiments[experimentNO]->requieredDays; k++){
					//printf("DOSTANU SE SEM?\n");
					if(schedule[(experiments[experimentNO]->activeDays[k])+j]!=0){
						//break;
						blob=0;	
					} else {
						blob++;
					}
				}
				if(blob==(experiments[experimentNO]->requieredDays)){
					for (int k = 0; k < experiments[experimentNO]->requieredDays; k++){
						tempSched[(experiments[experimentNO]->activeDays[k])+j]=1;
					}
					//experimentNO++;
					/*for (int k = 0; k < numberOfDays; ++k)
					{
						printf("%i ", tempSched[k]);
					}
					printf("\n");*/
					breakingPoint=1;
					break;
					
					//localBest+=experiments[experimentNO]->income;
					//blob=0;
					//experimentNO++;
					//j=0;
					//printf("JSEM TU???\n");
					/*if(experimentNO+1<numberOfExperiments){
						if((ret=func(schedule,experimentNO+1, currentBest, top, experiments))>currentBest){
							currentBest=ret;
						}
					}*/

				}
				//blob=0;
			//}
			/*for (int k = 0; k < numberOfDays; ++k)
			{
				schedule[k]=tempSched[k];
			}*/
		}

		if(breakingPoint == 0){
			free(tempSched);
			continue;
		}

		localBest = currentBest + experiments[experimentNO]->income;
		/*if(localBest>top){
			return 0;
		}*/
		printf("loaded_value: %i highest_profit: %i\n", localBest, allTimeBestIncome);
		if(localBest>allTimeBestIncome){
			allTimeBestIncome=localBest;
			daysToReturn=0;
			for (int k = 0; k < numberOfDays; ++k)
			{
				printf("%i ", tempSched[k]);
			}
			for (int i = 0; i < numberOfDays; ++i)
			{	
				printf("\n");
				if(tempSched[i]!=0){
					daysToReturn++;
				}
				printf("DAYS TO return %i\n", daysToReturn);
			}
		}

		int newNumberOfRemainingExperiments = numberOfRemainingExperiments-1;
		printf("newNumberOfRemainingExperiments %i\n", newNumberOfRemainingExperiments);
		if(newNumberOfRemainingExperiments>=0){
			experiment_t **newExperiments = malloc(newNumberOfRemainingExperiments*(sizeof(experiment_t)));

			//printf("AAAAAAA %i \n", experiments[newNumberOfRemainingExperiments]->income);
			for (int i = 0; i < newNumberOfRemainingExperiments; ++i)
			{
				if(i == experimentNO){
					newExperiments[i] = experiments[newNumberOfRemainingExperiments];
				} else {
					newExperiments[i] = experiments[i];
				}
			}
			//printf("AAAAAAAAAAAAAAAAA%i\n", experiments[newNumberOfRemainingExperiments]->income);
			//newExperiments[0]=experiments[newNumberOfRemainingExperiments];
			//printf("BBBBBBBBBBBBBBB%i\n", newExperiments[1]->income);
			//printf("CCCCCCCCCCCCCC%i\n", newExperiments[0]->income);
			func(tempSched, newNumberOfRemainingExperiments, localBest, top, newExperiments);

			free(newExperiments);

			/*for (int k = 0; k < numberOfDays; ++k)
			{
				schedule[k]=0;
			}*/
			//experimentNO=0;
			
			//printf("increment: %i\n", increment);
		}
		//experimentNO++;
		free(tempSched);
	}
	return 0;
}
