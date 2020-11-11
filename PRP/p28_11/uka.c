
typedef struct node {
	int value;
	struct node *next;
} node_t;

node_t* allocate(int n);
node_t* push(int v, node_t *head);

int main(){
	node_t *head = NULL;

	int ret =0;

	head = allocate(1);	
	head = push(2, head);
	head = push(3, head);

	printf("head: %d head->next: %d\n", head->value, head->next->value);
	
	node_t *cur = head;
	while(cur){
		printf("cur: %d\n", cur->value);
		cur = cur->next;
	}

	return 0;


}

node_t *allocate(int n){
	node_t *node = malloc(sizeof(node_t));
	if(!node){
		exit(-1);
	}

	node->value = n;
	node->next = NULL;
	return node;
}

node_t *push(int v, node_t *head){
	node_t *node = allovate(v);
	node->next = head;
	return node;
}
