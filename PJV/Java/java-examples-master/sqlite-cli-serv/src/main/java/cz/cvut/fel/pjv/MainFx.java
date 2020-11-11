/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import javafx.application.Application;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class MainFx extends Application {
  
  @Override
  public void start(Stage primaryStage) {
    TableView<ObservableList<String>> tView = new TableView();
    Button btn = new Button();
    btn.setText("Load data");
    btn.setOnAction(new EventHandler<ActionEvent>() {
      @Override
      public void handle(ActionEvent event) {
        DbAccess dbAccess = new DbAccess("chinook.db");
        TabularData tData = dbAccess.runQuery("SELECT EmployeeId, LastName, FirstName, HireDate FROM employees");
        tView.setItems(tData.getRowData());
        for (TableColumn col : tData.getColumns()) {
          tView.getColumns().addAll(col);
        }
      }
    });
    VBox root = new VBox(tView, btn);
    Scene scene = new Scene(root, 300, 250);
    primaryStage.setTitle("SQLite DB Example");
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  /**
   * @param args the command line arguments
   */
  public static void main(String[] args) {
    launch(args);
  }
  
}
