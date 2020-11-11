/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Monster extends Sprite {
  private int armor = 100;
  private int health = 80;
  private int speed = 8;
  private Map<String, Integer> ammo = new HashMap();

  public Monster() {
  }

  public Monster(
    int x, int y, int width, int height, int armor, int health, int speed,
    int smallBulletCount, int bigBulletCount, int fireballCount
  ) {
    super(x, y, width, height);
    this.armor = armor;
    this.health = health;
    this.speed = speed;
    ammo.put("small bullet", smallBulletCount);
    ammo.put("big bullet", bigBulletCount);
    ammo.put("fireball", fireballCount);
  }

  public int getArmor() {
    return armor;
  }

  public int getHealth() {
    return health;
  }

  public int getSpeed() {
    return speed;
  }

  public Map<String, Integer> getAmmo() {
    return ammo;
  }
  
  @Override
  public String toString() {
    return
      "Monster: " + "x=" + x + ", y=" + y + ", width=" + width + ", height=" + height +
      ", armor=" + armor + ", health=" + health +
      ", small bullet=" + ammo.get("small bullet") + ", big bullet" + ammo.get("big bullet") + ", fireball" + ammo.get("fireball");
  }
}
