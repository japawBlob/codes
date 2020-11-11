package cz.cvut.fel.pjv.mavenproject3;

import javafx.application.Application; 
import javafx.scene.Scene; 
import javafx.scene.control.*; 
import javafx.scene.layout.*; 
import javafx.event.ActionEvent; 
import javafx.event.EventHandler; 
import javafx.scene.control.Label; 
import javafx.stage.Stage; 
import javafx.scene.image.*; 
import java.io.*; 
import static javafx.application.Application.launch;
import javafx.scene.paint.*; 
import javafx.scene.shape.*; 
  
public class NewMain extends Application { 
  
    // launch the application 
    public void start(Stage s) throws Exception 
    { 
  
        // set title for the stage 
        s.setTitle("Creating ImagePattern"); 
  
        // create a input stream 
        FileInputStream input = new FileInputStream("C:\\Grass1.png"); 
  
        // create a image 
        Image image = new Image(input); 
  
        // create ImagePattern 
        ImagePattern image_pattern = new ImagePattern(image); 
  
        // create a Rectangle 
        Rectangle rect = new Rectangle(100, 100, 200, 150); 
  
        // set fill for rectangle 
        rect.setFill(image_pattern); 
  
        // create a VBox 
        VBox vbox = new VBox(rect); 
  
        // create a scene 
        Scene sc = new Scene(vbox, 200, 200); 
  
        // set the scene 
        s.setScene(sc); 
  
        s.show(); 
    } 
  
    public static void main(String args[]) 
    { 
  
        // launch the application 
        launch(args); 
    } 
} 