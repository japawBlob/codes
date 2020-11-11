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
public class Bicycle {
    protected int cadence;
    protected int speed;
    protected int gear;
    protected Color color;

    public Bicycle(int cadence, int speed, int gear, Color color) {
        this.cadence = cadence;
        this.speed = speed;
        this.gear = gear;
        this.color = color;
    }
    
    public void visit(BasicServise bs){
        bs.accept(this);
    }
    
    public void printDescription(){
        System.out.println("Bike is in gear " + gear + 
                " with a cadence of " + cadence + 
                " and travelling at a speed of " + speed + 
                " color code is " + color.code + 
                ".");
    }
}
