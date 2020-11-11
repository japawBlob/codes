/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.data;

import cz.cvut.fel.pjv.cars.model.Car;


class CarListNode{
    private CarListNode next;
    private Car car;

    public CarListNode(Car car) {
        this.car = car;
    }

    public void setNext(CarListNode next) {
        this.next = next;
    }

    public Car getCar() {
        return car;
    }

    public CarListNode getNext() {
        return next;
    }
    
    
    
}


public class CarLinkedList {
    private CarListNode head;
    private int count = 0;
    
    public void push(Car car){
        CarListNode blob = new CarListNode(car);
        blob.setNext(head);
        head = blob;
        count++;
    }
    
    public Car[] toArray(){
        Car[] cars = new Car[count];
        CarListNode actNode = head;
        for (int i = 0; i < cars.length; i++) {
            cars[i] = actNode.getCar();
            actNode = actNode.getNext();
        }
        return cars;
    }
}
