/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
class GameBoard {
  public List<Rock> rocks = new ArrayList();
  public List<Monster> monsters = new ArrayList();

  public GameBoard() {
  }
  
  public void addRock(int x, int y, int width, int height) {
    rocks.add(new Rock(x, y, width, height, true, false));
  }

  public void addMonster(
    int x, int y, int width, int height,
    int armor, int health, int speed,
    int smallBulletCount, int bigBulletCount, int fireballCount
  ) {
    monsters.add(new Monster(
      x, y, width, height,
      armor, health, speed,
      smallBulletCount, bigBulletCount, fireballCount
    ));
  }
  
  @Override
  public String toString() {
    return "GameBoard{" + "rocks=" + rocks + ", monsters=" + monsters + '}';
  }
}
