/* Inspired by :) but not copy-pasted from:
    https://gamedevelopment.tutsplus.com/tutorials/introduction-to-javafx-for-game-development--cms-23835
    https://carlfx.wordpress.com/2012/03/29/javafx-2-gametutorial-part-1/

    Other potentially interesting resources
    http://www.java-gaming.org/
    https://docs.oracle.com/javafx/2/get_started/jfxpub-get_started.htm

    Cant't really recommend this (not a JavaFX project)
    http://www.instructables.com/id/Java-Game-Programming-Tutorial-Flappy-Bird-Redux/
*/

package cz.cvut.fel.pjv.flappyfx;

import javafx.animation.Animation;
import javafx.animation.KeyFrame;
import javafx.animation.TimelineBuilder;
import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.scene.layout.StackPane;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.util.Duration;

import static cz.cvut.fel.pjv.flappyfx.Util.*;
import java.util.HashMap;
import java.util.Map;

public class MainApp extends Application {

  final double ASPECT_RATIO = INIT_APP_HEIGHT / INIT_APP_WIDTH;
  
  private GameLoopHandler gameLoopHandler;
  private SpriteManager spriteManager;
  private GameCanvas gameCanvas;
  private UserActionHandler userActionHandler;
  private Map<String, Integer> gameVariables;
  
  @Override
  public void init() throws Exception {
    spriteManager = new SpriteManager (
      new Bird(SpriteId.BIRD, "bird.png"),
      new Pipe(SpriteId.PIPE_TOPLEFT, "pipe_head.png", PipeLoc.TOP),
      new Pipe(SpriteId.PIPE_TOPRIGHT, "pipe_head.png", PipeLoc.TOP),
      new Pipe(SpriteId.PIPE_BOTTOMLEFT, "pipe_head.png", PipeLoc.BOTTOM),
      new Pipe(SpriteId.PIPE_BOTTOMRIGHT, "pipe_head.png", PipeLoc.BOTTOM)
    );
    gameVariables = new HashMap<>();
    gameCanvas = new GameCanvas(spriteManager, gameVariables);
    gameLoopHandler = new GameLoopHandler(gameCanvas, spriteManager, gameVariables);
    userActionHandler = new UserActionHandler(spriteManager, gameVariables);
  }

  @Override
  public void start(Stage stage) throws Exception {
   
    // 1. build the scene
    StackPane stackPane = new StackPane();
    stackPane.getChildren().add(gameCanvas);
    gameCanvas.fixAspectRatio(ASPECT_RATIO);
 
    Scene scene = new Scene(stackPane, INIT_APP_WIDTH, INIT_APP_HEIGHT);
    stage.setScene(scene);
    stage.setTitle("Java FX Game example");
    stage.getIcons().add(new Image(GFX_DIR + "bird.png"));
    
    // 2. add mouse and keyboard event handling
    scene.setOnKeyPressed(userActionHandler);
    scene.setOnKeyReleased(userActionHandler);
    
    // 3. create the game loop
    final KeyFrame oneFrame = new KeyFrame(
      Duration.millis(1000 / 60), // [60 fps]
      gameLoopHandler
    );
    TimelineBuilder.create()
      .cycleCount(Animation.INDEFINITE)
      .keyFrames(oneFrame)
      .build()
      .play();

    // 4. finally - show the stage
    stage.show();
  }

  public static void main(String[] args) {
    launch(args);
  }
}
