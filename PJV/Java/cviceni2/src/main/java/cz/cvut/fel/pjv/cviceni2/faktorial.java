/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.cviceni2;

/**
 *
 * @author Kolombo
 */
public class faktorial {
    static int invFactorial(int n){
        int fact = 1;
        while(n > 1){
                n = n/++fact;
        }
        if(n == 1){
            return fact;
        } else {
            return -1;
        }
    }
}
