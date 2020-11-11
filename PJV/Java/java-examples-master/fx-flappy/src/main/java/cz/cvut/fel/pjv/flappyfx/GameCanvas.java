/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.flappyfx;

import java.util.Map;
import javafx.scene.Parent;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.geometry.VPos;
import javafx.scene.text.TextAlignment;

import static cz.cvut.fel.pjv.flappyfx.Util.*;

/**
 *
 * @author LaSer
 */
public class GameCanvas extends Canvas {
  private final SpriteManager spriteManager;
  private final Map<String, Integer> gameVariables;
 
  public GameCanvas(SpriteManager spriteManager, Map gameVariables) {
    this.spriteManager = spriteManager;
    this.gameVariables = gameVariables;
    // Redraw canvas when size changes
    widthProperty().addListener(evt -> redraw());
    heightProperty().addListener(evt -> redraw());
    
  }

  public void fixAspectRatio(double aspectRatio) {
    Parent parent = getParent();
    if (parent instanceof Pane) {
      // Bind canvas size to parent Pane width...
      widthProperty().bind(((Pane)getParent()).widthProperty());
      // ...and keep its aspect ratio while resizing
      heightProperty().bind(((Pane)getParent()).widthProperty().multiply(aspectRatio));
    }
  }

  public void redraw() {
    GraphicsContext gc = getGraphicsContext2D();
    renderBackground(gc);
    for (Sprite sprite : spriteManager.getSprites()) {
      if (gameVariables.get("Playing") == 1 || sprite.id != SpriteId.BIRD) {
        sprite.render(gc);
      }
    }
    renderScore(gc);
  }
 
  private void renderBackground(GraphicsContext gc) {
    double width = getWidth();
    double height = getHeight();
    gc.clearRect(0, 0, width, height);
    gc.setFill(SKY_BLUE);
    gc.fillRect(0, 0, width, HORIZON_POS);
    gc.setFill(Color.BLACK);
    gc.fillRect(0, HORIZON_POS, width, HORIZON_POS + PIXEL_SIZE);
    gc.setFill(GROUND_BROWN);
    gc.fillRect(0, HORIZON_POS + PIXEL_SIZE, width, height);
  }

  private void renderScore(GraphicsContext gc) {
    String infoText = gameVariables.get("Playing") == 1 ?
      "Your Score: " + gameVariables.get("Score") :
      "Press the SPACE key to play.";
    gc.setFont(new Font(Font.getDefault().getName(), 50));
    gc.setTextAlign(TextAlignment.CENTER);
    gc.setTextBaseline(VPos.CENTER);
    gc.fillText(infoText, INIT_APP_WIDTH / 2, TEXT_Y_POSITION, INIT_APP_WIDTH);
  }
  
  @Override
  public boolean isResizable() {
    return true;
  }

  @Override
  public double prefWidth(double height) {
    return getWidth();
  }

  @Override
  public double prefHeight(double width) {
    return getHeight();
  }
}
