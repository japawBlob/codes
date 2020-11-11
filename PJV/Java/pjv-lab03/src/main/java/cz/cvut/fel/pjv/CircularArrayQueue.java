package cz.cvut.fel.pjv;

/**
 * Implementation of the {@link Queue} backed by fixed size array.
 */
public class CircularArrayQueue implements Queue {
    
    int capacity;
    int head;
    int tail;
    int numberOfElements;
    String[] elements;
    
    
    /**
     * Creates the queue with capacity set to the value of 5.
     */
    public CircularArrayQueue() {
        this.capacity = 5;
        this.head = 0;
        this.tail = 0;
        this.numberOfElements = 0;
        this.elements = new String[capacity];
        
        
    }


    /**
     * Creates the queue with given {@code capacity}. The capacity represents maximal number of elements that the
     * queue is able to store.
     * @param capacity of the queue
     */
    public CircularArrayQueue(int capacity) {
        this.capacity = capacity;
        this.head = 0;
        this.tail = 0;
        this.numberOfElements = 0;
        this.elements = new String[capacity];
        
    }

    @Override
    public int size() {
        return numberOfElements;
    }

    @Override
    public boolean isEmpty() {
        if(numberOfElements == 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean isFull() {
        if(capacity == numberOfElements){
            return true;
        }
        return false;
    }

    @Override
    public boolean enqueue(String obj) {
        if(isFull()){
            return false; 
        }
        elements[tail] = obj;
        tail++;
        if(tail==capacity){
            tail -= capacity;
        }
        numberOfElements++;
        return true;
    }

    @Override
    public String dequeue() {
        String ret = elements[head];
        elements[head] = null;
        head++;
        if(head==capacity){
            head -= capacity;
        }
        numberOfElements--;
        return ret;
    }

    @Override
    public void printAllElements() {
        for(int i = 0; i<capacity; i++){
            int temp=i+head;
            if(temp >= capacity){
                temp-=capacity;
            }
            if(elements[temp] == null){
                break;
            }
            System.out.println(elements[temp]);
        }
    }
}
