#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <queue>

#define DIRECTIONS 4

typedef struct {
	int x, y, val, visited, length;
} node;
int R, S, P, T;

using namespace std;

void freeMap(node*** map);
void printMap(node*** map);
int findPath(node*** map, int startX, int startY);

int main(){



	
	scanf("%i %i %i %i", &R, &S, &P, &T);
/*
	node*** field = malloc(R*S*sizeof(node**));
	for (int i = 0; i < R; ++i){
		field[i] = malloc(S*sizeof(node*));
	}
	for (int i = 0; i < R; ++i){
		for (int j = 0; j < S; ++j){
			field[i][j]->x = i;
			field[i][j]->y = j;
			field[i][j]->visited = 0;
			field[i][j]->requieredSteps = 0;
		}
	}
*/
	node*** map = (node***)malloc(R*S*sizeof(node**));
	for(int i = 0; i<R; i++){
		map[i] = (node**)malloc(S*sizeof(node*));
	}

	for(int i = 0; i<R; i++){
		for(int j = 0; j<S; j++){
			map[i][j] =  (node*)malloc(sizeof(node));
			map[i][j]->x = i;
			map[i][j]->y = j;
			map[i][j]->val = 0;
			map[i][j]->visited = 0;
			map[i][j]->length = 99;
		}
	}

	int R0, S0;
	scanf("%i %i", &R0, &S0);
	int tempX, tempY;
	for (int i = 0; i < P; i++){
		scanf("%i %i", &tempX, &tempY);
		map[tempX-1][tempY-1]->val = -1;
	}
	int K;
	for (int i = 0; i < T; ++i){
		scanf("%i", &K);
		for (int j = 0; j < K; ++j){
			scanf("%i %i", &tempX, &tempY);
			map[tempX-1][tempY-1]->val = i+1;
		}
	}


//	printMap(map);
//	printf("WANTED: 18\n");
	printf("%i\n", findPath(map, R0-1, S0-1));


	freeMap(map);
	return 0;

}

int findPath (node*** map, int startX, int startY){
	int finalLength = 999999999;
	int currentLength = 1;
	int neededNumber = 1;
	int counter = 0;
	int pushed=0;

	queue<node*> fronticka;
	queue<node*> goals;
	queue<node*> tempFronta;

	map[startX][startY]->visited++;
	map[startX][startY]->length = 0;
	fronticka.push(map[startX][startY]);
	node* current;
	while(1){
		if(fronticka.empty()){
			break;
		}
		current = fronticka.front(); fronticka.pop();

		for (int i = 0; i < DIRECTIONS; i++){
			int tempX = current->x;
			int tempY = current->y;
			//printf("tu 1\n");
			switch(i){
				//GO UP
				case 0:
					tempY++;
					if(tempY>=S){
						continue;
					}
				break;
				//GO LEFT
				case 1:
					tempX--;
					if(tempX<0){
						continue;
					}
				break;
				//GO DOWN
				case 2:
					tempY--;
					if(tempY<0){
						continue;
					}
				break;
				//GO RIGHT
				case 3:
					tempX++;
					if(tempX>=R){
						continue;
					}
				break;
			}
			if(map[tempX][tempY]->val == -1){
				//printf("tu 2\n");
				continue;
			}
			if(map[tempX][tempY]->visited == neededNumber){
				if(map[tempX][tempY]->length > map[current->x][current->y]->length+1){
					map[tempX][tempY]->length=map[current->x][current->y]->length+1;
					tempFronta.push(map[tempX][tempY]);
				}
				//printf("tu 3\n");
				continue;
			}
			if(map[tempX][tempY]->val == neededNumber){
				map[tempX][tempY]->visited++;
				map[tempX][tempY]->length = map[current->x][current->y]->length+1;
				goals.push(map[tempX][tempY]);
				//printf("tu 4\n");
				continue;
			}
			if(neededNumber>map[tempX][tempY]->visited){
				map[tempX][tempY]->length=map[current->x][current->y]->length+1;
				//printf("tu 5\n");
			} 

//+++++++++++++++++++++++
			if(neededNumber==map[tempX][tempY]->visited && map[tempX][tempY]->length > map[current->x][current->y]->length+1){
				map[tempX][tempY]->length=map[current->x][current->y]->length+1;
				//printf("jsem tu\n");
			}
//+++++++++++++++++++++++

			map[tempX][tempY]->visited++;
			tempFronta.push(map[tempX][tempY]);
			pushed++;
		}
		if(tempFronta.empty() && fronticka.empty() && neededNumber != T){
			while(!goals.empty()){
				goals.front()->visited++;
				fronticka.push(goals.front());
				goals.pop();
			}
		 	//printf("tu 6\n");
			printMap(map);
			printf("\n");
			/*for (int i = 0; i < R; ++i){
				for (int j = 0; j < S; ++j){
					printf("%i %i\t", map[i][j]->x, map[i][j]->y);
					printf("%i\t", map[i][j]->val);
					map[i][j]->length=99999;
				}
			}
			printMap(map);*/
			neededNumber++;
		} 
		if(tempFronta.empty() && fronticka.empty() && neededNumber == T){
			int temp;
 			while(!goals.empty()){
				temp = goals.front()->length; goals.pop();
				//printf("%i\n", temp);
				if(temp<finalLength){
					finalLength = temp;
				}
			}
			//printf("tu 7\n");
			break;
		}
		if(fronticka.empty()){
			currentLength++;
			while(!tempFronta.empty()){
				fronticka.push(tempFronta.front());
				tempFronta.pop();
			}
		}
	}
/*	while(!goals.empty()){
		current = goals.front(); goals.pop();
		printf("x=%i y=%i length=%i\n", current->x, current->y, current->length);
	}*/

//	printMap(map);
	/*current = goals.front(); goals.pop();
	printf("x=%i y=%i length=%i\n", current->x, current->y, current->length);
	current = goals.front(); goals.pop();
	printf("x=%i y=%i length=%i\n", current->x, current->y, current->length);*/

//	printf("%i %i\n", temp->x, temp->y);

/*	while(1){

	}*/


	return finalLength;
}

void freeMap(node*** map){	
	for (int i = 0; i < R; ++i){
		for (int j = 0; j < S; ++j){
			free(map[i][j]);
		}
	}
	for(int i = 0; i<R; i++){
		free(map[i]);
	}
	free(map);
}

void printMap(node*** map){
	for (int i = 0; i < R; ++i){
		for (int j = 0; j < S; ++j){
			//printf("%i %i   ", map[i][j]->x, map[i][j]->y);
			//printf("%i   ", map[i][j]->val);
			printf("%i\t", map[i][j]->length);
		}
		printf("\n");
	}
}