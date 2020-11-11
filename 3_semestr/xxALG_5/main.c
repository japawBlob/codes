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
void treeToFieldContinue(node_t* root,int* pointer, int* field);
int numberOfNodes = 0;

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
		val>0 ? addNode(root, val) : (root=removeNode(root, val));
		print2D(root);
		printf("Depth %i\n", calculateDepth(root));
		printf("2^Depth %i\n", 2<<(calculateDepth(root)-1));
		printf("numberOfNodes*2 %i\n", 2*numberOfNodes);
		if((2<<(calculateDepth(root)-1)) > 2*numberOfNodes){
			root = consolidation(root);
		}
		printf("-----------------------------------\n");
	}

	print2D(root);
	freeTree(root);

	return 0;
}

void addNode(node_t* root, int val){
	if(root->val == val) return ;
	if(root->val > val){
		root->left==NULL ? root->left=newNode(val) : addNode(root->left,val);
	}else {
		root->right==NULL ? root->right=newNode(val) : addNode(root->right,val);
	}
}

node_t* newNode(int val){
	numberOfNodes++;
	printf("numberOfNodes: %i\n", numberOfNodes);
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
	val = abs(val);

	if(root == NULL) return root;

	if(val < root->val){
		root->left = removeNodeContinue(root->left, val);
	} else if (val > root->val){
		root->right = removeNodeContinue(root->right, val);
	}
	if(val == root->val){
		if(root->left == NULL){
			temp = root->right;
			free(root);
			return temp;
		} else if(root->right == NULL){
			temp = root->left;
			free(root);
			return temp;
		}
		temp = maxValueNodeOnLeft(root->left);

		root->val = temp->val;
		root->left = removeNodeContinue(temp, temp->val);
	}
	return root;
}
node_t* maxValueNodeOnLeft(node_t* root){
	node_t* current = root;

	while(current && current->right != NULL){
		current = current->right;
	}
	return current;
}
node_t* consolidation(node_t* root){
	int* nodes = treeToField(root);
	printf("I AM IN CONSOLIDATION PRINTING NODES\n");
	for (int i = 0; i < numberOfNodes; ++i)
	{
		printf("%i ", nodes[i]);
	}
	printf("\n");
	free(nodes);
	return root;
}

int* treeToField(node_t* root){
	int* ret = malloc(numberOfNodes*sizeof(int));
	int* pointer = malloc(sizeof(int)); //NAHRAD POINTER GLOBALNI PROMENNOU A BUDE TO FUNGOVAT< ALE JA NECHCI...
	treeToFieldContinue(root, pointer, ret);
	return ret;
}
void treeToFieldContinue(node_t* root,int* pointer, int* field){
	if(root!=NULL){
		treeToFieldContinue(root->left,pointer, field);
		printf("VAL: %i POINTER: %i\n", root->val, *pointer);
		field[*pointer++] = root->val;
		printf("field[pointer]: %i\n", field[*pointer-1]);
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
	if(root->left != NULL){
		freeTree(root->left);
	}
	if (root->right != NULL){
		freeTree(root->right);
	}
	free(root);
}