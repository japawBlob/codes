/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.cviceni2;

import java.util.Scanner;


/**
 *
 * @author Kolombo
 */
public class pole {
    static void print_reverse (int pole[]){
        Scanner sc = new Scanner(System.in);
        int counter = 0;
        while(counter<pole.length){
            int input = sc.nextInt();
            pole[counter] = input;
            counter++;
        }
        
        for(int i = pole.length-1; i >= 0; i--){
            System.out.println(pole[i]);
        }
    }
}
