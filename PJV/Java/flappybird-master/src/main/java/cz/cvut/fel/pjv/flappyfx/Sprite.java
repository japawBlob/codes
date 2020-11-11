/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.flappyfx;

import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.Image;

import static cz.cvut.fel.pjv.flappyfx.Util.*;
import javafx.geometry.Rectangle2D;

/**
 *
 * @author LaSer
 */
public class Sprite {
  protected SpriteId id;
  protected double x, y , width, height;
  protected Image image;

  public Sprite(SpriteId id, String imageName) {
    this.id = id;
    image = new Image(GFX_DIR + imageName);
    width = image.getWidth();
    height = image.getHeight();
  }
  
  public SpriteId getId() {
    return id;
  }

  public void render(GraphicsContext gc) {
    gc.drawImage(image, x, y);
  }
  
  public final void setPosition(double x, double y) {
    this.x = x;
    this.y = y;
  }

  public void increaseX(double x) {
    this.x += x;
  }

  public void increaseY(double y) {
    this.y += y;
  }

  public double getX() {
    return x;
  }
  
  public double getY() {
    return y;
  }

  public void setX(double x) {
    this.x = x;
  }

  public void setY(double y) {
    this.y = y;
  }
  
  public double getWidth() {
    return width;
  }

  public void setWidth(double width) {
    this.width = width;
  }

  public double getHeight() {
    return height;
  }

  public void setHeight(double height) {
    this.height = height;
  }
  
  public Rectangle2D getBounds() {
    return new Rectangle2D(x, y, width, height);
  }
}
