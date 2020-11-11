/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.util.Random;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Simulation {
  
  static final int WIDTH = 400;  // cells
  static final int HEIGHT = 400; // dtto
  static final int MAX_CELL_VALUE = 11;

  // Two 2d arrays, int[0][][] and int[1][][] are switching roles with every
  // new generation of cells; one is the source of calculations to obtain the
  // other's values and vice versa. Variables src and dst point to actual index
  // of source and destination respectively.
  int[][][] cells;
  private int src, dst;

  public Simulation() {
    cells = new int[2][WIDTH][HEIGHT];
  }

  public void initCellsRandom() {
    src = 0;
    dst = 1;
    Random rnd = new Random();
    for (int x = 0; x < WIDTH; x++) {
      for (int y = 0; y < HEIGHT; y++) {
        cells[dst][x][y] = rnd.nextInt(MAX_CELL_VALUE + 1); // range <0 - MAX_CELL_VALUE>
      }    
    }
  }

  public int[][] getDataToShow() {
    return cells[dst];
  }
  
  public void calculateNextGen() {
    src = flipBetween1and0(src);
    dst = flipBetween1and0(dst);
    for (int x = 0; x < WIDTH; x++) {
      for (int y = 0; y < HEIGHT; y++) {
        cells[dst][x][y] = calculateNewCellValue(x, y);
      }    
    }
  }

  private int flipBetween1and0(int num) {
    return 1 - num;
  }
  
  private int calculateNewCellValue(int x, int y) {
    int value = cells[src][x][y];
    int newValue = value >= MAX_CELL_VALUE ? 0 : value + 1;
    // check neigbours for presence of the new value
    for (int i = x - 1; i <= x + 1; i++) {
      for (int j = y - 1; j <= y + 1 ; j++) {
        if (Math.abs(i) != Math.abs(j)) { // von Neumann neighborhood
          // wrap around at left, right, top and bottom edge
          int wrapped_i = i < 0 ? WIDTH + i : i >= WIDTH ? i - WIDTH : i;
          int wrapped_j = j < 0 ? HEIGHT + j : j >= HEIGHT ? j - HEIGHT : j;
          if (cells[src][wrapped_i][wrapped_j] == newValue) {
            return newValue;
          }
        }
      }
    }
    return value;
  }
}
