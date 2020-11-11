/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import javafx.scene.image.Image;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundImage;
import javafx.scene.layout.BackgroundPosition;
import javafx.scene.layout.BackgroundRepeat;
import javafx.scene.layout.BackgroundSize;

/**
 *
 * @author LaSer
 */
public enum CellState {
  EMPTY("water", 1),
  CARRIER("carrier", 5),
  BATTLESHIP("battleship", 4),
  CRUISER("cruiser", 3),
  SUBMARINE("submarine", 3),
  DESTROYER("destroyer", 2),
  HIT("hit", 1),
  MISS("miss", 1);
  
  private final String imageName;
  private final int cellCount;
  private final Background background;

  private CellState(String imageName, int cellCount) {
    this.imageName = imageName;
    this.cellCount = cellCount;
    this.background = createBackground();
  }

  public Background getBackground() {
    return background;
  }

  public int getCellCount() {
    return cellCount;
  }
  
  private Background createBackground() {
    return new Background(
      new BackgroundImage(
        new Image("gfx/" + imageName + ".png"),
        BackgroundRepeat.NO_REPEAT,
        BackgroundRepeat.NO_REPEAT,
        BackgroundPosition.CENTER,
        BackgroundSize.DEFAULT
      )
    );
  }
}
