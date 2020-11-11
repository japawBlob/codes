/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.beans.PropertyChangeSupport;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Model {

  private double centerX = 120;
  private double centerY = 100;
  private double speedX = 5;
  private double speedY = 8;
  private double radius = 30;
  private double stageWidth = 500;
  private double stageHeight = 400;
  
  PropertyChangeSupport propChangeSupport = new PropertyChangeSupport(this);
  
    // A.
//  public void addObserver(ViewCanvas view) {
    // B.
  public void addObserver(ViewShape view) {
    propChangeSupport.addPropertyChangeListener(view);
  }
  
  public double getCenterX() {
    return centerX;
  }

  public void setCenterX(double centerX) {
    propChangeSupport.firePropertyChange("centerX", this.centerX, centerX);
    this.centerX = centerX;
  }

  public double getCenterY() {
    return centerY;
  }

  public void setCenterY(double centerY) {
    propChangeSupport.firePropertyChange("centerY", this.centerY, centerY);
    this.centerY = centerY;
  }

  public double getSpeedX() {
    return speedX;
  }

  public void setSpeedX(double speedX) {
    this.speedX = speedX;
  }

  public double getSpeedY() {
    return speedY;
  }

  public void setSpeedY(double speedY) {
    this.speedY = speedY;
  }

  public double getRadius() {
    return radius;
  }

  public double getStageWidth() {
    return stageWidth;
  }

  public double getStageHeight() {
    return stageHeight;
  }
}
