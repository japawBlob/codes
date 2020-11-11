/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.bikes;

/**
 *
 * @author Kolombo
 */
public class RoadBike extends Bicycle{
    int tireWidth;
    
    public RoadBike(int cadence, int speed, int gear, Color color, int tireWidth) {
        super(cadence, speed, gear, color);
        this.tireWidth = tireWidth;
    } 
    
    @Override
    public void visit(BasicServise bs){
        bs.accept(this);
    }
    
    @Override
    public void printDescription(){
        System.out.println("Bike is in gear " + gear + 
                " with a cadence of " + cadence + 
                " and travelling at a speed of " + speed + 
                " tire width:" + tireWidth +
                ".");
    }
}
    

