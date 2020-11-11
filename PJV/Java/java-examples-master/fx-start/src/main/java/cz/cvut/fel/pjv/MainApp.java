package cz.cvut.fel.pjv;

import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.Image;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.Stage;

public class MainApp extends Application {
  // tady --->
  private Canvas kresliciPlocha;
  private final int SIRKA_HRACI_PLOCHY = 800;
  private final int VYSKA_HRACI_PLOCHY = 600;
  private final int HORIZONT = 370;
  static final Color BARVA_NEBE = Color.web("0x72c3cf");
  static final Color BARVA_TRAVY = Color.web("0x9de759");
  
  private void kreslime() {
    GraphicsContext gc = kresliciPlocha.getGraphicsContext2D();
    gc.setFill(BARVA_NEBE);
    gc.fillRect(0, 0, SIRKA_HRACI_PLOCHY, HORIZONT);

    gc.setFill(BARVA_TRAVY);
    gc.fillRect(0, HORIZONT, SIRKA_HRACI_PLOCHY, VYSKA_HRACI_PLOCHY);

    gc.setFill(Color.RED);
    gc.setFont(Font.font( "Tahoma", FontWeight.BOLD, 48));
    gc.fillText("GAME OVER!", 250, 150);
     
    Image hrdina = new Image("hrdina.png");
    gc.drawImage(hrdina, 300, 190);
  }
  // <---

  @Override
  public void start(Stage stage) throws Exception {
    Group root = new Group();
    Scene scene = new Scene(root);
    stage.setScene(scene);

    // tady --->
    stage.setTitle("Moje úžasná JavFX hra");
    kresliciPlocha = new Canvas(SIRKA_HRACI_PLOCHY, VYSKA_HRACI_PLOCHY);
    root.getChildren().add(kresliciPlocha);
    kreslime();
    // <---

    stage.show();
  }

  /**
   * The main() method is ignored in correctly deployed JavaFX application.
   * main() serves only as fallback in case the application can not be launched
   * through deployment artifacts, e.g., in IDEs with limited FX support.
   * NetBeans ignores main().
   *
   * @param args the command line arguments
   */
  public static void main(String[] args) {
    launch(args);
  }

}
