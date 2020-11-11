#include <stdio.h>
#include <stdlib.h>

#define DIRECTIONS 4

typedef struct Field{
	int ionization, visited, possibleEnergy;
} field_t;

typedef struct queueVertex{
	int x, y, E;
} vertex_t;

typedef struct Node{
	vertex_t* vertex;
	int val;
	struct Node* next;
} node_t;

typedef struct Queue{
	node_t* totalStart;
	node_t* head;
	node_t* tail;
} queue_t;

int M, N, E, Dmov, Denv;
int posX = 0;
int posY = 0;

field_t ***map;

int searchMap(field_t ***map);

queue_t* initQueue();
void pushVertex(vertex_t* vertex, queue_t* queue);
void push(int val, queue_t* queue);
node_t* pop(queue_t* queue);
void freeQueue(queue_t* queue);
//field_t* newField(int ionization, int visited, int possibleEnergy);
vertex_t* newVertex(int x, int y, int E);

int moveUp(int startPosM, int startPosN, int E);
int moveDown(int startPosM, int startPosN, int E);
int moveRight(int startPosM, int startPosN, int E);
int moveLeft(int startPosM, int startPosN, int E);
int calculateEnergy(int I1, int I2, int E);

void freeMap();
void printMap();

int main()
{
//	int M, N, Einit, Dmov, Denv;
	int Einit, startPosM = 0, startPosN = 0;
	scanf("%i %i %i %i %i", &M, &N, &Einit, &Dmov, &Denv);

	E=Einit;
	map = (field_t***)malloc(M*N*sizeof(field_t**));
	for(int i = 0; i<M; i++){
		map[i] = (field_t**)malloc(N*sizeof(field_t*));
	}

	for(int i = 0; i<M; i++){
		for(int j = 0; j<N; j++){
			map[i][j] = malloc(sizeof(field_t));
			scanf("%i", &map[i][j]->ionization);
			map[i][j]->visited = 0;
			map[i][j]->possibleEnergy = 0;
		}
	}
	//printf("POSITION X: %i Y: %i\n", startPosM, startPosN);
	/*while(1){
		scanf("%i \n", &c);
		//printf("%i\n", c);
		if(c == 8){
			E = moveUp(startPosM, startPosN, E);
			if(E==-1){
				break;
			}
			startPosM--;
		}
		if(c == 5){
			E = moveDown(startPosM, startPosN, E);
			if(E==-1){
				break;
			}
			startPosM++;
		}
		if(c == 4){
			E = moveLeft(startPosM, startPosN, E);
			if(E==-1){
				break;
			}
			startPosN--;
		}
		if(c == 6){
			E = moveRight(startPosM, startPosN, E);
			if(E==-1){
				break;
			}
			startPosN++;
		}
		printf("ENERGY: %i, POSITION X: %i Y: %i\n", E, startPosM, startPosN);
		if(startPosM == M-1 && startPosN == N-1){
			printf("WE ARE IN THE END!!!\n");
			break;
		}
		c = 0;
	}
	*/
	//printf("AAAAAAAAAAAAAAAAAAAAA\n");
	printf("%i\n", searchMap(map));
	//printf("AAAAAAAAAAAAAAAAAAAAA\n");

/*
	queue_t* temp = initQueue();

	pushVertex(newVertex(1,1,1), temp);
	pushVertex(newVertex(2,2,2), temp);

	printf("%i\n", pop(temp)->vertex->x);
	printf("%i\n", pop(temp)->vertex->x);

	for (int i = 0; i < 100; ++i)
	{
		pushVertex(newVertex(i,i,i), temp);
		if(i%3 == 0){
			printf("%i\n", pop(temp)->vertex->x);
		}
	}
	pushVertex(newVertex(1,1,1), temp);
	pushVertex(newVertex(2,2,2), temp);

	for (int i = 0; i < 20; ++i)
	{
		printf("%i\n", pop(temp)->vertex->x);
	}

	printf("%i\n", pop(temp)->vertex->x);
	printf("%i\n", pop(temp)->vertex->x);

	freeQueue(temp);
*/
	//printMap();
	freeMap();
	
	return 0;
}

int searchMap(field_t ***map){
	int ret = 0;

	queue_t* queue = initQueue();

	vertex_t* goals[4];
	int goalsLen = 0;

	pushVertex(newVertex(0,0,E), queue);
	//pushVertex(newVertex(0,0,E), queue);

	map[0][0]->visited=1;

	int remainingFields = 1;
	int nextField = 0;

	while(1){
		node_t* blob = pop(queue);
			
		if(blob == NULL) break;
		vertex_t* current = blob->vertex;

		if(current->x == M-1 && current->y == N-1){
			break;
		}

		for (int i = 0; i < DIRECTIONS; i++){
			int tempX = current->x;
			int tempY = current->y;

			switch(i){
				//GO UP
				case 0:
					tempY++;
					if(tempY>=N){
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
					if(tempX>=M){
						continue;
					}
				break;
			}

			int tempE = calculateEnergy(map[current->x][current->y]->ionization, map[tempX][tempY]->ionization,current->E);

			if(current->E<=0){
				continue;
			} 
			if(map[tempX][tempY]->visited == 1){
				if(map[tempX][tempY]->possibleEnergy<tempE){
					map[tempX][tempY]->possibleEnergy = tempE;
				} else {
					continue;
				}
			} else {
				map[tempX][tempY]->possibleEnergy = tempE;
			}

			goals [goalsLen++] = newVertex(tempX, tempY, tempE);
			//pushVertex(newVertex(tempX, tempY, tempE), queue);
			map[tempX][tempY]->visited = 1;
			nextField++;
		}
		for (int i = 0; i < goalsLen; i++){
			pushVertex(goals[i], queue);
		}
		goalsLen = 0;

		/*free(current);
		free(blob);*/
		remainingFields--;
		if(remainingFields == 0){
			remainingFields = nextField;
			nextField = 0;
			ret++;
		}
	}
	freeQueue(queue);
	return ret;
}

int moveUp(int startPosM, int startPosN, int E){
	if(E<1){
		printf("OUT OF FUEL!!\n");
		return -1;
	}
	if(startPosM-1<0){
		printf("ERROR - got out of map\n");
		return -1;
	}
//	if(startPosN+1==N) return -1;
	int I1 = map[startPosM][startPosN]->ionization;
	int I2 = map[startPosM-1][startPosN]->ionization;
	
	return calculateEnergy(I1, I2, E);
}
int moveDown(int startPosM, int startPosN, int E){
	if(E<1){
		printf("OUT OF FUEL!!\n");
		return -1;
	}
	if(startPosM+1>M){
		printf("ERROR - got out of map\n");
		return -1;
	}
//	if(startPosN+1==N) return -1;
	int I1 = map[startPosM][startPosN]->ionization;
	int I2 = map[startPosM+1][startPosN]->ionization;
	
	return calculateEnergy(I1, I2, E);
}
int moveRight(int startPosM, int startPosN, int E){
	if(E<1){
		printf("OUT OF FUEL!!\n");
		return -1;
	}
//	if(startPosM+1==M) return -1;
	if(startPosN+1==N){
		printf("ERROR - got out of map\n");
		return -1;
	}
	int I1 = map[startPosM][startPosN]->ionization;
	int I2 = map[startPosM][startPosN+1]->ionization;
	
	return calculateEnergy(I1, I2, E);
}
int moveLeft(int startPosM, int startPosN, int E){
	if(E<1){
		printf("OUT OF FUEL!!\n");
		return -1;
	}
//	if(startPosM+1==M) return -1;
	if(startPosN-1<0){
		printf("ERROR - got out of map\n");
		return -1;
	}
	int I1 = map[startPosM][startPosN]->ionization;
	int I2 = map[startPosM][startPosN-1]->ionization;
	
	return calculateEnergy(I1, I2, E);
}


int calculateEnergy(int I1, int I2, int En){
	if(I1<I2){
		En+=Dmov;
	}
	if(I1>I2){
		En-=Dmov;
		if(En<0){
			En=0;
		}
	}
	
	if(En>=Denv+I2){
		En-=Denv;
	} else if(Denv+I2>En && En>I2){
		En=I2;
	}
	return En;
}

void printMap (){
	for(int i = 0; i<M; i++){
		for(int j = 0; j<N; j++){
			printf("%i ", map[i][j]->ionization);
		}
		printf("\n");
	}
}

void freeMap(){	
	for (int i = 0; i < M; ++i){
		for (int j = 0; j < N; ++j){
			free(map[i][j]);
		}
	}
	for(int i = 0; i<M; i++){
		free(map[i]);
	}
	free(map);
}


field_t* newField(int ionization, int visited, int possibleEnergy){
	field_t* temp = malloc(sizeof(field_t));
	temp->ionization = ionization;
	temp->visited = visited;
	temp->possibleEnergy = possibleEnergy;

	return temp;
}

vertex_t* newVertex(int x, int y, int E){
	vertex_t* temp = malloc(sizeof(vertex_t));
	temp->x = x;
	temp->y = y;
	temp->E = E;

	return temp;
}

queue_t* initQueue(){
	queue_t* ret = malloc(sizeof(queue_t));
	ret->totalStart = NULL;
	ret->head = NULL;
	ret->tail = NULL;

	return ret;
}
int swch = 0;
int counter = 0;
void pushVertex(vertex_t* vertex, queue_t* queue){
	node_t* newNode = malloc(sizeof(node_t));
	newNode->vertex = vertex;
	//printf("PUSHING %i %i %i\n", newNode->vertex->x, newNode->vertex->y, newNode->vertex->E);


	newNode->next = NULL;
	if(swch == 0){
		//if(queue->totalStart == NULL){
		queue->totalStart = newNode;
		//}
		//printf("TOTAL START: %i %i %i\n", queue->totalStart->vertex->x, queue->totalStart->vertex->y, queue->totalStart->vertex->E);
		queue->head = newNode;
		queue->tail = newNode;
		swch = 1;
		return ;
	}
	if(queue->head == queue->tail && queue->head == NULL && queue->tail == NULL){
		//if(queue->totalStart == NULL){
		while(queue->totalStart != NULL){
			//printf("COOOOOOOOOOOOOO %i\n", counter++);
			//printf("FREEING %i %i %i\n", queue->totalStart->vertex->x, queue->totalStart->vertex->y, queue->totalStart->vertex->E);

			node_t* temp = queue->totalStart;
			queue->totalStart = temp->next;
			free(temp->vertex);
			free(temp);  
		}
		queue->totalStart = newNode;
		//}
		//printf("TOTAL START: %i %i %i\n", queue->totalStart->vertex->x, queue->totalStart->vertex->y, queue->totalStart->vertex->E);
		queue->head = newNode;
		queue->tail = newNode;
		return ;
	}

	//printf("TOTAL START: %i %i %i\n", queue->totalStart->vertex->x, queue->totalStart->vertex->y, queue->totalStart->vertex->E);
	queue->tail->next = newNode;
	queue->tail = newNode;
}

void push(int val, queue_t* queue){
	node_t* newNode = malloc(sizeof(node_t));
	newNode->val = val;
	newNode->next = NULL;
	
	if(queue->head == queue->tail && queue->head == NULL){
		queue->totalStart = newNode;
		queue->head = newNode;
		queue->tail = newNode;
		return ;
	}

	queue->tail->next = newNode;
	queue->tail = newNode;
}

node_t* pop(queue_t* queue){
	//printf("POPING\n");
	if(queue->head==NULL){
		return NULL;
	}
	node_t* ret = queue->head;
	queue->head = queue->head->next;
	if(queue->head == NULL){
		queue->tail = NULL;
	}
	return ret;
}

void freeQueue(queue_t* queue){
	while(queue->totalStart != NULL){
		//printf("FREEING %i %i %i\n", queue->totalStart->vertex->x, queue->totalStart->vertex->y, queue->totalStart->vertex->E);

		node_t* temp = queue->totalStart;
		queue->totalStart = temp->next;
		free(temp->vertex);
		free(temp); 
	}
	free(queue);
}
