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
node** hangedPlanes;
int blob = 0;

node* recu (long long int totalWeight, int numberOfPlanes, int* planes, node* parent);
long int placePilots(int pilotWeight, int long numberOfPlanes);
long int placePils(node* root, int pilotWeight, int imbalance, int NumberOfPilots);
long int onlyVLevo(node* root, int pilotWeight, int imbalance, int NumberOfPilots);
long int onlyVPravo(node* root, int pilotWeight, int imbalance, int NumberOfPilots);
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
/*//PRINT INPUT
	printf("%li %i\n", numberOfPlanes, pilotWeight);
	for (int i = 0; i < numberOfPlanes; ++i){
		printf("%i ", planes[i]);
	}
	printf("\n");
*/
	hangedPlanes = malloc(sizeof(node)*numberOfPlanes);

	node* root = recu(totalWeight, numberOfPlanes, planes, NULL);
/*//PRINT hangedPlanes
	for (int i = 0; i < numberOfPlanes; ++i){
		printf("%i ", hangedPlanes[i]->weight);
	}
	printf("\n");
*/	long int bestBalance;
	//bestBalance = placePilots(pilotWeight, numberOfPlanes);
	bestBalance = placePils(root, pilotWeight, totalImbalance, 2);
	//bestBalance = onlyVPravo(root, pilotWeight, totalImbalance, 2);
	freeNodes(root);
	free(hangedPlanes);

	//printf("################\n");
	printf("%lli %li\n", totalImbalance, bestBalance);
	//printf("################\n");

	return 0;
}

long int placePilots(int pilotWeight, long int numberOfPlanes){
	/*printf("AAAAAAAAAAA\n");
	for (int i = 0; i < numberOfPlanes; ++i)
	{
		node* temp = hangedPlanes[i];
		printf("%i ", temp->weight);
	}
	printf("\nAAAAAAAAAAA\n");*/
	//node* temp = hangedPlanes[0];

	long int bestBalance = 2147483647;
	long int tempBalance = totalImbalance;
	for (int i = 0; i < numberOfPlanes; ++i){
		hangedPlanes[i]->weight+=pilotWeight;
		node* temp = hangedPlanes[i];
/*		printf("BEFORE PILOT\n");
		while(temp->parent!=NULL){
			temp=temp->parent;
			printf("%li ", temp->balance);
		}
		printf("\n");
*/
		temp = hangedPlanes[i];
		while(temp->parent!=NULL){
			temp=temp->parent;
			temp->weight+=pilotWeight;
			tempBalance -= temp->balance;
			temp->balance=abs(temp->left->weight-temp->right->weight);
			tempBalance += temp->balance;
		}
		temp = hangedPlanes[i];
/*
		printf("AFTER PILOT\n");
		while(temp->parent!=NULL){
			temp=temp->parent;
			printf("%li ", temp->balance);
		}
		printf("\n");
*/
		for (int j = i+1; j < numberOfPlanes; ++j){
			hangedPlanes[j]->weight+=pilotWeight;
			node* temp2 = hangedPlanes[j];
			while(temp2->parent!=NULL){
				temp2=temp2->parent;
				temp2->weight+=pilotWeight;
				tempBalance -= temp2->balance;
				temp2->balance=abs(temp2->left->weight-temp2->right->weight);
				tempBalance += temp2->balance;
			}
			if(tempBalance<bestBalance){
				//printf("blob\n");
				bestBalance = tempBalance;
			}
			hangedPlanes[j]->weight-=pilotWeight;
			temp2=hangedPlanes[j];
			while(temp2->parent!=NULL){
				temp2=temp2->parent;
				temp2->weight-=pilotWeight;
				tempBalance -= temp2->balance;
				temp2->balance=abs(temp2->left->weight-temp2->right->weight);
				tempBalance += temp2->balance;
			}
		}
		hangedPlanes[i]->weight-=pilotWeight;
		temp=hangedPlanes[i];
		while(temp->parent!=NULL){
			temp=temp->parent;
			temp->weight-=pilotWeight;
			tempBalance -= temp->balance;
			temp->balance=abs(temp->left->weight-temp->right->weight);
			tempBalance += temp->balance;
		}
		//printf("BEST BALANCE: %li\n", bestBalance);
	}

	return bestBalance;
}

long int placePils(node* root, int pilotWeight, int imbalance, int NumberOfPilots){
	if(root->plane == 1){
		return imbalance;
	}
	int possibleBest = 2147483647;
	int temp;

	long tempImbalance = imbalance-root->balance+abs(root->rightWeight-(root->leftWeight+NumberOfPilots*pilotWeight));
	//printf("TEMP IMBALANCE %i\n", tempImbalance);
	temp = placePils(root->left, pilotWeight, tempImbalance, NumberOfPilots);
	//printf("TEMP: %i\n", temp);
	if(temp < possibleBest){
		possibleBest = temp;
	}
	tempImbalance = imbalance-root->balance+abs(-root->rightWeight+(root->leftWeight-NumberOfPilots*pilotWeight));
	//printf("TEMP IMBALANCE %i\n", tempImbalance);
	temp = placePils(root->right, pilotWeight, tempImbalance, NumberOfPilots);
	//printf("TEMP: %i\n", temp);
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

long int onlyVLevo(node* root, int pilotWeight, int imbalance, int NumberOfPilots){
	if(root->plane == 1){
		return imbalance;
	}
	int possibleBest = 2147483647;
	int temp;

	int tempImbalance = imbalance-root->balance+abs(root->rightWeight-(root->leftWeight+NumberOfPilots*pilotWeight));
	printf("TEMP IMBALANCE %i\n", tempImbalance);
	temp = onlyVLevo(root->left, pilotWeight, tempImbalance, NumberOfPilots);
	printf("TEMP: %i\n", temp);
	if(temp < possibleBest){
		possibleBest = temp;
	}
	return possibleBest;
}
long int onlyVPravo(node* root, int pilotWeight, int imbalance, int NumberOfPilots){
	if(root->plane == 1){
		return imbalance;
	}
	int possibleBest = 2147483647;
	int temp;

	int tempImbalance = imbalance-root->balance+abs(-root->rightWeight+(root->leftWeight-NumberOfPilots*pilotWeight));
	printf("TEMP IMBALANCE %i\n", tempImbalance);
	temp = onlyVPravo(root->right, pilotWeight, tempImbalance, NumberOfPilots);
	printf("TEMP: %i\n", temp);
	if(temp < possibleBest){
		possibleBest = temp;
	}
	return possibleBest;
}

node* recu (long long int totalWeight, int numberOfPlanes, int* planes, node* parent){
/*//PRINT PLANES
	printf("PRINTING EVERYTHING STORED IN THIS RECU\n");
	for (int i = 0; i < numberOfPlanes; ++i){
		printf("%i ", planes[i]);
	}
	printf("\n");
*/
	node* ret = malloc(sizeof(node));
	if(numberOfPlanes == 1){
		ret->weight = totalWeight;
		ret->balance = -1;
		ret->plane = 1;
		ret->parent = parent;
		ret->left=NULL;
		ret->right=NULL;
		hangedPlanes[blob++] = ret;
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
	ret->balance = abs(rightWeight-leftWeight);
	totalImbalance += ret->balance;

/*//PRINT LEFT SIDE PLANES
	printf("LEFT SIDE LEFT WEIGHT: %i\n", leftWeight);
	printf("I: %i\n", i);
	for (int k = 0; k < i; ++k){
		printf("%i ", planes[k]);
	}
	printf("\n");
*/
 	ret->left = recu(leftWeight, i, planes, ret);
/*//PRINT RIGHT SIDE PLANES
	printf("RIGHT SIDE RIGHT WEIGHT: %i\n", rightWeight);
	printf("J: %i\n", j);	
	for (int k = 0; k < j; ++k){
		//printf("INDEX: %i ## ", numberOfPlanes-j+k);
		printf("%i ", planes[numberOfPlanes-j+k]);
	}
	printf("\n");
	printf("PLANES[0] of right subtree: %i\n", planes[numberOfPlanes-j]);
*/
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
