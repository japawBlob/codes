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
public class LazySingleton {
    private static volatile LazySingleton singleton = null;
    
    private LazySingleton(){    
    }
    
    public static LazySingleton getInstance(){
        if (singleton == null){
            synchronized(LazySingleton.class){
                if(singleton == null){
                    singleton = new LazySingleton();
                }
            }
        }
        return singleton;
    }
    
    public void doIt(){
        System.out.println("lokomotiva");
    }
}
/*
deadlock
raise condition
*/