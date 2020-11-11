/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class SwitchScenes extends Application {

  Scene scene1, scene2;

  @Override
  public void start(Stage primaryStage) {
    scene1 = getScene1(primaryStage);
    scene2 = getScene2(primaryStage);

    primaryStage.setTitle("Switching Scenes");
    primaryStage.setScene(scene1);
    primaryStage.show();
  }

  /**
   * @param args the command line arguments
   */
  public static void main(String[] args) {
    launch(args);
  }

  private Scene getScene1(Stage stage) {
    Label label1 = new Label("This is the first scene");
    Button button1 = new Button();
    button1.setText("Switch to scene 2");
    button1.setOnAction(new EventHandler<ActionEvent>() {
      @Override
      public void handle(ActionEvent event) {
        stage.setScene(scene2);
      }
    });
    VBox root1 = new VBox();
    root1.setAlignment(Pos.CENTER);
    root1.getChildren().addAll(label1, button1);
    return new Scene(root1, 300, 250);
  }

  private Scene getScene2(Stage stage) {
    Label label2 = new Label("This is the second scene");
    Button button2 = new Button("Go to scene 1");
    // same as above - expressed by lambda:
    button2.setOnAction(e -> stage.setScene(scene1));
    VBox root2 = new VBox(20);
    root2.setAlignment(Pos.CENTER);
    root2.getChildren().addAll(label2, button2);
    return new Scene(root2, 640, 480);
  }
}
