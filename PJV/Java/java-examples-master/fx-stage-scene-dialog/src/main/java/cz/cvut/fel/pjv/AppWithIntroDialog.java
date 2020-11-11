/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.util.Optional;
import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class AppWithIntroDialog extends Application {
  
  @Override
  public void start(Stage primaryStage) {

    Label l1 = new Label();
    Label l2 = new Label();

    Optional<String[]> result = new MyDialog().showAndWait();
    result.ifPresent(dialogData -> {
      l1.setText("User entered: >" + dialogData[0] + "<");
      l2.setText("and: >" + dialogData[1] + "<");
    });
    
    VBox root = new VBox(l1, l2);
    root.setAlignment(Pos.CENTER);
    root.setPadding(new Insets(12, 12, 12, 12));
    Scene scene = new Scene(root, 300, 250);
    
    primaryStage.setTitle("Application with Intro Dialog");
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  public static void main(String[] args) {
    launch(args);
  }
  
}
