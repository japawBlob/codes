/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.data;

import cz.cvut.fel.pjv.cars.model.Car;

/**
 *
 * @author Kolombo
 */
public class RaceResult implements Comparable<RaceResult> {
    private final Car car;
    private final TimeSpan resultTime;

    public RaceResult(Car car, TimeSpan resultTime) {
        this.car = car;
        this.resultTime = resultTime;
    }

    public Car getCar() {
        return car;
    }

    public TimeSpan getResultTime() {
        return resultTime;
    }

    

    @Override
    public int compareTo(RaceResult o) {
        int myTime = resultTime.getTotalSecond();
        int itsTime = o.resultTime.getTotalSecond();
        
        return myTime-itsTime;
    }

    @Override
    public String toString() {
        return "RaceResult{" + "car=" + car + ", resultTime=" + resultTime + '}';
    }
}
