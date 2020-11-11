/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.bikes;

/**
 *
 * @author Kolombo
 */
public enum Color {
    RED(42), GREEN(31), BLUE(18);
    
    public int code;
    
    private Color(int code){
        this.code = code;
    }
}
