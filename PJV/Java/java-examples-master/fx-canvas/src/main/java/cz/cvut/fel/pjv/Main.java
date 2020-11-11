/**
* Simple drawing canvas implementation in JavaFX
* Created for B0B36PJV in b182
* 
* You (usually) don't need to modify this file
*
* @author  ladislav.seredi@fel.cvut.cz
* @version 1.0
* @since   2019-02-16 
*/
package cz.cvut.fel.pjv;

import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.PixelWriter;
import javafx.stage.Stage;

// Standard stuff common for any JavaFX app
public class Main extends Application {

    private Stage stage;
    private Canvas canvas;
    private GraphicsContext gc;
    private PixelWriter pw;
  
    /**
     * Draws a point to the JavaFX Canvas
     * <p>
     *
     * @param  x      pixel coordinate
     * @param  y      pixel coordinate
     * @param  color  pixel color in ARGB format
     * @see           PixelWriter#setArgb(int, int, int) 
     */
    public void drawPoint(int x, int y, int color) {
      
      pw.setArgb(x, y, color);
    }

    public void initCanvas(int width, int height) {
      // Standard stuff common for any JavaFX app
      canvas = new Canvas(width, height);
      gc = canvas.getGraphicsContext2D();
      pw = gc.getPixelWriter();

      Group root = new Group();
      root.getChildren().add(canvas);
      Scene scene = new Scene(root);
      stage.setTitle("Drawing in JavaFX");
      stage.setScene(scene);
      stage.show();
    }
    
    
    @Override
    public void start(Stage stage) throws Exception {
      this.stage = stage;
      // calling the user's method:
      UserDraw ud = new UserDraw(this);
      ud.start();
    }

    /**
     * The main() method is ignored in correctly deployed JavaFX application.
     * main() serves only as fallback in case the application can not be
     * launched through deployment artifacts, e.g., in IDEs with limited FX
     * support. NetBeans ignores main().
     *
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }

}
