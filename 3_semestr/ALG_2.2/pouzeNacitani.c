#include <stdio.h>
#include <stdlib.h>

typedef struct experiment{
	int requieredDays;
	int income;
	int* activeDays;
} experiment_t;

int main(int argc, char const *argv[])
{	
	int numberOfExperiments;
	int numberOfDays;
	scanf("%i %i", &numberOfExperiments, &numberOfDays);

	experiment_t* experiments[numberOfExperiments];

	for (int i = 0; i < numberOfExperiments; i++){
		experiments[i] =malloc(sizeof(experiment_t));
		scanf("%i %i", &experiments[i]->requieredDays, &experiments[i]->income);
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
	}
*/

	return 0;
}