#include <stdio.h>
#include <stdlib.h>

typedef struct {
	int requieredDays;
	int income;
	int value;
	int* activeDays;
} experiment_t;

int func(int* schedule, int experimentNO, int currentBest, int top, experiment_t** experiments);

int numberOfExperiments;
int numberOfDays;

//experiment_t** experiments;

int main(int argc, char const *argv[])
{	
	
	scanf("%i %i", &numberOfExperiments, &numberOfDays);

	experiment_t *experiments[numberOfExperiments];

	int absoluteBest=0;

	for (int i = 0; i < numberOfExperiments; i++){
		experiments[i] =malloc(sizeof(experiment_t));
		scanf("%i %i", &experiments[i]->requieredDays, &experiments[i]->income);
		absoluteBest+=experiments[i]->income;
		experiments[i]->value = experiments[i]->income/experiments[i]->requieredDays;
		experiments[i]->activeDays = malloc(experiments[i]->requieredDays * sizeof(int));
		for (int j = 0; j < experiments[i]->requieredDays; j++){
			scanf("%i", &experiments[i]->activeDays[j]);
		}
	}
/*
	printf("%i %i\n", numberOfExperiments, numberOfDays);
	for (int i = 0; i < numberOfExperiments; i++){
		printf("%i %i\n", experiments[i]->requieredDays, experiments[i]->income);
		for (int j = 0; j < experiments[i]->requieredDays; j++){
			printf("%i ", experiments[i]->activeDays[j]);
		}
		printf("\n");
		printf("$$ %i $$\n", experiments[i]->value);
		free(experiments[i]->activeDays);
		free(experiments[i]);
	}
*/
	//printf("AAAAAAAAAAAAAA %i\n", experiments[0]->activeDays[experiments[0]->requieredDays-1] );
	//printf("BBBBBBBBBBBBBB %i\n", experiments[numberOfExperiments-1]->activeDays[experiments[numberOfExperiments-1]->requieredDays-1]);

	int schedule[numberOfDays];

	for (int i = 0; i < numberOfDays; ++i)
	{
		schedule[i]=0;
	}

	printf("%i\n", experiments[0]->activeDays[experiments[0]->requieredDays-1]);
	printf("%i\n", experiments[0]->activeDays[experiments[0]->requieredDays-1]);

	printf("CURRENT BEST: %i\n", func(schedule, 0, -1, absoluteBest, experiments));

	printf("%i %i\n", numberOfExperiments, numberOfDays);
	for (int i = 0; i < numberOfExperiments; i++){
		printf("%i %i\n", experiments[i]->requieredDays, experiments[i]->income);
		for (int j = 0; j < experiments[i]->requieredDays; j++){
			printf("%i ", experiments[i]->activeDays[j]);
		}
		printf("\n");
		printf("$$ %i $$\n", experiments[i]->value);
		free(experiments[i]->activeDays);
		free(experiments[i]);
	}
	//free(experiments);
	//free(experiments[numberOfExperiments]);
	return 0;
}

int func (int* schedule, int experimentNO, int currentBest, int top, experiment_t** experiments){
	
}

