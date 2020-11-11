/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.geometry.VPos;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.image.PixelReader;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.TextAlignment;
import javafx.stage.Stage;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Generator extends Application {

  private final double GRAYSCALE_THRESHOLD = 0.5;
  private final int CELL_SIZE = 10;
  private final String MAP_FILE_NAME = "world.jpg";

  @Override
  public void start(Stage stage) throws Exception {
    Pane root = new StackPane();
    Scene scene = new Scene(root);
    Image mapImage = new Image(MAP_FILE_NAME);
    ImageView imageView = new ImageView(mapImage);
    Canvas canvas = new Canvas(mapImage.getWidth(), mapImage.getHeight());
    GraphicsContext gc = canvas.getGraphicsContext2D();
    gc.setFill(Color.ORANGERED);
    gc.setFont(Font.font("Arial", 40));
    gc.setTextAlign(TextAlignment.CENTER);
    gc.setTextBaseline(VPos.CENTER);
    gc.fillText(
      "Click here to create cell map\nSee console output for generated code",
      canvas.getWidth() / 2, canvas.getHeight() / 2
    );
    
    canvas.setOnMouseClicked((event) -> {
      gc.setFill(Color.ROYALBLUE);
      gc.fillRect(0, 0, canvas.getWidth(),canvas.getHeight());
      gc.setFill(Color.LIGHTGREEN);

      computeMatrix(mapImage, CELL_SIZE, GRAYSCALE_THRESHOLD, gc);
    });

    root.getChildren().addAll(imageView, canvas);
    stage.setTitle("World map epidemic simulation helper");
    stage.setScene(scene);
    stage.show();
  }

  public static void main(String[] args) {
    launch(args);
  }

  private void computeMatrix(Image image, int cellSize, double threshold, GraphicsContext gc) {
    PixelReader pr = image.getPixelReader();
    int xCount = (int) image.getWidth() / cellSize;
    int yCount = (int) image.getHeight() / cellSize;

    // CUSTOMIZE HERE:
    System.out.println(
      "public class Model {\n" +
      "\n" +
      "  private class PopulationCell {\n" +
      "\n" +
      "    private final int x, y;\n" +
      "    private int totalCount;\n" +
      "    private int sickCount;\n" +
      "    private int deadCount;\n" +
      "    private int immuneCount;\n" +
      "    // etc...\n" +
      "\n" +
      "    public PopulationCell(int x, int y) {\n" +
      "      this.x = x;\n" +
      "      this.y = y;\n" +
      "    }\n" +
      "  }\n" +
      "  private final PopulationCell[][] pc;\n" +
      "\n" +
      "  public Model() {\n" +
      "\n" +
      "  pc = new PopulationCell[" + yCount + "][" + xCount + "];"
    );

    for (int y = 0; y < yCount; y++) {
      for (int x = 0; x < xCount; x++) {
        if (getAverageGrayscaleValue(x, y, cellSize, pr) < threshold) {
          gc.fillOval(x * cellSize, y * cellSize, cellSize, cellSize);
          // AND HERE:
          System.out.println("    createPCInstance(" + x + ", " + y +");");
        }
      }
    }
    // AND HERE:
    System.out.println(
      "  }\n" +
      "  \n" +
      "  private void createPCInstance(int x, int y) {\n" +
      "    pc[y][x] = new PopulationCell(x, y);\n" +
      "  }\n" +
      "}"
    );
  }

  private double getAverageGrayscaleValue(int x, int y, int cellSize, PixelReader pr) {
    double gayscaleBuffer = 0;
    for (int j = y * cellSize; j < (y + 1) * cellSize ; j++) {
      for (int i = x * cellSize; i < (x + 1) * cellSize ; i++) {
        gayscaleBuffer += getPixelGrayscaleValue(pr.getColor(i, j));
      }
    }
    return gayscaleBuffer / (cellSize * cellSize);
  }

  private double getPixelGrayscaleValue(Color pixelColor) {
    return (pixelColor.getRed() * 0.3 + pixelColor.getGreen() * 0.59 + pixelColor.getBlue() * 0.11) * pixelColor.getOpacity();
  }
}
