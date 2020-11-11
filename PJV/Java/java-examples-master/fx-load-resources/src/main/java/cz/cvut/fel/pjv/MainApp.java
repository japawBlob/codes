package cz.cvut.fel.pjv;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
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
import java.net.URL;

public class MainApp extends Application {
  private Canvas canvas;
  private final int PLAYGROUND_WIDTH = 800;
  private final int PLAYGROUND_HEIGHT = 600;
  private final int HORIZONT = 370;
  private static final Color SKY_COLOR = Color.web("0x72c3cf");
  private static final Color GRASS_COLOR = Color.web("0x9de759");
  private static final String TITLE_FILE_NAME = "title.txt";
  private static final String HELP_FILE_NAME = "help.txt";

//  If you need static access to resource path, uncomment these lines:
//  private static String readFileFromResDir(String fileName) {
//    ClassLoader classLoader = MainApp.class.getClassLoader();

//  If you need access to resource path within an instance, uncomment these lines:
  private String readFileFromResDir(String fileName) {
    ClassLoader classLoader = getClass().getClassLoader();

    URL fileUrl = classLoader.getResource(fileName);
    if (fileUrl == null) {
      System.out.println("File not found!");
      return "";
    }
    String fileNameWithPath = fileUrl.getFile();
    if (fileNameWithPath.equals("")) {
      System.out.println("File name error!");
      return "";
    }
    try (BufferedReader br = new BufferedReader(new FileReader(fileNameWithPath))) {
      return br.readLine();
    } catch (IOException ex) {
      System.out.println("IO Exception!");
    }
    return "";
  }
  
  private void letsDraw() {
    GraphicsContext gc = canvas.getGraphicsContext2D();
    gc.setFill(SKY_COLOR);
    gc.fillRect(0, 0, PLAYGROUND_WIDTH, HORIZONT);

    gc.setFill(GRASS_COLOR);
    gc.fillRect(0, HORIZONT, PLAYGROUND_WIDTH, PLAYGROUND_HEIGHT);

    gc.setFill(Color.RED);
    gc.setFont(Font.font( "Tahoma", FontWeight.BOLD, 48));
    // loaded from src/main/resources directory
    gc.fillText(readFileFromResDir(TITLE_FILE_NAME), 250, 150);

    // loaded from src/main/resources directory
    Image hrdina = new Image("hrdina.png");
    gc.drawImage(hrdina, 300, 190);

    gc.setFill(Color.BLACK);
    gc.setFont(Font.font( "Tahoma", FontWeight.NORMAL, 22));
    // loaded from src/main/resources directory
    gc.fillText(readFileFromResDir(HELP_FILE_NAME), 210, 520);
  }

  @Override
  public void start(Stage stage) throws Exception {
    Group root = new Group();
    Scene scene = new Scene(root);
    stage.setScene(scene);

    stage.setTitle("Resource Loading Examples");
    canvas = new Canvas(PLAYGROUND_WIDTH, PLAYGROUND_HEIGHT);
    root.getChildren().add(canvas);
    letsDraw();
    
    stage.show();
  }

  public static void main(String[] args) {
    launch(args);
  }

}
