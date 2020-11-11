#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "graph.h"

#define ARR graph->arr
#define COUNTER graph->counter
#define CAPACITY graph->capacity

/* Source: https://cs.wikipedia.org/wiki/Endianita */
#define BSWAP32(n) ((n) >> 24) | (((n) << 8) & 0x00FF0000L) | (((n) >> 8) & 0x0000FF00L) | ((n) << 24)

/*
int to_int(char c){
	return c - 48;
}

void read (int what, char c, FILE *f){
	what = to_int(c);
	c = fgetc(f);
	while(c != ' ' && c != '\n'){
		what *= 10;
		what += to_int(c);
		c = fgetc(f);
	}
}
*/

/* Allocate a new graph and return a reference to it. */
graph_t* allocate_graph(){
    graph_t *graph;
	graph = (graph_t*)malloc(sizeof(graph_t));
	CAPACITY = 20;
	COUNTER = 0;
	ARR = (uint32_t*)malloc(CAPACITY*sizeof(uint32_t));
	
	return graph;
}

/* Free all allocated memory and set reference to the graph to NULL. */
void free_graph(graph_t **graph){
    free((*graph)->arr);
    free(*graph);
}

/* Load a graph from the text file. */
void load_txt(const char *fname, graph_t *graph){
    FILE *f = fopen(fname, "r");

	uint32_t first_node = 0;
	uint32_t second_node = 0;
	uint32_t path = 0;
//	char c;
	

    while(fscanf(f,"%i", &first_node) != EOF){
    	
		fscanf(f,"%i", &second_node);
		fscanf(f,"%i", &path);
		
//		printf("%i", first_node);
//		printf(" %i", second_node);
//		printf(" %i\n", path);
		
		ARR[COUNTER] = first_node;
		ARR[COUNTER+1] = second_node;
		ARR[COUNTER+2] = path;
		
		
		COUNTER += 3;
		
		if((COUNTER+3) >= CAPACITY){
			CAPACITY *= 2; 
			ARR = (uint32_t*)realloc(ARR, CAPACITY*sizeof(uint32_t));
			
		}

	}
    fclose(f);

	/*
	while((c = fgetc(f)) != EOF){
		read(first_node, c, f);
		c = fgetc(f);
		read(second_node, c, f);
		c = fgetc(f);
		read(path, c, f);
		ARR[COUNTER][0] = first_node;
		ARR[COUNTER][1] = second_node;
		ARR[COUNTER][2] = path;
		
		COUNTER++;
		
		if(COUNTER == CAPACITY){
			ARR = (int**)realloc(ARR, 2*CAPACITY*sizeof(int*));
			for(int i = CAPACITY; i<2*CAPACITY; i++){
				ARR[CAPACITY] = (int*)malloc(3*sizeof(int));
			}
			CAPACITY *= 2; 
		}
	}
	*/
}

/* Load a graph from the binary file. */
void load_bin(const char *fname, graph_t *graph){
    
    FILE *f = fopen( fname, "rb" );
	uint32_t first_node;
	uint32_t second_node;
	uint32_t path;
//	int blob;
	
	while(fread(&first_node, sizeof(uint32_t), 1, f) != 0){
		if(fread(&second_node, sizeof(uint32_t), 1, f) == 0){
			break;
		}
		if(fread(&path, sizeof(uint32_t), 1, f) == 0){
			break;
		}
		ARR[COUNTER] = BSWAP32(first_node);
		ARR[COUNTER+1] = BSWAP32(second_node);
		ARR[COUNTER+2] = BSWAP32(path);
		
		COUNTER += 3;
		
		if((COUNTER+3) >= CAPACITY){
			CAPACITY *= 2; 
			ARR = (uint32_t*)realloc(ARR, CAPACITY*sizeof(uint32_t));
			
		}
	}
    fclose(f);
    
}

/* Save the graph to the text file. */
void save_txt(const graph_t * const graph, const char *fname){
    FILE *f = fopen(fname, "w");
    for(int i = 0; i < COUNTER; i++){
		fprintf(f,"%i",ARR[i]);
		fputc(' ', f);
		fprintf(f,"%i",ARR[++i]);
		fputc(' ', f);	
		fprintf(f,"%i",ARR[++i]);
		fputc('\n', f);
	}
    fclose(f);
}

/* Save the graph to the binary file. */
void save_bin(const graph_t * const graph, const char *fname){
    FILE* f = fopen(fname, "wb");
	for(int i = 0; i < COUNTER; i++){
		if((i+1)%3 == 0){
			uint32_t path = BSWAP32 (ARR[i]);
			fwrite(&path, sizeof(uint32_t), 1, f);
		} else if((i+1)%2 == 0){
			uint32_t second_node = BSWAP32(ARR[i]);
            fwrite(&second_node, sizeof(uint32_t), 1, f);
		} else {
			uint32_t first_node = BSWAP32(ARR[i]);
			fwrite(&first_node, sizeof(uint32_t), 1, f);
		}  
	}
	fclose(f);
}
