#include <stdio.h>
#include <stdlib.h>

typedef struct experiment{
	int requieredDays;
	int income;
	int value;
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
	int bestSchedule[numberOfDays];

	for (int i = 0; i < numberOfDays; ++i)
	{
		schedule[i]=0;
	}


	int blob = 0;
	int totalIncome = 0;
	int highestIncome = 0;
	int increment=0;
	int zaloha=0;
	int j = 0;
	int counter = 0;
	int h = 1;
	experiment_t* temp;
	goto skip;
	again:
		//experiment_t* temp = malloc(sizeof(experiment_t));
		temp = experiments[0];
		experiments[0] = experiments[h];
		experiments[h] = temp;
		//free(temp);
		h++;
		if(h>numberOfExperiments){
			//goto done;
		}
	skip:
	while(counter < 20){
		for (int i = 0; i < numberOfExperiments; i++){
			for (j = j+increment; j < numberOfDays; j++){
				if((experiments[i]->activeDays[experiments[i]->requieredDays-1]+j)<numberOfDays){
					for (int k = 0; k < experiments[i]->requieredDays; k++){\
						//printf("DOSTANU SE SEM?\n");
						if(schedule[(experiments[i]->activeDays[k])+j]!=0){
							//br = 1;
							goto again;
							//break;	
						} else {
							blob++;
						}
					}
					//printf("%i\n", blob);
					if(blob==(experiments[i]->requieredDays)){
						for (int k = 0; k < experiments[i]->requieredDays; k++){
							schedule[(experiments[i]->activeDays[k])+j]=i+1;
						}
						totalIncome+=experiments[i]->income;
						blob=0;
						break;
					}
					blob=0;
				}
				/*if (totalIncome>highestIncome){
					highestIncome=totalIncome;
					for (int k = 0; k < numberOfDays; k++){
						bestSchedule[k]=schedule[k];
					}
				}*/
				//totalIncome=0;
				/*for (int k = 0; k < numberOfDays; k++){
					schedule[k]=0;
				}*/
				
			}
			j=0;
			increment=0;
			//printf("PRINTIM I: %i\n", i);
		}

		printf("TOTAL INCOME=%i\n", totalIncome);
		totalIncome=0;

		for (int i = 0; i < numberOfDays; ++i)
		{
			printf("%i ", schedule[i]);
			schedule[i]=0;
		}
		printf("\n");
		increment=zaloha++;
		counter++;
	}
	//done:

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
	return 0;
}


