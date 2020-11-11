#include <stdio.h>

int parent_idx(int ind){
	return (ind-1)/2;
}
int left_child_idx(int ind){
	return 2*ind+1;
}
int right_child_idx(int ind){
	return 2*ind+2;
}

void bubble_up(int* heap, int idx){
	if(heap[parent_idx(idx)] < heap[idx]){
		int blob = heap[idx];
		heap[idx] = heap[parent_idx(idx)];
		heap[parent_idx(idx)] = blob;
		if(idx != 0){
			bubble_up(heap, parent_idx(idx));
		}
	}
}

int insert (int* heap, int last_idx, int new_priority){
	if(last_idx + 1 == 30){
		last_idx-=1;
	}
	heap[last_idx+1] = new_priority;
	bubble_up(heap, last_idx+1);
	return last_idx+1;
}

void print_heap (int *heap, int last_index){
	for(int i = 0; i<= last_index; i++){
		if(i != 0){
			printf(", ");
		}
		printf("%i", heap[i]);
	}
	printf("\n");
} 

void heapify(int* heap, int last_ind, int idx){
	if(heap[idx] < heap[left_child_idx(idx)]{
		int blob = heap[idx];
		heap[idx] = heap[left_child_idx(idx)]
		heap[left_child_idx(idx)] = blob;
		if(left_child_idx(left_child_idx(idx))
		heapify(heap, last_ind, left_child_idx(idx)); 
		
	} else if(heap[idx] < heap[right_child_idx(idx)]{
		int blob = heap[idx];
		heap[idx] = heap[right_child_idx(idx)]
		heap[right_child_idx(idx)] = blob;
		
		heapify(heap, last_ind, right_child(idx)); 
	}
}

int del_max(int *heap, int last_ind){
	heap[0] = heap[last_ind];
	last_ind--;
	heapify(heap, last_ind, idx)
	return last_ind;
}

int main(){
	int heap[30];
	int last_idx = -1;
	
	last_idx = insert(heap, last_idx, 30);
	print_heap(heap, last_idx);
	last_idx = insert(heap, last_idx, 29);
	print_heap(heap, last_idx);
	last_idx = insert(heap, last_idx, 7);
	print_heap(heap, last_idx);
	last_idx = insert(heap, last_idx, 14);
	print_heap(heap, last_idx);
	last_idx = insert(heap, last_idx, 18);
	print_heap(heap, last_idx);
	last_idx = insert(heap, last_idx, 30);
	print_heap(heap, last_idx);
	
	del_max(heap, last_idx);
	del_max(heap, last_idx);
	
	
	
	return 0;
}
