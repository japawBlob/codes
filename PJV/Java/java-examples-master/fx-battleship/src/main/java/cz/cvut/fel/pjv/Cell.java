/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import javafx.scene.layout.StackPane;

/**
 *
 * @author LaSer
 */
public class Cell extends StackPane {

  private CellState state;
  private final double row, column;

  public Cell(double size, double column, double row) {
    setPrefHeight(size);
    setPrefWidth(size);
    this.row = row;
    this.column = column;
    setState(CellState.EMPTY);
  }

  public CellState getState() {
    return state;
  }

  public double getRow() {
    return row;
  }

  public double getColumn() {
    return column;
  }
  
  public final void setState(CellState cellState) {
    state = cellState;
    setBackground(cellState.getBackground());
  }
}
