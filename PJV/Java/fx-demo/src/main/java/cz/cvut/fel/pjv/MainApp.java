package cz.cvut.fel.pjv;

import java.awt.Polygon;
import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;


public class MainApp extends Application {

    @Override
    public void start(Stage stage) throws Exception {
        Pane pane = new FlowPane();
        
        Scene scene = new Scene(pane);
        
        final TextField input = new TextField("Poloměr");
        Button button = new Button("Spočítej!");
        final Label label = new Label("Obvod");
        pane.getChildren().add(input);
        pane.getChildren().add(button);
        pane.getChildren().add(label);
        
        
        stage.setTitle("JavaFX and Maven");
        stage.setScene(scene);
        stage.show();
        button.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                double polomer = Double.parseDouble(input.getText());
                double obvod = 2 * Math.PI * polomer; 
                label.setText(String.valueOf(obvod));
            }
          });
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
