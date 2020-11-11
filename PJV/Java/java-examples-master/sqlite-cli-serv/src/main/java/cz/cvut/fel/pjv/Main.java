/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class Main {

  public static void main(String[] args) {
    DbAccess dbAccess = new DbAccess("chinook.db");
    dbAccess.selectAll();
  }
}
