#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#pragma GCC optimize("Ofast")


typedef struct experiment{
	int profit;
	//int profit_per_day;
	int presumed_days;
	//struct experiment *prev;
	//struct experiment *next;
	int* active_days;
}experiment_t;

int highest_profit = 0;
int highest_day = 0;
int maxdays = 0;
int profitt= 0;
int presumedd = 0;
int loaded_value =  0;
int flag = 0;
//int diminish = 0;


/*int * passArray(int *labsched){
	int * falsesched = (int*)malloc(maxdays * sizeof(int));
	for (int i = 0; i < maxdays; ++i)
	{
		falsesched[i] = labsched[i];
	}
	return falsesched;

}*/

/*int passOntoSchedule(){
	for (int i = 0; i < 10; ++i)
	{
		
	}
	return 1;
}*/

int scanRecursively(int experiment_count, int load_val, experiment_t** experiments, int *labsched){
	int diminish = experiment_count-1;
	//printf("RECURSING, diminish %d\n", diminish);
	for(int i = 0; i<experiment_count; i++)
	{
		bool fits_in = false;
		//printf("labsched : %d\n", labsched[i]);
		int * falsesched = (int*)malloc(maxdays * sizeof(int));
		if(falsesched == NULL){
			fprintf(stderr, "CANNOT GIVE YOU A MEM NO SORRY GIRLL\n");
			return 1;

		}
		//make a copy
		for (int b = 0; b < maxdays; ++b)
		{
			falsesched[b] = labsched[b];
		}
		//printf("falsesched : %d\n", falsesched[i]);
		//printf("Pdays %d profit %d\n", experiments[i]->presumed_days, experiments[i]->profit);
		//printf("MAXDAYS: %d A MOJE SILENA PODMINKA: %d\n", maxdays, experiments[i]->active_days[experiments[i]->presumed_days-1]);
		for(int j= 0; j < maxdays - experiments[i]->active_days[experiments[i]->presumed_days-1]; j++){
			//printf("JSEM TU???\n");
			int occurence = 0;

			for (int k = 0; k < experiments[i]->presumed_days; ++k)
			{
				if((labsched[experiments[i]->active_days[k] + j ]) != 0){
					occurence = 0;
				}
				else{
					occurence++;
				}
			}
			//found
			if (occurence == experiments[i]->presumed_days){
				for (int f = 0; f < experiments[i]->presumed_days; ++f)
				{
					falsesched[experiments[i]->active_days[f] + j] = 1;
				}
				/*for (int k = 0; k < maxdays; ++k)
				{
					printf("%i ", falsesched[k]);
				}
				printf("\n");*/
				fits_in = true;
				break;
			}
			
			
		}
		
		if(fits_in == false){
			free(falsesched);
			flag = 1;
		}
		if(flag!=1){
		loaded_value = (experiments[i]->profit) + load_val;
		//printf("loaded_value: %i highest_profit: %i\n", loaded_value, highest_profit);
		if(highest_profit < loaded_value){
			//printf("LOADVAL%d\n", loaded_value)
			highest_day = 0;
			for (int k = 0; k < maxdays; k++)
			{
				if(falsesched[k] == 1){
					highest_day++;
				}
			}
			//printf("HIGHEST PROFIT:%d loaded_value:\n", highest_profit, loaded_value);
			highest_profit = loaded_value;


		}
		//diminish--;
		//create new without the element
		//POMOOOOOC JAK TO MAM PREDAVATFAKT NEVIIIM PROTOZE TO
		//printf("diminish %i\n", diminish);
		if(diminish>=0){
			experiment_t** dim_exp = malloc(diminish * sizeof(experiment_t));

		//TADY MI CHYBI PREKOPIROVANI PODMINKY THO
			for (int s = 0; s < diminish; ++s){
				if(s == i){
					dim_exp[s] = experiments[diminish];
				}
				else{
					dim_exp[s] = experiments[s];
				}
			}

			scanRecursively(diminish, loaded_value, dim_exp, falsesched);

			free(dim_exp);
		}
		free(falsesched);
	}
	flag = 0;
	}
	return 0;
}

int main(int argc, char const *argv[])
{


	int experiment_count= 0;
	scanf("%d %d", &experiment_count, &maxdays);

	int labsched[maxdays];
	for (int i = 0; i < maxdays; ++i)
	{
		labsched[i] = 0;
	}
	//pole strctu
	experiment_t* experimentarray[experiment_count];

	/*LOAD INTO ARRAY*/
	for (int i = 0; i < experiment_count; ++i)
	{
		experimentarray[i] = (experiment_t*)malloc(sizeof(experiment_t));
		scanf("%d %d", &presumedd, &profitt);
		//printf("PRESUMED %d PROFIT %d\n", presumedd, profitt);
		experimentarray[i]->presumed_days = presumedd;
		experimentarray[i]->profit = profitt;
		//experimentarray[i]->profit_per_day = (experimentarray[i]->profit)/(experimentarray[i]->presumed_days);
		//printf("I run on main thread  -  PRESUMED %d PROFIT %d\n", experimentarray[i]->presumed_days,experimentarray[i]->profit);
		experimentarray[i]->active_days = malloc(presumedd * sizeof(int));
		for (int j = 0; j < presumedd; ++j)
		{
			scanf("%d", &experimentarray[i]->active_days[j]);
			//printf("I run on main thread  -  ACTIVE DAY: %d\n", experimentarray[i]->active_days[j]);
		}	
	}


	//LETS DO IT
	if(scanRecursively(experiment_count, loaded_value, experimentarray, labsched) == 0){
		printf("%d %d\n", highest_profit, highest_day);
	}	
	for (int i = 0; i < experiment_count; ++i)
	{
		free(experimentarray[i]->active_days);
		free(experimentarray[i]);
	}
		//BROKENfree(experimentarray);

	return 0;
}
