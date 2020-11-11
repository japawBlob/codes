/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import javafx.animation.AnimationTimer;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Controller extends AnimationTimer {
  private final Model model;
  private double lastUpdate = 0;

  public Controller(Model model) {
    this.model = model;
  }

  @Override
  public void handle(long now) {
    if (now - lastUpdate > 16_000_000) { // approx. 60 fps
      lastUpdate = now;
      updateBall();
    }
  }

  private void updateBall() {
    double r = model.getRadius();
    double x = model.getCenterX();
    double y = model.getCenterY();
    if (x - r < 0 || x + r > model.getStageWidth()) {
      model.setSpeedX(-model.getSpeedX());
    }
    if (y - r < 0 || y + r > model.getStageHeight()) {
      model.setSpeedY(-model.getSpeedY());
    }
    model.setCenterX(model.getCenterX() + model.getSpeedX());
    model.setCenterY(model.getCenterY() + model.getSpeedY());
  }
}
