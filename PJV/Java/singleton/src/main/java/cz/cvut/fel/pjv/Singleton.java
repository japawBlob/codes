/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

/**
 *
 * @author Kolombo
 */
public class Singleton {
    private static final Singleton singleton = new Singleton();
    
    private Singleton(){    
    }
    
    public static Singleton getInstance(){
        return singleton;
    }
    
    public void doIt(){
        System.out.println("lokomotiva");
    }
}
