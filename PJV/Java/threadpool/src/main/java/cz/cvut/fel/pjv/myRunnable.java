/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.util.logging.Level;
import java.util.logging.Logger;



public class myRunnable implements Runnable{
    
    private final String id;

    public myRunnable(String id) {
        this.id = id;
    }

    @Override
    public void run() {
        System.out.println(id + " started");
        for (int i = 1; i <= 10; i++) {
            System.out.println(id + " counts " + i);
            try {
                Thread.sleep(50);
            } catch (InterruptedException ex) {
                System.out.println(id + "'s sleep interupted");
            }
        }
        System.out.println(id + " finished");
    }
    
}
