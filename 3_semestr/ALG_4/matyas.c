#include <stdio.h>
#include <stdlib.h>

typedef struct graph{
    int** og_arr;
    int** vis_arr;
    int** dis_arr;
}graph_t;

/****************************************QUEUE IMPLEMENTATION FROM GEEKSFORGEEKS**********************************************/
typedef struct node {
    int val;
    struct node* next;
} node_t;

typedef struct queue { 
    node_t *front, *rear; 
}queue_t; 



// A utility function to create a new linked list node. 
node_t* newNode(int k) 
{ 
	//printf("new node\n");
    node_t* temp = (node_t*)malloc(sizeof(node_t)); 
    temp->val = k; 
    temp->next = NULL; 
    return temp; 
} 
  
// A utility function to create an empty queue 
queue_t* createQueue() 
{ 
    queue_t* q = (queue_t*)malloc(sizeof(queue_t)); 
    q->front = q->rear = NULL; 
    //printf("succes queue\n");
    return q; 
} 
  
// The function to add a key k to q 
void push(queue_t* q, int k) 
{ 
    // Create a new LL node 
    node_t* temp = newNode(k); 
  
    // If queue is empty, then new node is front and rear both 
    if (q->rear == NULL) { 
        q->front = q->rear = temp; 
        return; 
    } 
  
    // Add the new node at the end of queue and change rear 
    q->rear->next = temp; 
    q->rear = temp; 
} 
  
// Function to remove a key from given queue q 
node_t* pop(queue_t* q) 
{ 
    // If queue is empty, return NULL. 
   // printf("pop\n");
    if (q->front == NULL) 
        return NULL; 
  	//printf("pop2\n");
    // Store previous front and move front one node ahead 
    node_t* temp = q->front; 
    //printf("pop3\n");
    //free(temp); 
  	//printf("pop4\n");
    q->front = q->front->next; 
  	//printf("pop5\n");
    // If front becomes NULL, then change rear also as NULL 
    if (q->front == NULL) 
        q->rear = NULL; 
    return temp; 
} 

/****************************************END OF QUEUE IMPLEMENTATION FROM GEEKSFORGEEKS**********************************************/

int M = 0;
int N = 0;
int E = 0;
int Dmov = 0;
int Denv = 0;

int Search(graph_t *graph){
	int ret = 0;

	queue_t *rows = createQueue();
	queue_t	*colls = createQueue();
	queue_t *energy =  createQueue();

	push(rows, 0);
	push(colls, 0);
	push(energy, E);

	graph->vis_arr[0][0] = 2; //visited
	int nodes_left = 1;
	int nodes_next = 0;

	while(/*rows->front != NULL && rows->rear != NULL && colls->front != NULL && colls->rear != NULL*/ 1){
		int row = rows->front->val;
		pop(rows);
		int coll = colls->front->val;
		pop(colls);
		int en =  energy->front->val;
		pop(energy);

		//printf("Drone power: %d", en);
		//printf("\nROW %d COLUMN %d\n", row, coll);

		if(row == M-1 && coll == N-1){ //reached end
			fprintf(stderr, "break\n" );
			break;
		}

		for (int i = 0; i < 4; ++i)
		{
			int temp_row = row;
			int temp_coll = coll;

			switch(i){
				case 0:
					temp_row += 0;
					temp_coll += 1;
					//fprintf(stderr, "case %d\n", i);
				break;

				case 1:
					temp_row += 0;
					temp_coll += -1;
					//fprintf(stderr, "case %d\n", i);
				break;

				case 2:
					temp_row += 1;
					temp_coll += 0;
					//fprintf(stderr, "case %d\n", i);
				break;

				case 3:
					temp_row += -1;
					temp_coll += 0;
					//fprintf(stderr, "case %d\n", i);
				break;
			}

			//fprintf(stderr, "before overflow\n" );
			if(temp_row < 0 || temp_row >= M || temp_coll < 0 || temp_coll >= N){
				//fprintf(stderr, "overflow \n" );
				continue;
			}

			int temp = 0;
			int temp2 = 0;

			//first ridiculous condition
			//fprintf(stderr, "first func \n" );
			//fprintf(stderr, "R %d C %d\n", M, N);
			//fprintf(stderr, "row %d coll %d tempr %d tempc %d\n",row, coll, temp_row, temp_coll);
			if(graph->og_arr[row][coll] < graph->og_arr[temp_row][temp_coll]){
				temp = (en + Dmov);
			} else if(graph->og_arr[row][coll] == graph->og_arr[temp_row][temp_coll]){
				temp = en;
			} else if(graph->og_arr[row][coll] > graph->og_arr[temp_row][temp_coll] && en >= Dmov){
				temp = en - Dmov;
			} else if(graph->og_arr[row][coll] > graph->og_arr[temp_row][temp_coll]  && en < Dmov){
				temp = 0;
			}

			if(en <= 0){
				//fprintf(stderr, "out of en: %d \n", en );
				continue;
			}

			//second condition
			//fprintf(stderr, "second func with temp: %d \n", temp );
			if(temp >= Denv + graph->og_arr[temp_row][temp_coll]){
				temp2 = temp - Denv;
			} else if(Denv + graph->og_arr[temp_row][temp_coll] > temp && temp > graph->og_arr[temp_row][temp_coll]){
				temp2 = graph->og_arr[temp_row][temp_coll];
			} else if(temp <= graph->og_arr[temp_row][temp_coll]){
				temp2 = temp;
			}

			//fprintf(stderr, "temp 2: %d \n", temp2 );

			//visited locations
			if(graph->vis_arr[temp_row][temp_coll] == 2){
				//printf("%d dis\n", graph->dis_arr[temp_row][temp_coll]);
				//printf("%d temp2\n", temp2 );
				if(graph->dis_arr[temp_row][temp_coll] < temp2){
					graph->dis_arr[temp_row][temp_coll] = temp2;
				} else {
					continue;
				}
			} else {
				graph->dis_arr[temp_row][temp_coll] = temp2;
			}

			push(rows, temp_row);
			push(colls, temp_coll);
			push(energy, temp2);
			graph->vis_arr[temp_row][temp_coll] = 2;
			nodes_next += 1;
			//fprintf(stderr, "nodes next new %d\n", nodes_next);
		}
		//fprintf(stderr, "nodes left %d \n", nodes_left);
		//fprintf(stderr, "nodes next %d \n", nodes_next);
		nodes_left -= 1;
		if(nodes_left == 0){
			nodes_left = nodes_next;
			nodes_next = 0;
			ret += 1;
		}
	}
	fprintf(stderr, "while end\n" );
	return ret;
}



int main(int argc, char const *argv[])
{
	graph_t *graph = malloc(sizeof(graph_t));
	int dist = 0;

	scanf("%d %d %d %d %d", &M, &N, &E, &Dmov, &Denv);

	graph->og_arr = malloc(sizeof(int)*M*N);
	graph->vis_arr = malloc(sizeof(int)*M*N);
	graph->dis_arr = malloc(sizeof(int)*M*N);

	for (int i = 0; i < M; ++i) {
        //   printf("i: %d", i);
        graph->og_arr[i] = malloc(sizeof(int)*N);
        graph->vis_arr[i] = malloc(sizeof(int)*N);
        graph->dis_arr[i] = malloc(sizeof(int)*N);
        for (int j = 0; j < N; ++j) {
            //       printf("j: %d\n", j);
            scanf("%d ", &graph->og_arr[i][j]);
            graph->vis_arr[i][j] = 1;
                  // printf("%d", graph->og_arr[i][j]);

        }
         //  printf("\n");

    }

    fprintf(stderr, "search start\n" );
    dist = Search(graph);
    printf("%d\n", dist);

    for (int i = 0; i < M; ++i) {
        //   printf("i: %d", i);
        free(graph->og_arr[i]);
        free(graph->vis_arr[i]);
        free(graph->dis_arr[i]);
    }
    free(graph->og_arr);
    free(graph->vis_arr);
    free(graph->dis_arr);
    free(graph);

	return 0;
}
