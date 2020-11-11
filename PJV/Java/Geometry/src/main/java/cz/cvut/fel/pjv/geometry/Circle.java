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
public class Circle extends Shape2d implements Positionale{
    private double radius;
    
    private Point center;
    
    public Circle(double radius) {
        this.radius = radius;
        center = new Point(0,0);
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }
    
    @Override
    public double getCircumference(){
        return 2*Math.PI*radius;
    }

    @Override
    public double getArea() {
       return radius*radius*Math.PI;
    }

    @Override
    public void setPosition(double x, double y) {
        center.setX(x);
        center.setY(y);
    }

    @Override
    public void setX(double x) {
        center.setX(x);
    }

    @Override
    public void setY(double y) {
        center.setY(y);
    }
    
}
