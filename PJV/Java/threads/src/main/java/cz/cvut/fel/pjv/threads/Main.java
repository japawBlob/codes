/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.threads;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kolombo
 */
public class Main {
    public static void main(String[] args) {
        Application app = new Application();
        Thread thread1 = new Thread(app);
        thread1.start();
        Thread thread2 = new Thread(app);
        thread2.start();
        
        
        System.out.println("main finished");
        /*
        new Thread (new Runnable(){
            @Override
            public void run() {
                for (int i = 0; i < 10; i++) {
                    System.out.println(i);
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Application.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            
        });
        */
    }
    
}
