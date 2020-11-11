/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.utils;

/**
 *
 * @author Kolombo
 */
public class ArrayUtil {

    private ArrayUtil() {
    }
    
    public void sort(Comparable[] array){
        for(int i = 0; i < array.length; i++){
            for(int j = 0; j < array.length-1-i; j++){
                if(array[j].compareTo(array[j+1])>0){
                    Comparable temp = array[j];
                    array[j] = array[j+1];
                    array[j+1] = temp;
                }
            }
        }
    }
}
