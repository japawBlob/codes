#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>


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
int diminish = 0;


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

int scanRecursively(int experiment_count, int load_val, experiment_t **experiments, int *labsched);



int main(int argc, char const *argv[])
{


	int experiment_count= 0;
	scanf("%d %d", &experiment_count, &maxdays);
	diminish = experiment_count;
	int labsched[maxdays];
	for (int i = 0; i < maxdays; ++i)
	{
		labsched[i] = 0;
	}
	//pole strctu
	experiment_t* experiments[experiment_count];

	/*LOAD INTO ARRAY*/
	for (int i = 0; i < experiment_count; ++i)
	{
		experiments[i] = (experiment_t*)malloc(sizeof(experiment_t));
		scanf("%d %d", &presumedd, &profitt);
		//printf("PRESUMED %d PROFIT %d\n", presumedd, profitt);
		experiments[i]->presumed_days = presumedd;
		experiments[i]->profit = profitt;
		//experiments[i]->profit_per_day = (experiments[i]->profit)/(experiments[i]->presumed_days);
		//printf("I run on main thread  -  PRESUMED %d PROFIT %d\n", experiments[i]->presumed_days,experiments[i]->profit);
		experiments[i]->active_days = malloc(presumedd * sizeof(int));
		for (int j = 0; j < presumedd; ++j)
		{
			scanf("%d", &experiments[i]->active_days[j]);
			//printf("I run on main thread  -  ACTIVE DAY: %d\n", experiments[i]->active_days[j]);
		}	
	}


	printf("EXP COUNT %i \n", experiment_count);
	printf("EXP loaded_value %i \n", loaded_value);
	printf("EXP experiments[0] %i \n", experiments[0]->profit);
	printf("EXP experiments[max] %i \n", experiments[experiment_count-1]->profit);
	printf("EXP labsched[0] %i \n", labsched[0]);
	printf("EXP labsched[max] %i \n", labsched[maxdays-1]);


	//LETS DO IT
	if(scanRecursively(experiment_count, loaded_value, experiments, labsched) == 0){
		printf("%d %d\n", highest_profit, highest_day);
	}	
	for (int i = 0; i < experiment_count; ++i)
	{
		free(experiments[i]->active_days);
		free(experiments[i]);
	}
		//BROKENfree(experiments);

	return 0;
}

int scanRecursively(int experiment_count, int load_val, experiment_t **experiments, int *labsched){
//	printf("%i\n", experiments[0]->profit );

	for(int i = 0; i<experiment_count; i++)
	{
		bool fits_in = false;
		//printf("labsched : %d\n", labsched[i]);
		int * falsesched = (int*)malloc(maxdays * sizeof(int));
		if(falsesched == NULL){
			fprintf(stderr, "CANNOT GIVE YOU A MEM SORRY\n");
			return 1;

		}
		//make a copy
		for (int b = 0; b < maxdays; ++b)
		{
			falsesched[b] = labsched[b];
		}
		//printf("falsesched : %d\n", falsesched[i]);
		printf("Pdays %d profit %d\n", experiments[i]->presumed_days, experiments[i]->profit);
		//printf("MAXDAYS: %d A MOJE SILENA PODMINKA: %d\n", maxdays, experiments[i]->active_days[experiments[i]->presumed_days-1]);
		printf("%i\n", experiments[i]->profit );
		printf("%i\n", experiments[i]->active_days[experiments[i]->presumed_days-1]);
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
			//if(experiment_count>)
			if (occurence == (experiments[loaded_value]->presumed_days)){
				for (int f = 0; f < experiments[i]->presumed_days; ++f)
				{
					falsesched[experiments[i]->active_days[f] + j] = 1;
				}

				fits_in = true;
				break;
			}
			
			
		}
		
		if(!fits_in)free(falsesched);
		loaded_value = (experiments[i]->profit) + load_val;
		if(highest_profit < loaded_value){
			for (int k = 0; k < maxdays; k++)
			{
				
			}
			highest_profit = loaded_value;

		}
		diminish--;
		//create new without the element
		//POMOOOOOC JAK TO MAM PREDAVATFAKT NEVIIIM PROTOZE TO
		experiment_t* dim_exp = (experiment_t*)malloc(diminish * sizeof(experiment_t));
		//TADY MI CHYBI PREKOPIROVANI PODMINKY THO
		scanRecursively(diminish, loaded_value, &dim_exp, falsesched);
		free(falsesched);
		free(dim_exp);
	}
	return 0;
}
