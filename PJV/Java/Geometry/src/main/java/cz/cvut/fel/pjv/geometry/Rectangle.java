/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cz.cvut.fel.pjv.geometry;
/**
 *
 * @author Kolombo
 */
public class Rectangle extends Shape2d{
    private double a;
    private double b;

    public Rectangle(double a, double b) {
        this.a = a;
        this.b = b;
    }

    public double getA() {
        return a;
    }
    public double getB() {
        return b;
    }

    public void setA(double a) {
        this.a = a;
    }
    public void setB(double b) {
        this.b = b;
    }
    
    @Override
    public double getArea(){
        return a*b;
    }
    
    @Override
    public double getCircumference(){
        return 2*(a+b);
    }
    
    
    
}
