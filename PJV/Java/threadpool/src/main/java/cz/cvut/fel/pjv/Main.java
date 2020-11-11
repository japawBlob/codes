/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kolombo
 */
public class Main {
    static final int THREAD_COUNT = 8;
    static final int TASK_COUNT = 30;
    
    public static void main(String[] args) {
//        ExecutorService executorService = Executors.newFixedThreadPool(THREAD_COUNT);
//        for (int i = 0; i < TASK_COUNT; i++) {
//            executorService.submit(new myRunnable("TASK_" + i));
//        }
        
        
        ExecutorService executorService = Executors.newFixedThreadPool(THREAD_COUNT);
        Future<Integer>[] results = new Future[TASK_COUNT]; 
        
        for (int i = 0; i < TASK_COUNT; i++) {
            results[i] = executorService.submit(new myCallable("TASK_" + i));
        }
        
        for (int i = 0; i < TASK_COUNT; i++) {
            try {
                System.out.println(
                        "Result " + i + " is done: " + results[i].isDone() +
                                " value: " + results[i].get() + " is done: "
                                + results[i].isDone());
            } catch (InterruptedException | ExecutionException ex) {
                System.out.println("Exception while getting result " + i);
            }
        }
        
        System.out.println("submitting finished");
        
        executorService.shutdown();
        
    }
    
}
