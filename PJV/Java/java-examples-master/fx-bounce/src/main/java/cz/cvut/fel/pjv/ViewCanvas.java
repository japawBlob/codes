/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.Image;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class ViewCanvas implements PropertyChangeListener {
  private final Scene scene;
  private final Model model;
  private final Canvas canvas;
  private final GraphicsContext gc;
  private final Image image; // image

  public ViewCanvas(Model model) {
    this.model = model;
    canvas = new Canvas();
    canvas.setWidth(model.getStageWidth());
    canvas.setHeight(model.getStageHeight());
    gc = canvas.getGraphicsContext2D();
    Pane root = new Pane(canvas);

    image = new Image("ball.png"); // image
      
    scene = new Scene(root, model.getStageWidth(), model.getStageHeight());
  }

  public Scene getScene() {
    return scene;
  }
  
  @Override
  public void propertyChange(PropertyChangeEvent evt) {
    gc.setFill(Color.LIGHTGRAY);
    gc.fillRect(0, 0, model.getStageWidth(), model.getStageHeight());

    double r = model.getRadius();

    // 1. draw a circle...
//    gc.setFill(Color.BLACK);
//    gc.fillOval(model.getCenterX() - r, model.getCenterY() - r, 2 * r, 2 * r);

    // 2. ...or use an image
    gc.drawImage(image, model.getCenterX() - r, model.getCenterY() - r, 2 * r, 2 * r);
  }
}
