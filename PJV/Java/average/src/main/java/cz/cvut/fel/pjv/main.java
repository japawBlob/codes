/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.util.Scanner;

/**
 *
 * @author Kolombo
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);
        double first = sc.nextDouble();
        double second = sc.nextDouble();
        
        double average = (first+second)/2;
        
        System.out.println("Average value of two inputs is " + average);
        
        System.out.println("Ahoj");
        
    }
    
}
