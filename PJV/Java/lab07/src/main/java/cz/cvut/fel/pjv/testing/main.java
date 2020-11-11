/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.testing;

/**
 *
 * @author Kolombo
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Calculator c = new Calculator();
        
        System.out.println(c.average(new RandomDataSource(),10));
    }
    
}
