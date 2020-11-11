/**
* Simple simulation implementation in JavaFX
* Created for B0B36PJV in b182
* 
* @author  ladislav.seredi@fel.cvut.cz
* @version 1.0
* @since   2019-03-22
*/
package cz.cvut.fel.pjv;

import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.stage.Stage;
import javafx.animation.AnimationTimer;

public class MainApp extends Application {
  AnimationTimer simulationTimer;
  private Simulation simulation;
  private Gui gui;
  
  @Override
  public void start(Stage stage) throws Exception {
    // view
    gui = new Gui(stage);
    gui.initCanvas(Simulation.WIDTH, Simulation.HEIGHT);
    // model + controller
    simulation = new Simulation();
    simulation.initCellsRandom();
    
    simulationTimer = new AnimationTimer() {
      private long lastUpdate = 0;
      @Override
      public void handle(long now) { // in nanoseconds
        if (now - lastUpdate >= 500_000_000) { // example: 500 milliseconds delay
          // render
          gui.renderGeneration(simulation.getDataToShow());
          // update
          simulation.calculateNextGen();
          lastUpdate = now;
        }
      }
    };
    simulationTimer.start();
  }

  @Override
  public void stop() throws Exception {
    super.stop();
    simulationTimer.stop();
  }

  public static void main(String[] args) {
      launch(args);
  }
}
