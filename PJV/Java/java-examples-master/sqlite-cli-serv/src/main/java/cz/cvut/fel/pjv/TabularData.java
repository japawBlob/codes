/*
 *  Created for B0B36PJV in b182
 */
package cz.cvut.fel.pjv;

import java.io.Serializable;
import javafx.collections.ObservableList;
import javafx.scene.control.TableColumn;

/**
 *
 * @author ladislav.seredi@fel.cvut.cz
 * 
 * Utility class to transport tabular data - columns and cell data - form sql query to TableView
 */
public class TabularData implements Serializable {
    private final TableColumn[] columns;
    private final ObservableList<ObservableList<String>> rowData;

  public TabularData(TableColumn[] columns, ObservableList<ObservableList<String>> rowData) {
    this.columns = columns;
    this.rowData = rowData;
  }

  public TableColumn[] getColumns() {
    return columns;
  }

  public ObservableList<ObservableList<String>> getRowData() {
    return rowData;
  }
}
