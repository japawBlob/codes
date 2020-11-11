/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.IOException;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Main {

  public static void main(String[] args) {
    try {
      // write
      ObjectMapper objectMapper = new ObjectMapper();
      GameBoard gameBoard = new GameBoard();
      gameBoard.addRock(40, 50, 60, 70);
      gameBoard.addRock(45, 155, 32, 64);
      gameBoard.addMonster(45, 155, 32, 64, 100, 80, 8, 20, 10, 5);
      objectMapper.writeValue(new File("board.json"), gameBoard);
      // read
      GameBoard boardToRead = objectMapper.readValue(new File("board.json"), GameBoard.class);
      System.out.println(boardToRead);
    } catch (IOException ex) {
      System.out.println("IOException " + ex.getMessage());
    }
  }
}
