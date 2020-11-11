#include <stdio.h>
#include <stdlib.h>

typedef struct node{
	int val;
	struct node* left;
	struct node* right;
}node_t;

void addNode(node_t* root, int val);
node_t* removeNode(node_t* root, int val);
node_t* removeNodeContinue(node_t* root, int val);
node_t* newNode(int val);
void freeTree(node_t* root);
node_t* maxValueNodeOnLeft(node_t* root);
int calculateDepth(node_t* root);
node_t* consolidation(node_t* root);
int* treeToField(node_t* root);
void treeToFieldContinue(node_t* root, int* pointer, int* field);
node_t* recu(node_t* root, int length, int* nodes);
int numberOfNodes = 0;
int numberOfConsolidations = 0;

void print2DUtil(node_t *root, int space)
{
    // Base case
    if (root == NULL)
        return;

    // Increase distance between levels
    space += 6;

    // Process right child first
    print2DUtil(root->right, space);

    // Print current node after space
    // count
    //printf("\n");
    for (int i = 6; i < space; i++)
        printf(" ");
    printf("%d\n", root->val);

    // Process left child
    print2DUtil(root->left, space);
}

// Wrapper over print2DUtil()
void print2D(node_t *root)
{
    // Pass initial space count as 0
    print2DUtil(root, 0);
}

int main(int argc, char const *argv[]){
	int numberOfInputs;
	scanf("%i", &numberOfInputs);

	int val;
	node_t* root;
	for(int i = 0; i < numberOfInputs; i++){
		scanf("%i", &val);
		if(i == 0){
			//printf("here\n");
			root = newNode(val);
			continue;
		}
		if(val == -999999) break;
		val>0 ? addNode(root, val) : (root=removeNode(root, val));
		//print2D(root);
		//printf("Depth %i\n", calculateDepth(root));
		//printf("2^Depth %i\n", 2<<(calculateDepth(root)-1));
		//printf("numberOfNodes*2 %i\n", 2*numberOfNodes);
		/*if(val == 321){
			print2D(root);
		}*/

		if((2<<(calculateDepth(root)-2)) > 2*numberOfNodes){
			root = consolidation(root);
		}
		//printf("-----------------------------------\n");
	}


	//print2D(root);

	printf("%i %i\n", numberOfConsolidations, calculateDepth(root)-1);

	freeTree(root);

	return 0;
}

void addNode(node_t* root, int val){
	if(root->val == val) return ;
	if(val == 321){
		//printf("here\n");
	}
	if(root->val > val){
		if(val == 321){
			//printf("here1\n");
		}
		root->left==NULL ? root->left=newNode(val) : addNode(root->left,val);
	} else {
		if(val == 321){
			//printf("here2\n");
		}
		root->right==NULL ? root->right=newNode(val) : addNode(root->right,val);
	}
}

node_t* newNode(int val){
	numberOfNodes++;
	//printf("numberOfNodes: %i\n", numberOfNodes);
	node_t* ret = malloc(sizeof(node_t));
	ret->val=val;
	ret->left = NULL;
	ret->right = NULL;
	return ret;
}
//Heavilly inspired https://www.geeksforgeeks.org/binary-search-tree-set-2-delete/
node_t* removeNode(node_t* root, int val){
	numberOfNodes--;
	return removeNodeContinue(root, val);
}

node_t* removeNodeContinue(node_t* root, int val){
	node_t* temp;
	//printf("%i\n", val);
	//printf("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh\n");
	//print2D(root);
	//printf("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh\n");

	val = abs(val);

	if(root == NULL) return root;

	if(val < root->val){
		root->left = removeNodeContinue(root->left, val);
	} else if (val > root->val){
		root->right = removeNodeContinue(root->right, val);
	}
	if(val == root->val){
		//printf("++++++++++++++++++++++++\n");
		//print2D(root);
		//printf("ROOT->LEFT%i\n", root->left->val);
		//printf("++++++++++++++++++++++++\n");
		if(root->left == NULL){
			//printf("HERE1\n");
			temp = root->right;
			free(root);
			return temp;
		} else if(root->right == NULL){
			//print2D(root);
			//printf("HERE2\n");
			temp = root->left;
			free(root);
			return temp;
		}
		temp = maxValueNodeOnLeft(root->left);
		//printf("TEMP->val %i\n", temp->val);

		root->val = temp->val;
		//printf("VAL: %i\n", root->left->val);
		//print2D(root);
		//printf("++++++++++++++++++++++++\n");
		root->left = removeNodeContinue(root->left, root->val);
	}
	return root;
}
node_t* maxValueNodeOnLeft(node_t* root){
	node_t* current = root;

	while(current != NULL && current->right != NULL){
		current = current->right;
	}
	return current;
}
node_t* consolidation(node_t* root){
	int* nodes = treeToField(root);
/*	printf("I AM IN CONSOLIDATION PRINTING NODES\n");
	//printf("HERE IS MY HERO %i\n", nodes[numberOfNodes]);
	for (int i = 0; i < numberOfNodes; ++i)
	{
		printf("%i ", nodes[i]);
	}
	printf("\n");
*/
	int temp = numberOfNodes;
	freeTree(root);

	root = NULL;
	/*for (int i = 0; i < numberOfNodes; ++i)
	{
		printf("%i ", nodes[i]);
	}
	printf("\n");*/
	root = recu(root, temp, nodes);

	numberOfConsolidations++;
	free(nodes);
	return root;
}
node_t* recu(node_t* root, int length, int* nodes){
	//printf("LENGHT: %i\n", length);
	if(length == 1){
		root = newNode(nodes[0]);
		return root;
	}
	if(length == 2){
		root = newNode(nodes[1]);
		root->left = newNode(nodes[0]);
		return root;
	}
	int headPointer = 0;
	int tailPointer = length-1;
	int i = 1;
	while(1){
		if(headPointer + i >=  tailPointer){
			while(headPointer < tailPointer - 1){
				headPointer++;
			}
			//printf("HERE\n");
			root = newNode(nodes[tailPointer]);
			break;
		} else {
			headPointer = headPointer+i;
		}
		if(tailPointer - i <= headPointer){
			while(headPointer!=tailPointer){
				tailPointer--;
			}
			//root = newNode(nodes[tailPointer]);
			//break;
		} else {
			tailPointer -= i;
		}
		i = i<<1;
	}
	root->left = recu(root->left, tailPointer, nodes);
	root->right = recu(root->right, length-tailPointer-1, nodes+tailPointer+1);

	return root;
}

int* treeToField(node_t* root){
	int* ret = malloc(numberOfNodes*sizeof(int)*2);
	int* pointer = calloc(1,sizeof(int));
	treeToFieldContinue(root, pointer, ret);
	numberOfNodes = (*pointer);
	free(pointer);
	return ret;
}
void treeToFieldContinue(node_t* root,int* pointer, int* field){
	if(root!=NULL){
		treeToFieldContinue(root->left,pointer, field);
		//printf("VAL: %i POINTER: %i\n", root->val, *pointer);
		field[(*pointer)++] = root->val;
		//printf("field[pointer]: %i\n", field[*pointer-1]);
		treeToFieldContinue(root->right,pointer, field);
	}
}

int calculateDepth(node_t* root){
	if(root == NULL) return 0;
	int leftDepth = calculateDepth(root->left);
	int rightDepth = calculateDepth(root->right);

	return rightDepth > leftDepth ? rightDepth+1 : leftDepth+1;
}


void freeTree(node_t* root){
	numberOfNodes = 0;
	if(root->left != NULL){
		freeTree(root->left);
	}
	if (root->right != NULL){
		freeTree(root->right);
	}
	free(root);
}