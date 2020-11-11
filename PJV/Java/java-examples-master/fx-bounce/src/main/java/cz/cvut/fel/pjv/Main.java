/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import javafx.application.Application;
import javafx.stage.Stage;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Main extends Application {
  Controller controller;
  
  @Override
  public void start(Stage primaryStage) {
    
    Model model = new Model();

    // Solution A. drawing circle on canvas
    //ViewCanvas view = new ViewCanvas(model);

    // Solution B. using Circle shape in scene graph
    ViewShape view = new ViewShape(model);

    model.addObserver(view);
    
    controller = new Controller(model);
    controller.start();
    
    primaryStage.setScene(view.getScene());
    primaryStage.setTitle("Bounce");
    primaryStage.show();
  }

  @Override
  public void stop() {
    controller.stop();
  }
  
  public static void main(String[] args) {
    launch(args);
  }
}
