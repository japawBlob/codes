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


public class Main {

    public static void main(String[] args) {
        Singleton mySingleton = Singleton.getInstance();
        
        //mySingleton.doIt();
        
        DogFactory dogFactory = new DogFactory();
        dogFactory.createDog("small").bark();
    }
    
}
