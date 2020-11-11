/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.util.Random;
import javafx.scene.Scene;
import javafx.scene.layout.HBox;
import javafx.stage.Stage;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class MyStage extends Stage {

  public MyStage(String title) {
    HBox root = new HBox();
    Scene scene = new Scene(root, 300, 250);

    setTitle(title);

    // just for fun: create stage at random position
    Random rnd = new Random();
    setX(200 + rnd.nextInt(100));
    setY(200 + rnd.nextInt(100));

    setScene(scene);
    show();
  }
}
