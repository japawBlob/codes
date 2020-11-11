/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.cars;

import cz.cvut.fel.pjv.cars.model.Car;
import cz.cvut.fel.pjv.data.CarLinkedList;
import cz.cvut.fel.pjv.data.RaceResult;
import cz.cvut.fel.pjv.utils.ArrayUtil;

/**
 *
 * @author Kolombo
 */
public class Race {
    private int length;
    private CarLinkedList participants = new CarLinkedList();
    private boolean alreadyRunning = false;
    private RaceResult results = new RaceResult();
    
    public Race(int length){
        this.lenght = length;
    }
    public boolean arrRacingCar(Car car){
        if(!alreadyRunning){
            participants.push(car);
            return true;
        }
        return false;
    }
    public Car getWinner(){
        getRaceResults();
    }
    pulic TimeSpan getWinnerTime(){
        getRaceResults();
    }
    
    
    private void getRaceResults(){
        if(!alreadyRunning){
            alreadyRunning = true;
            Car[] cars = participants.toArray();
            results = new RaceResult(cars.length);
            for (int i = 0; i < cars.length; i++) {
                results[i] = new RaceResult(cars[i], new TimeSpan(length / cars[i]))
            }
            ArrayUtil.sort(results);
            
        }
    }

    @Override
    public String toString() {
        if(!alreadyRunning){
            return participants.toString();
        } else {
            
        }
        
    }
}
