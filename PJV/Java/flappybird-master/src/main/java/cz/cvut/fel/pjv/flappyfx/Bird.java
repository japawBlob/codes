/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.flappyfx;

/**
 *
 * @author LaSer
 */
public class Bird extends Sprite {
  private double speedY;

  public Bird(SpriteId id, String imageName) {
    super(id, imageName);
    speedY = 0;
  }

  public double getSpeedY() {
    return speedY;
  }

  public void increaseSpeedY(double speedY) {
    this.speedY += speedY;
  }
  
  public void invertSpeedY() {
    speedY = -speedY;
  }

  public void setSpeedY(double speed) {
    speedY = speed;
  }
}
