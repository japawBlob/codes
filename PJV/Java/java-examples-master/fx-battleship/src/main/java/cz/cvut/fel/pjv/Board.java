/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.io.File;
import javafx.event.EventHandler;
import javafx.event.EventTarget;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;

/**
 *
 * @author LaSer TEST
 */
public class Board extends Pane {

  GameState gameState;

  public void initBoard(int colCount, int rowCount, double cellSize) {
    gameState = GameState.SETUP;
    setPrefSize(cellSize * colCount, cellSize * rowCount);
    for (int c = 0; c < colCount; c++) {
      for (int r = 0; r < rowCount; r++) {
        Cell cell = new Cell(cellSize, c, r);
        cell.setLayoutX(c * cellSize);
        cell.setLayoutY(r * cellSize);
        getChildren().add(cell);
      }
    }
    setOnMouseClicked(new EventHandler<MouseEvent>() {
      @Override
      public void handle(MouseEvent event) {
        if (gameState == GameState.SETUP) {
          handleSetupClick(event);
        } else if (gameState == GameState.SETUP) {
          handlePlayClick(event);
        }
      }
    });
  }

  private void handleSetupClick(MouseEvent event) {
    EventTarget target = event.getTarget();
    if (target instanceof Cell) {
      Cell cell = (Cell) target;
      MouseButton button = event.getButton();
      if (button == MouseButton.PRIMARY) {
        switch (cell.getState()) {
          case EMPTY:
          case DESTROYER: {
            cell.setState(CellState.CARRIER);
            break;
          }
          case CARRIER: {
            cell.setState(CellState.BATTLESHIP);
            break;
          }
          case BATTLESHIP: {
            cell.setState(CellState.CRUISER);
            break;
          }
          case CRUISER: {
            cell.setState(CellState.SUBMARINE);
            break;
          }
          case SUBMARINE: {
            cell.setState(CellState.DESTROYER);
            break;
          }
        }
      } else if (button == MouseButton.SECONDARY) {
        cell.setState(CellState.EMPTY);
      }
    }
  }
  private void handlePlayClick(MouseEvent event) {
  }
}
