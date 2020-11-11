/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Sprite {
  protected int x;
  protected int y;
  protected int width;
  protected int height;

  public Sprite() { // Jackson needs this
  }

  public Sprite(int x, int y, int width, int height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public int getWidth() {
    return width;
  }

  public int getHeight() {
    return height;
  }

  @Override
  public String toString() {
    return "Sprite: " + "x=" + x + ", y=" + y + ", width=" + width + ", height=" + height;
  }
}
