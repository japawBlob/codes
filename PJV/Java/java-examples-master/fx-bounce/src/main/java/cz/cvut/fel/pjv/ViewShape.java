/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import javafx.scene.Scene;
import javafx.scene.image.ImageView;
import javafx.scene.layout.Pane;
import javafx.scene.shape.Circle;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class ViewShape implements PropertyChangeListener {
  private final Scene scene;
  private final Model model;
  Circle circle;        // circle
  ImageView imageView;  // image

  public ViewShape(Model model) {
    this.model = model;

    // 1. use Circle shape...
     circle = new Circle(model.getCenterX(), model.getCenterY(), model.getRadius());
     Pane root = new Pane(circle);

    // 2. ...or an ImageView
//    imageView = new ImageView("ball.png");
//    Pane root = new Pane(imageView);

    scene = new Scene(root, model.getStageWidth(), model.getStageHeight());
  }

  public Scene getScene() {
    return scene;
  }
  
  @Override
  public void propertyChange(PropertyChangeEvent evt) {
    // 1. use Circle shape...
    circle.setCenterX(model.getCenterX());
    circle.setCenterY(model.getCenterY());

    // 2. ...or an ImageView
//    imageView.setX(model.getCenterX() - model.getRadius());
//    imageView.setY(model.getCenterY() - model.getRadius());
  }
}
