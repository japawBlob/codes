/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseButton;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.RadialGradient;
import javafx.stage.Stage;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class ViewController extends Application implements PropertyChangeListener {
  
  private Model worldMap;
  private Canvas canvas;
  private final int CELL_SIZE = 10;
  private final String MAP_FILE_NAME = "world-map.png";
  
  @Override
  public void start(Stage stage) {
    Pane root = new StackPane();
    Scene scene = new Scene(root);
    Image mapImage = new Image(MAP_FILE_NAME);
    ImageView imageView = new ImageView(mapImage);
    canvas = new Canvas(mapImage.getWidth(), mapImage.getHeight());

    worldMap = new Model(this);
    canvas.setOnMouseClicked((event) -> {
      int x = (int) event.getX() / CELL_SIZE;
      int y = (int) event.getY() / CELL_SIZE;
      worldMap.clicked(x, y, event.getButton() == MouseButton.PRIMARY);
    });

    root.getChildren().addAll(imageView, canvas);
    stage.setTitle("World map epidemic mouse click demo");
    stage.setScene(scene);
    stage.show();
  }

  @Override
  public void propertyChange(PropertyChangeEvent evt) {
    GraphicsContext gc = canvas.getGraphicsContext2D();
    // QUICK AND DIRTY EXAMPLE:
    PopulationCell pc = (PopulationCell) evt.getNewValue();
    int circleRadius = CELL_SIZE * pc.getSickCount() / 100;
    RadialGradient grad = RadialGradient.valueOf("center 50% 50%, radius 50%, 0xff0000ff, 0xff000000");
    gc.setFill(grad);
    gc.fillOval(
      (pc.getX() + 0.5) * CELL_SIZE - circleRadius,
      (pc.getY() + 0.5) * CELL_SIZE - circleRadius,
      circleRadius * 2,
      circleRadius * 2
    );
  }
    
  public static void main(String[] args) {
    launch(args);
  }
}
