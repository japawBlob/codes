#include <stdio.h>
#include <stdlib.h>

typedef struct s {
	int weight;
	int balance;
	int plane;
	struct s *parent;
	struct s *left;
	struct s *right;
} node;

node* recu ();

int main(int argc, char const *argv[]){
	int numberOfPlanes;
	int pilotWeight;
	scanf("%i %i", &numberOfPlanes, &pilotWeight);

	int totalWeight=0;
	int planes[numberOfPlanes];
	for (int i = 0; i < numberOfPlanes; ++i){
		scanf("%i ", &planes[i]);
		totalWeight+=planes[i];
	}

	node* root = recu(totalWeight, numberOfPlanes, planes, NULL);



/* PRINT
	printf("%i %i\n", numberOfPlanes, pilotWeight);
	for (int i = 0; i < numberOfPlanes; ++i){
		printf("%i ", planes[i]);
	}
	printf("\n");
*/
	return 0;
}

node* recu (int totalWeight, int numberOfPlanes, int* planes, node* parent){
	node* ret = malloc(sizeof(node));
	/*if(totalWeight == planes[0]){
		ret->weight = totalWeight;
		ret->balance = -1;
		ret->plane = 1;
		ret->left=NULL;
		ret->right=NULL;
		return ret;
	}*/
	ret->parent = parent;
	ret->plane = 0;

	int i = 0;
	int j = 0;
	int leftWeight = 0;
	int rightWeight = 0;
	//totalWeight=totalWeight-rightWeight-leftWeight;
	while(totalWeight>0){
		if(leftWeight<rightWeight){
			totalWeight-=planes[i];
			leftWeight+=planes[i];
			i++;
		} else {
			totalWeight-=planes[numberOfPlanes-1-j];
			rightWeight+=planes[numberOfPlanes-1-j];
			j++;
		}
	}
	printf("I: %i\n", i );
	printf("LEFT SIDE LEFT WEIGHT: %i\n", leftWeight);
	for (int k = 0; k < i; ++k){
		printf("%i ", planes[k]);
	}
	printf("\n");
	printf("J: %i\n" ,j);
	printf("RIGHT SIDE RIGHT WEIGHT: %i\n", rightWeight);	
	for (int k = 0; k < j; ++k){
		printf("%i ", planes[k+j+1]);
	}
	printf("\n");
	if (leftWeight == planes[0]){
		ret->left = malloc(sizeof(node));
		ret->left->weight = totalWeight;
		ret->left->balance = -1;
		ret->left->plane = 1;
		ret->left->left=NULL;
		ret->left->right=NULL;
	} else {
		ret->left = recu(leftWeight, i, planes, ret);
	}
	if (rightWeight == planes[j]){
		ret->right = malloc(sizeof(node));
		ret->right->weight = totalWeight;
		ret->right->balance = -1;
		ret->right->plane = 1;
		ret->right->left=NULL;
		ret->right->right=NULL;
	} else  {
		ret->right = recu(rightWeight, j, planes+j, ret);
	}
	return ret;
}
