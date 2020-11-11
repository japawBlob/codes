#include <stdlib.h>
#include <stdio.h>

typedef struct {
	int iItemIndex;
	int iData;
} tItem;

int main(int argc, char const *argv[]){
	if(argc < 2){
		fprintf(stderr, "Please input filename as argument\n");
		return 1;
	}
	tItem ** dataArray = (tItem **)calloc(20,sizeof(tItem*));
	int i = 0;
	int c;
	while(i<20){
		scanf("%d", &c);
		if(c == EOF){
			break;
		}
		dataArray[i] = (tItem*)malloc(sizeof(tItem));
		dataArray[i]->iItemIndex = i;
		dataArray[i]->iData = c;
		i++;
	}
	FILE *f;
	f = fopen(argv[1], "wb+");
	for (int j = 0; j < i; ++j){
		fwrite(dataArray[j], sizeof(dataArray[j]), 1, f);
		free(dataArray[j]);
	}
	fclose(f);
	free(dataArray);
	return 0;
}