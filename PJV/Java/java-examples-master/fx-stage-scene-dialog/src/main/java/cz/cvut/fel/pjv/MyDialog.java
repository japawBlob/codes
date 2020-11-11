/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Dialog;
import javafx.scene.control.DialogPane;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.util.Callback;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class MyDialog extends Dialog {

  public MyDialog() {
    setTitle("My Subclassed Dialog");
    setHeaderText(null);

    DialogPane dialogPane = getDialogPane();
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
    
    setResultConverter(new Callback<ButtonType, String[]>(){
      @Override
      public String[] call(ButtonType param) {
        if (param == ButtonType.OK) {
          return new String[]{tfPlayersCount.getText(), tfSidesCount.getText()};
        }
        return new String[0];
      }
    });

//    ...but everybody uses lambda    
//    setResultConverter(dialogButton -> {
//      if (dialogButton == ButtonType.OK) {
//        return new String[]{tfPlayersCount.getText(), tfSidesCount.getText()};
//      }
//      return new String[0];
//    });
  }
}
