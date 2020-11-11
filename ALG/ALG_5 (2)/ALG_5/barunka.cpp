#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <iostream>
#include <cmath>
#define COUNT 6

using namespace std;

int number_of_operands = 0;
int all_consolidations = 0;
int loaded_num = 0;
int depth_after = 0;
int all_elements = 0;
int x = -1;


typedef struct node
{
    int value = 0;
    struct node *parent;
    struct node *right;
    struct node *left;
}node_t;


node_t* insert(node_t* node, int val);
node_t* makeNode(int val);
node_t* deeper(node_t* node, int* arr, int passed_elements);
void inorder(node_t* root, int* arr);
node_t* remove(int remove_me, node_t* node);
node_t* findBiggest(node_t* node);
node_t* consolidate(node_t* node);
int findDepth(node_t* root);
void freeNode(node_t* node);

void print2DUtil(node_t *root, int space)
{
    // Base case
    if (root == NULL)
        return;

    // Increase distance between levels
    space += COUNT;

    // Process right child first
    print2DUtil(root->right, space);

    // Print current node after space
    // count
    printf("\n");
    for (int i = COUNT; i < space; i++)
        printf(" ");
    printf("%d\n", root->value);

    // Process left child
    print2DUtil(root->left, space);
}

// Wrapper over print2DUtil()
void print2D(node_t *root)
{
    // Pass initial space count as 0
    print2DUtil(root, 0);
}

//----------------MAIN------------------//
int main(int argc, char const *argv[])
{
    node_t* root = NULL;

    scanf("%d", &number_of_operands);
    scanf("%d", &loaded_num);
    if(loaded_num > 0){

        root = insert(root, loaded_num);
    }
    for (int i = 0; i < number_of_operands -1; i++)
    {
        scanf("%d", &loaded_num);
        if(loaded_num > 0){
            //printf("%d\n", loaded_num);
            root = insert(root, loaded_num);
            print2D(root);
            printf("-----------------------------------\n");
            //printf("elements:%d\n", all_elements);
            //root = consolidate(root);
        }else
        {
            loaded_num = loaded_num * (-1);
            root = remove(loaded_num, root);
            print2D(root);
            printf("-----------------------------------\n");
            //printf("elements:%d\n", all_elements);
            //root = consolidate(root);
        }

    }
    print2D(root);
    //inorder(root);
    // printf("VEc size %d\n", v.size());
    /*for (int i = 0; i < v.size(); ++i)
    {
    	std::cout << v.at(i) << ' ';
    	    }*/
    depth_after = findDepth(root);
    depth_after -= 1;
    freeNode(root);
    printf("%d %d\n", all_consolidations, depth_after);
    return 0;
}

node_t* insert(node_t* node, int val){
    if (node == NULL){
        all_elements++;
        return makeNode(val);
    }
    if(loaded_num < node->value){
        node->left = insert(node->left, val);
    } else if (loaded_num > node->value)
    {
        node->right = insert(node->right, val);
    }

    return node;
}

node_t* makeNode(int val){
    node_t* temp = (node_t*)malloc(sizeof(node_t));
    temp->value = val;
    temp->left = NULL;
    temp->right = NULL;

    return temp;
}

void inorder(node_t *root, int* arr)
{
    if (root != NULL)
    {
        inorder(root->left, arr);
        //printf("%d ", root->value);
        x++;
        arr[x] = root->value;
        //if(root->parent == NULL){printf("ROOT\n");
       // }else{
            //printf("parent: %d\n", root->parent->value);
        //}
        inorder(root->right, arr);
    }
}

node_t* remove(int remove_me, node_t* node){
    if (node == NULL)return node;
    int cases = 0;
    if(remove_me < node->value){
        cases = 1;
    }
    if(remove_me > node->value){
        cases = 2;
    }
    switch(cases){
        case 1:
            //printf("LEVA SE ROZESERE\n");
            node->left = remove(remove_me, node->left);
            break;
        case 2:
            //printf("PRAVA SE ROZESERE\n");
            node->right = remove(remove_me, node->right);
            break;
        default:
           // printf("TUPROBLEM\n");
            if(node->left == NULL){
                node_t* temporary = node->right;
                free(node);
                all_elements--;
                return temporary;
            }
            else if(node->right == NULL){
                node_t* temporary = node->left;

                all_elements--;
                free(node);
                return temporary;
            }
            node_t*	temp1 = findBiggest(node->left);

            node->value = temp1->value;
            node->left = remove(temp1->value, node->left);
    }

    return node;
}

node_t* findBiggest(node_t* node){
    node_t* thisnode = node;
    //printf("NOTOK\n");
    //to the left left
    while(thisnode != NULL && thisnode->right != NULL){
        //printf("NOTOK2\n");
        thisnode = thisnode->right;
    }
    return thisnode;
}

int findDepth(node_t* root){
    if (root == NULL)return 0;
    int left = findDepth(root->left);
    int right = findDepth(root->right);
    if(right > left){
        return(right + 1);
    }
    else{
        return(left + 1);
    }

}

void freeNode(node_t* node){
    if(node == NULL)return;
    if(node->left != NULL)freeNode(node->left);
    if(node->right != NULL)freeNode(node->right);
    free(node);
}

node_t* consolidate(node_t* node){
    int depth = findDepth(node) - 1;
    //printf("2^%d < 2 * %d\n", depth, all_elements);
    if(pow(2, depth) <= 2* all_elements){
        //printf("OK\n");
        return node;
    }else{
       // printf("WILL CONSOLIDATE\n");
        int* arr = new int[all_elements];
        inorder(node, arr);
        x=-1;
        /*for (int i = 0; i < all_elements; ++i) {
            printf("%d ", arr[i]);
        }*/
        freeNode(node);
        node_t* root = NULL;
        root = deeper(root, arr, all_elements);
        all_consolidations++;
        delete [] arr;
        //print2D(root);
        return root;
    }
    //return node;
}

node_t* deeper(node_t* node, int* arr, int end){
    if(end == 1){
        node = makeNode(arr[0]);
       // print2D(node);
        return node;
    }

    if(end == 2){
        node = makeNode(arr[1]);
        node->left = makeNode(arr[0]);
    //    print2D(node);
        return node;
    }
    int i = 0;
    //j bude pocet elementu - 1
    int j = (end) - 1;
    int iterate = 1;
    while(1){
       // printf("I: %d J:%d", i, j);
        if(i + iterate >= j){
            while(i < j - 1){
                i++;
            }
            node = makeNode(arr[j]);
            break;
        }else{
            i += iterate;
        }
        if(j - iterate <= i){
            while(!(j==i)){
                j--;
            }
        }else{
            j -= iterate;
        }

        iterate = 2 * iterate;
    }
    node->left = deeper(node->left, arr, j);
    node->right = deeper(node->right, arr + j+1, end -j -1);
    //print2D(node);
    return node;

}