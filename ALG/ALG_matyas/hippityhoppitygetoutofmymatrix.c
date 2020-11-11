#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define red 2
#define blue 3

struct edge {
	int from, to;
};
int cur_best = 0;
int red_blue = 1; //what goes next, red =  0 blue = 1
int N,M,A,B;
int control = 2;


struct apex {
	struct edge** edges;
	int matrix [4];
	int edge_count;
	bool used_red;
	bool used_blue;
};

void reevaluate(int apex_num, int t, struct apex** apexes){
	int from, to;
	for (int i = 0; i < apexes[apex_num]->edge_count; ++i)
	{
		from = apexes[apex_num]->edges[i]->from;
		to = apexes[apex_num]->edges[i]->to;
		if(apex_num == to-1){
			apexes[from-1]->matrix[0] -= 1;
			apexes[from-1]->matrix[1] += 1;
			apexes[from-1]->matrix[t] += 1;
		}	
		if(apex_num == from-1){
			apexes[to-1]->matrix[0] -= 1;
			apexes[to-1]->matrix[1] += 1;
			apexes[to-1]->matrix[t] += 1;
		}
	}
}

void place_blue(struct apex** apexes){
	int best = -1;
	int best_worst = 190;
	int temp;
	for (int i = 0; i < N; ++i)
	{
		//printf("going for apex %d \n", i+1);
		if(apexes[i]->used_red != true && apexes[i]->used_blue != true){
			if(apexes[i]->matrix[0] > best /*&& apexes[i]->matrix[blue] < best_worst*/){
				best = apexes[i]->matrix[0];

				best_worst = apexes[i]->matrix[1];
				temp = i;
				//printf("best blue %d with val %d \n", temp+1, best);
			}
		}else{
			//printf("apex %d used\n", i+1 );
		}
	}

	//printf("got apex %d withval %d \n",temp+1, best  );
	apexes[temp]->used_blue = true;
	reevaluate(temp, blue, apexes);
	red_blue = 0;
}

void place_red(struct apex** apexes){
	int best = -1;
	int best_worst = 0;
	int temp;
	for (int i = 0; i < N; ++i)
	{
		if(apexes[i]->used_red != true && apexes[i]->used_blue != true){
			if(apexes[i]->matrix[1] > best && apexes[i]->matrix[red]+apexes[i]->matrix[blue] > best_worst){
				best = apexes[i]->matrix[0];
				best_worst = apexes[i]->matrix[1];
				temp = i;
			}
		}
	}
	apexes[temp]->used_red = true;
	reevaluate(temp, red, apexes);
	red_blue = 1;
}

int main(int argc, char const *argv[])
{
	int backup_matrix [N];
	
	scanf("%d %d %d %d\n", &N, &M, &A, &B);
	int *idunno  = malloc(sizeof(int)*N);
	struct apex** apexes = malloc(sizeof(struct apex) * N);
	for (int i = 0; i < N; ++i)
	{
		struct apex* apex= malloc(sizeof(struct apex));
		struct edge** edges = malloc(sizeof(struct edge) * M);
		apex->edges = edges;
		apexes[i] = apex;
		apexes[i]->edge_count = 0;
		apexes[i]->used_red = apexes[i]->used_blue = false;
		apexes[i]->matrix[0] = 0;
		apexes[i]->matrix[1] = 0;
		apexes[i]->matrix[2] = 0;
		apexes[i]->matrix[3] = 0;
		idunno[i] = 0;
	}
	for (int i = 0; i < M; ++i)
	{
		int from, to;
		scanf("%d %d\n",  &from, &to);
		struct edge* edge = malloc(sizeof(struct edge));
		edge->from = from;
		edge->to = to;
		apexes[from-1]->edges[apexes[from-1]->edge_count] = edge;
		apexes[to-1]->edges[apexes[to-1]->edge_count] = edge;
		apexes[from-1]->edge_count += 1;
		apexes[to-1]->edge_count += 1;
		apexes[from-1]->matrix[0] += 1;
		apexes[to-1]->matrix[0] += 1;
		idunno[from-1] += 1;
		idunno[to-1] += 1;

	}	
/*
	for(int i = 0; i < N; i++){
		printf("Vrchol %d ma %d hran:\n", i+1, apexes[i]->edge_count );
		for (int j = 0; j < apexes[i]->edge_count; ++j)
		{
			printf(" \t %d %d \n", apexes[i]->edges[j]->from, apexes[i]->edges[j]->to);
		}
		printf("\n \t %d %d %d %d \n", apexes[i]->matrix[0], apexes[i]->matrix[1], apexes[i]->matrix[2], apexes[i]->matrix[3]);	
		printf("backup %d\n", backup_matrix[i]);
	}


*/
	for (int i = 0; i < N; ++i)
	{	
		int temp = 0;
		apexes[i]->used_red = true;
		int placed = 0;
		int red_count = 0;
		int blue_count = 0;
		reevaluate(i, red, apexes);
		placed++;
		red_count++;
		red_blue = 1;
		printf("A %d B %d\n",A, B );

		while(placed < A+B){
			//printf("Red %d Blue %d redblu %d\n", red_count, blue_count, red_blue);
			if(red_blue == 1 && B >= blue_count){
				place_blue(apexes);
				placed++;
				blue_count++;
			} else if (red_blue == 0 && A >= red_count){
				place_red(apexes);
				placed++;
				red_count++;
			} else if( B < blue_count){
				place_red(apexes);
				placed++;
				red_count++;
			} else if( A < red_count){
				place_blue(apexes);
				placed++;
				blue_count++;
			}
		}



		for (int i = 0; i < N; ++i)
		{
			printf(" apex %d \n",i+1);
			if (apexes[i]->used_red)
			{
				for (int j = 0; j < apexes[i]->edge_count; ++j)
				{
					if(apexes[i]->edges[j]->from == i+1 ){
						if(apexes[(apexes[i]->edges[j]->to)-1]->used_red || apexes[(apexes[i]->edges[j]->to)-1]->used_blue ){
							printf("temp++red\n");
							temp += 1;
						}
					}else if(apexes[i]->edges[j]->to == i+1 ){
						if(apexes[(apexes[i]->edges[j]->from)-1]->used_red || apexes[(apexes[i]->edges[j]->from)-1]->used_blue ){
							printf("temp++red\n");
							temp += 1;
						}
					}
				}
			} else if(apexes[i]->used_blue){
				for (int j = 0; j < apexes[i]->edge_count; ++j)
				{
					if(apexes[i]->edges[j]->from == i+1){
						if(!apexes[(apexes[i]->edges[j]->to)-1]->used_red && !apexes[(apexes[i]->edges[j]->to)-1]->used_blue ){
							printf("temp ++blue\n");
							temp += 1;
						}
					}else if(apexes[i]->edges[j]->to == i+1 ){
						if(!apexes[(apexes[i]->edges[j]->from)-1]->used_red && !apexes[(apexes[i]->edges[j]->from)-1]->used_blue ){
							printf("temp++blue\n");
							temp += 1;
						}
					}
				}
			}
		}

		if(temp > cur_best){
			printf("\n%d better than %d\n\n", temp, cur_best);
			cur_best = temp;
			for(int i = 0; i < N; i++){
			//printf("Vrchol %d s %d hrany \n", i+1, apexes[i]->edge_count );
				if (apexes[i]->used_red)
				{
					 printf("red %d \n", i+1);
				} else if( apexes[i]->used_blue){
					 printf("blue %d \n", i+1);
				}
			// for (int j = 0; j < apexes[i]->edge_count; ++j)
			// {
			// 	printf(" \t %d %d \n", apexes[i]->edges[j]->from, apexes[i]->edges[j]->to);
			
				
			// }
			//printf("\n \t %d %d %d %d \n", apexes[i]->matrix[0], apexes[i]->matrix[1], apexes[i]->matrix[2], apexes[i]->matrix[3]);
			}
		} else {
			 printf("\nthats not good enough\n\n");
		}


		//rollback
		for (int i = 0; i < N; ++i)
		{

			apexes[i]->used_red = apexes[i]->used_blue = false;
			apexes[i]->matrix[0] = idunno[i];
			apexes[i]->matrix[1] = 0;
			apexes[i]->matrix[2] = 0;
			apexes[i]->matrix[3] = 0;
			/*printf( "backup %d ", backup_matrix[i]);
			printf("\n");*/
		}
	}

	//printf("ruda v %d \n", i+1);
		
	
	printf("%d\n", cur_best);

	return 0;
}

