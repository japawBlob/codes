/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.util.Optional;
import java.util.Random;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.HPos;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Dialog;
import javafx.scene.control.DialogPane;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Main extends Application {

  int windowCount = 1;

  @Override
  public void start(Stage primaryStage) {
    Button btn1 = new Button();
    Button btn2 = new Button();
    Button btn3 = new Button();
    Button btn4 = new Button();
    Button btn5 = new Button();
    btn1.setText("Create a new Stage (i.e. Window)");
    btn2.setText("Create a subclass of Stage");
    btn3.setText("Open a custom Dialog (this is my preferred way)");
    btn4.setText("Open a subclass of Dialog");
    btn5.setText("Open a Stage pretendig to be a Dialog");
    btn1.setOnAction(new EventHandler<ActionEvent>() {
      @Override
      public void handle(ActionEvent event) {
        prepareStage("Window no " + windowCount++).show();
      }
    });
    btn2.setOnAction(new EventHandler<ActionEvent>() {
      @Override
      public void handle(ActionEvent event) {
        new MyStage("Another window no " + windowCount++);
      }
    });
    btn3.setOnAction(new EventHandler<ActionEvent>() {
      @Override
      public void handle(ActionEvent event) {
        Optional<String[]> result = prepareDialog().showAndWait();
        result.ifPresent(dialogData -> {
          System.out.println("Number of players=" + dialogData[0] + ", Number of sides=" + dialogData[1]);
        });
      }
    });
    btn4.setOnAction(new EventHandler<ActionEvent>() {
      @Override
      public void handle(ActionEvent event) {
        Optional<String[]> result = new MyDialog().showAndWait();
        result.ifPresent(dialogData -> {
          System.out.println("Number of players=" + dialogData[0] + ", Number of sides=" + dialogData[1]);
        });
      }
    });
    btn5.setOnAction(new EventHandler<ActionEvent>() {
      @Override
      public void handle(ActionEvent event) {
        prepareFakeDialog(primaryStage, "Window no " + windowCount++).showAndWait();
      }
    });

    VBox root = new VBox(16, btn1, btn2, btn3, btn4, btn5);
    root.setAlignment(Pos.CENTER);

    Scene scene = new Scene(root, 300, 250);

    primaryStage.setTitle("Multiple Window and Dialog Example");
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  public static void main(String[] args) {
    launch(args);
  }

  // --------------------------------------------------------------------------
  
  private Stage prepareStage(String title) {
    HBox root = new HBox();
    Scene scene = new Scene(root, 300, 250);

    Stage stage = new Stage();
    stage.setTitle(title);

    // just for fun: create stage at random position
    Random rnd = new Random();
    stage.setX(200 + rnd.nextInt(100));
    stage.setY(200 + rnd.nextInt(100));

    stage.setScene(scene);
    return stage;
  }

  // --------------------------------------------------------------------------
  
  private Dialog prepareDialog() {
    // heavily inspired by:
    // https://code.makery.ch/blog/javafx-dialogs-official/

    Dialog<String[]> dialog = new Dialog();
    dialog.setTitle("My Dialog");
    dialog.setHeaderText(null);

    DialogPane dialogPane = dialog.getDialogPane();
    dialogPane.getButtonTypes().add(ButtonType.OK);
    
    GridPane grid = new GridPane();
    grid.setHgap(10);
    grid.setVgap(10);
    grid.setPadding(new Insets(20, 150, 10, 10));

    TextField tfPlayersCount = new TextField();
    tfPlayersCount.setPromptText("Enter number of players");
    TextField tfSidesCount = new TextField();
    tfSidesCount.setPromptText("Enter number of sides");

    grid.add(new Label("Players"), 0, 0);
    grid.add(tfPlayersCount, 1, 0);
    grid.add(new Label("Sides"), 0, 1);
    grid.add(tfSidesCount, 1, 1);

    dialogPane.setContent(grid);

    dialogPane.lookupButton(ButtonType.OK);

    Platform.runLater(new Runnable() {
      @Override
      public void run() {
        tfPlayersCount.requestFocus();
      }
    });

    dialog.setResultConverter(dialogButton -> {
      if (dialogButton == ButtonType.OK) {
        return new String[]{tfPlayersCount.getText(), tfSidesCount.getText()};
      }
      return null;
    });
    return dialog;
  }

  // --------------------------------------------------------------------------
  
  private Stage prepareFakeDialog(Stage ownerStage, String title) {
    // my attempt to make the Stage behave as a Dialog
    Stage stage = new Stage(StageStyle.UTILITY);
    stage.setResizable(false);
    stage.initModality(Modality.APPLICATION_MODAL);
    stage.initOwner(ownerStage);

    GridPane grid = new GridPane();
    grid.setHgap(10);
    grid.setVgap(10);
    grid.setPadding(new Insets(20, 10, 10, 10));
    ColumnConstraints fixedWidthColumn = new ColumnConstraints(
      Region.USE_COMPUTED_SIZE, Region.USE_COMPUTED_SIZE, Region.USE_COMPUTED_SIZE,
      Priority.NEVER, HPos.LEFT, true
    );
    ColumnConstraints growingWidthColumn = new ColumnConstraints(
      Region.USE_COMPUTED_SIZE, Region.USE_COMPUTED_SIZE, Region.USE_COMPUTED_SIZE,
      Priority.ALWAYS, HPos.LEFT, true
    );
    grid.getColumnConstraints().addAll(
      fixedWidthColumn,
      growingWidthColumn,
      fixedWidthColumn
    );
    // grid.setGridLinesVisible(true); // only for debugging

    TextField tfPlayersCount = new TextField();
    tfPlayersCount.setPromptText("Enter number of players");
    TextField tfSidesCount = new TextField();
    tfSidesCount.setPromptText("Enter number of sides");

    Button btnOk = new Button("OK");
    btnOk.setMinWidth(80);
    btnOk.setOnAction(new EventHandler<ActionEvent>() {
      @Override
      public void handle(ActionEvent event) {
          System.out.println("Number of players=" + tfPlayersCount.getText() + ", Number of sides=" + tfSidesCount.getText());
          stage.close();
      }
    });
    
    grid.add(new Label("Players"), 0, 0);
    grid.add(tfPlayersCount, 1, 0);
    grid.add(new Label("Sides"), 0, 1);
    grid.add(tfSidesCount, 1, 1);
    grid.add(btnOk, 2, 2);

    Scene scene = new Scene(grid, 340, 128);

    stage.setTitle(title);
    Random rnd = new Random();
    stage.setX(200 + rnd.nextInt(100));
    stage.setY(200 + rnd.nextInt(100));

    stage.setScene(scene);
    return stage;
  }
}
