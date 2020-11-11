package cz.cvut.fel.pjv;

import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class MainApp extends Application {
  
    private final int CELL_SIZE = 40;
    private final int CELL_COL_COUNT = 10;
    private final int CELL_ROW_COUNT = 10;
    private final int APP_WIDTH = CELL_SIZE * CELL_COL_COUNT;
    private final int APP_HEIGHT = CELL_SIZE * CELL_ROW_COUNT;
    
    @Override
    public void init() {
    }
    
    @Override
    public void start(Stage stage) throws Exception {
      
        Board board = new Board();
        
        board.initBoard(
          CELL_COL_COUNT,
          CELL_ROW_COUNT,
          CELL_SIZE
        );
        
        Scene scene = new Scene(board, APP_WIDTH, APP_HEIGHT);
        stage.setTitle("BattleshipsFX");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
