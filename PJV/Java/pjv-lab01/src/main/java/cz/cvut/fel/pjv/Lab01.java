/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

/**
 *
 * @author martin
 */
public class Lab01 {
    public static void main(String[] args) {
        
        Lab01Solution lab = new Lab01Solution();
        lab.start(args);
        
        System.out.println(lab.obvod(Double.parseDouble(args[0])));
    }
    
}
