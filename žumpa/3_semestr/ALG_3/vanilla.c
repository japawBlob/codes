#include <stdio.h>
#include <stdlib.h>

typedef struct s {
	long long int weight;
	int balance;
	int plane;
	long long int leftWeight;
	long long int rightWeight;
	struct s *parent;
	struct s *left;
	struct s *right;
} node;

long long int totalImbalance = 0;

node* recu (long long int totalWeight, int numberOfPlanes, int* planes, node* parent);
long int placePils(node* root, int pilotWeight, int imbalance, int NumberOfPilots);
void freeNodes(node* root);

int main(int argc, char const *argv[]){
	long long int numberOfPlanes;
	int pilotWeight;
	scanf("%lli %i", &numberOfPlanes, &pilotWeight);

	long long int totalWeight=0;
	int planes[numberOfPlanes];
	for (int i = 0; i < numberOfPlanes; ++i){
		scanf("%i ", &planes[i]);
		totalWeight+=planes[i];
	}


	node* root = recu(totalWeight, numberOfPlanes, planes, NULL);

	long int bestBalance;
	bestBalance = placePils(root, pilotWeight, totalImbalance, 2);

	freeNodes(root);

	printf("%lli %li\n", totalImbalance, bestBalance);

	return 0;
}

long int placePils(node* root, int pilotWeight, int imbalance, int NumberOfPilots){
	if(root->plane == 1){
		return imbalance;
	}
	int possibleBest = 2147483647;
	int temp;
	long tempImbalance;

	tempImbalance = imbalance-root->balance+llabs(root->rightWeight-(root->leftWeight+NumberOfPilots*pilotWeight));
	temp = placePils(root->left, pilotWeight, tempImbalance, NumberOfPilots);

	if(temp < possibleBest){
		possibleBest = temp;
	}

	tempImbalance = imbalance-root->balance+llabs(-root->rightWeight+(root->leftWeight-NumberOfPilots*pilotWeight));
	temp = placePils(root->right, pilotWeight, tempImbalance, NumberOfPilots);

	if(temp < possibleBest){
		possibleBest = temp;
	}

	if(NumberOfPilots-1>0){
		temp = placePils(root->right, pilotWeight, imbalance, NumberOfPilots-1) + placePils(root->left, pilotWeight, imbalance, NumberOfPilots-1) - imbalance;
		
		if(temp < possibleBest){
			possibleBest = temp;
		}
	}
	return possibleBest;
}

node* recu (long long int totalWeight, int numberOfPlanes, int* planes, node* parent){
	node* ret = malloc(sizeof(node));

	if(numberOfPlanes == 1){
		ret->weight = totalWeight;
		ret->balance = -1;
		ret->plane = 1;
		ret->parent = parent;
		ret->left=NULL;
		ret->right=NULL;
		return ret;
	}
	ret->parent = parent;
	ret->weight = totalWeight;
	ret->plane = 0;

	int i = 1;
	int j = 1;

	long long int leftWeight = planes[0];
	long long int rightWeight = planes[numberOfPlanes-1];

	totalWeight=totalWeight-rightWeight-leftWeight;

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
	ret->leftWeight=leftWeight;
	ret->rightWeight=rightWeight;
	ret->balance = llabs(rightWeight-leftWeight);

	totalImbalance += ret->balance;

 	ret->left = recu(leftWeight, i, planes, ret);
	ret->right = recu(rightWeight, j, planes+numberOfPlanes-j, ret);
	
	return ret;
}

void freeNodes (node* root){
	if(root->left!=NULL){
		freeNodes(root->left);
	}
	if(root->right!=NULL){
		freeNodes(root->right);
	}
	free(root);
}