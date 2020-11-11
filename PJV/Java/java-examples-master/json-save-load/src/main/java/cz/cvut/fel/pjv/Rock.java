/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Rock extends Sprite {
  private boolean isObstacle = true;
  private boolean canBeDestroyed = false;

  public Rock() { // Jackson needs this
  }

  public Rock(int x, int y, int width, int height, boolean isObstacle, boolean canBeDestroyed) {
    super(x, y, width, height);
    this.isObstacle = isObstacle;
    this.canBeDestroyed = canBeDestroyed;
  }

  public boolean isIsObstacle() {
    return isObstacle;
  }

  public boolean isCanBeDestroyed() {
    return canBeDestroyed;
  }

  @Override
  public String toString() {
    return "Rock: " + "x=" + x + ", y=" + y + ", width=" + width + ", height=" + height + ", isObstacle=" + isObstacle + ", canBeDestroyed=" + canBeDestroyed;
  }
}
