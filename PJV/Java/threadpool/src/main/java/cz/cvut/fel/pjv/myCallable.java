/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.util.concurrent.Callable;

/**
 *
 * @author Kolombo
 */
public class myCallable implements Callable<Integer>{

    private final String id;

    public myCallable(String id) {
        this.id = id;
    }

    @Override
    public Integer call() throws Exception {
        int sum = 0;
        System.out.println(id + " started");
        for (int i = 1; i <= 10; i++) {
            System.out.println(id + " counts " + i);
            sum += i;
            try {
                Thread.sleep(50);
            } catch (InterruptedException ex) {
                System.out.println(id + "'s sleep interupted");
            }
        }
        System.out.println(id + " finished");
        
        return sum;
    }
    
    
}
