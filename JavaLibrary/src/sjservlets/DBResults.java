package sjservlets;

import java.sql.*;
import java.util.*;

/** Class to store completed results of a JDBC Query.
 *  Differs from a ResultSet in several ways:
 *  <UL>
 *    <LI>ResultSet doesn't necessarily have all the data;
 *        reconnection to database occurs as you ask for
 *        later rows.
 *    <LI>This class stores results as strings, in arrays.
 *    <LI>This class includes DatabaseMetaData (database product
 *        name and version) and ResultSetMetaData
 *        (the column names).
 *    <LI>This class has a toHTMLTable method that turns
 *        the results into a long string corresponding to
 *        an HTML table.
 *  </UL>
 *  <P>
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */

public class DBResults {
  private Connection connection;
  private String productName;
  private String productVersion;
  private int columnCount;
  private String[] columnNames;
  private Vector queryResults;
  String[] rowData;

  public DBResults(Connection connection,
                   String productName,
                   String productVersion,
                   int columnCount,
                   String[] columnNames) {
    this.connection = connection;
    this.productName = productName;
    this.productVersion = productVersion;
    this.columnCount = columnCount;
    this.columnNames = columnNames;
    rowData = new String[columnCount];
    queryResults = new Vector();
  }

  public Connection getConnection() {
    return(connection);
  }
  
  public String getProductName() {
    return(productName);
  }

  public String getProductVersion() {
    return(productVersion);
  }

  public int getColumnCount() {
    return(columnCount);
  }

  public String[] getColumnNames() {
    return(columnNames);
  }

  public int getRowCount() {
    return(queryResults.size());
  }

  public String[] getRow(int index) {
    return((String[])queryResults.elementAt(index));
  }

  public void addRow(String[] row) {
    queryResults.addElement(row);
  }

  /** Output the results as an HTML table, with
   *  the column names as headings and the rest of
   *  the results filling regular data cells.
   */
  
  public String toHTMLTable(String headingColor) {
    StringBuffer buffer =
      new StringBuffer("<TABLE BORDER=1>\n");
    if (headingColor != null) {
      buffer.append("  <TR BGCOLOR=\"" + headingColor +
                    "\">\n    ");
    } else {
      buffer.append("  <TR>\n    ");
    }
    for(int col=0; col<getColumnCount(); col++) {
      buffer.append("<TH>" + columnNames[col]);
    }
    for(int row=0; row<getRowCount(); row++) {
      buffer.append("\n  <TR>\n    ");
      String[] rowData = getRow(row);
      for(int col=0; col<getColumnCount(); col++) {
        buffer.append("<TD>" + rowData[col]);
      }
    }
    buffer.append("\n</TABLE>");
    return(buffer.toString());
  } 
}
    
  
