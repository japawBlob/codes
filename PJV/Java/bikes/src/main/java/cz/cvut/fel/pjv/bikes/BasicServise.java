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
public class BasicServise {
    public void accept(Bicycle bike){
        System.out.println("fixing Bicycle.");
    }
    public void accept(MountainBike bike){
        System.out.println("can`t fix MountainBike.");
    }
    public void accept(RoadBike bike){
        System.out.println("can`t fix RoadBike.");
    }
}
