/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.util.Callback;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 */
public class DbAccess {

  private String dbFileName;

  public DbAccess(String dbFileName) {
    this.dbFileName = dbFileName;
  }

  public TabularData runQuery(String sql) {
    ObservableList<ObservableList<String>> data = null;
    TableColumn[] columns = null;

    try (Connection conn = this.connect();
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(sql)) {

      // loop through the result set and add columns...
      int columnCount = rs.getMetaData().getColumnCount();
      columns = new TableColumn[columnCount];
      for (int i = 0; i < columnCount; i++) {
        final int j = i;
        TableColumn col = new TableColumn(rs.getMetaData().getColumnName(i + 1));
        col.setCellValueFactory(new Callback<CellDataFeatures<ObservableList, String>, ObservableValue<String>>() {
          public ObservableValue<String> call(CellDataFeatures<ObservableList, String> param) {
            return new SimpleStringProperty(param.getValue().get(j).toString());
          }
        });
        columns[i] = col;
        System.out.println("Column [" + i + "] ");
      }

      // ...then fill data - list of lists
      data = FXCollections.observableArrayList();
      while (rs.next()) {
        // iterate rows...
        ObservableList<String> row = FXCollections.observableArrayList();
        for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
          // ...and columns
          row.add(rs.getString(i));
        }
        System.out.println("Row added " + row);
        data.add(row);
      }
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    } finally {
      return new TabularData(columns, data);
    }
  }

  public void selectAll() {
    String sql = "SELECT EmployeeId, LastName, FirstName, HireDate FROM employees";

    try (Connection conn = this.connect();
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(sql)) {

      // loop through the result set
      while (rs.next()) {
        System.out.println(rs.getInt("EmployeeId") + "\t"
          + rs.getString("LastName") + "\t"
          + rs.getString("FirstName") + "\t"
          + rs.getDouble("HireDate"));
      }
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    }
  }

  private Connection connect() {
    String url = "jdbc:sqlite:" + dbFileName;
    Connection conn = null;
    try {
      conn = DriverManager.getConnection(url);
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    }
    return conn;
  }
}
