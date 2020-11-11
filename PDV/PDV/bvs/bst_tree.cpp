#include <functional>
#include "bst_tree.h"
#include <atomic>

void bst_tree::insert(long long data) {
    std::atomic<node *> new_node = {new node(data)};

    node* blob = root;

    node* nullForCompare = NULL;

    if(root.compare_exchange_strong(nullForCompare, new_node)) return;

    while(true){
    	//nullForCompare = NULL;
    	if(blob->data < data){
    		if(blob->right != NULL){
    			blob = blob->right;
    			//printf("tady jsem 1\n");
    		} else if(blob->right.compare_exchange_strong(nullForCompare, new_node)){
    			//printf("tady jsem 2\n");
    			break;
    		} 
    	} else {
    		if(blob->left != NULL){
    			blob = blob->left;
    			//printf("jsem tu 3\n");
    		} else if(blob->left.compare_exchange_strong(nullForCompare, new_node)){
    			//printf("jsem tu 4\n");
    			break;
    		}
    	}
    }
    // Naimplementujte zde vlaknove-bezpecne vlozeni do binarniho vyhledavaciho stromu
}

bst_tree::~bst_tree() {
    // Rekurzivni funkce pro pruchod stromu a dealokaci pameti prirazene jednotlivym
    // uzlum
    std::function<void(node*)> cleanup = [&](node * n) {
        if(n != nullptr) {
            cleanup(n->left);
            cleanup(n->right);

            delete n;
        }
    };
    cleanup(root);
}
