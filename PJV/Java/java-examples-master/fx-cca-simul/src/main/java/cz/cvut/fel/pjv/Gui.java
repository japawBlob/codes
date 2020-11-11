/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.PixelWriter;
import javafx.stage.Stage;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Gui {

  private Stage stage;
  private Canvas canvas;
  private GraphicsContext gc;
  private PixelWriter pw;

  private static final int[] COLORS = {
    0xff0000FF,
    0xff0080FF,
    0xff00FFFF,
    0xff00FF80,
    0xff00FF00,
    0xff5BFF00,
    0xffCCFF00,
    0xffFFB900,
    0xffFF4000,
    0xffFF0040,
    0xffFF009E,
    0xffA600FF};
    
//    0xfffe0000,
//    0xfffea128,
//    0xfffcff00,
//    0xffade601,
//    0xff00e2fb,
//    0xff288dff,
//    0xffb728fe,
//    0xfffd28dc,
//    0xff8525e1,
//    0xffffffff

  public Gui(Stage stage) {
    this.stage = stage;
  }

  public void initCanvas(int width, int height) {
    canvas = new Canvas(width, height);
    gc = canvas.getGraphicsContext2D();
    pw = gc.getPixelWriter();

    Group root = new Group();
    root.getChildren().add(canvas);
    Scene scene = new Scene(root);
    stage.setTitle("Simulation - Cyclic cellular automaton");
    stage.setScene(scene);
    stage.show();
  }

  public void renderGeneration(int[][] cells) {
    double width = canvas.getWidth();
    double height = canvas.getHeight();
    gc.clearRect(0, 0, width, height);
    for (int gx = 0; gx < width; gx++) {
      for (int gy = 0; gy < height; gy++) {
        int paletteValue = checkForOverflow(cells[gx][gy]);
        pw.setArgb(gx, gy, COLORS[paletteValue]);
      }
    }
  }
  
  private int checkForOverflow(int paletteValue) {
    return paletteValue >= COLORS.length - 1 ? 0 : paletteValue;
  }
  
}
