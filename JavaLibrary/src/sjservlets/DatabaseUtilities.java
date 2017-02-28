package sjservlets;

import java.sql.*;

/** Three database utilities:<BR>
 *   1) getQueryResults. Connects to a database, executes
 *      a query, retrieves all the rows as arrays
 *      of strings, and puts them inside a DBResults
 *      object. Also places the database product name,
 *      database version, and the names of all the columns
 *      into the DBResults object. This has two versions:
 *      one that makes a new connection and another that
 *      uses an existing connection. <P>
 *   2) createTable. Given a table name, a string denoting
 *      the column formats, and an array of strings denoting
 *      the row values, this method connects to a database,
 *      removes any existing versions of the designated
 *      table, issues a CREATE TABLE command with the
 *      designated format, then sends a series of INSERT INTO
 *      commands for each of the rows. Again, there are
 *      two versions: one that makes a new connection and
 *      another that uses an existing connection. <P>
 *   3) printTable. Given a table name, this connects to
 *      the specified database, retrieves all the rows,
 *      and prints them on the standard output.
 *
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */

public class DatabaseUtilities {
  
  /** Connect to database, execute specified query,
   *  and accumulate results into DBRresults object.
   *  If the database connection is left open (use the
   *  close argument to specify), you can retrieve the
   *  connection with DBResults.getConnection.
   */

	public static ResultSet getQueryResultSet(String driver,
                                          String url,
                                          String username,
                                          String password,
                                          String query,
                                          boolean close) {
    try {
      Class.forName(driver);
      Connection connection =
        DriverManager.getConnection(url, username, password);
      return(getQueryResultSet(connection, query, close));
    } catch(ClassNotFoundException cnfe) {
      System.err.println("Error loading driver: " + cnfe);
      return(null);
    } catch(SQLException sqle) {
      System.err.println("Error connecting: " + sqle);
      return(null);
    }
  }
  
    public static ResultSet getQueryResultSet(Connection connection,
                                          String query,
                                          boolean close) {
    try {
      Statement statement = connection.createStatement();
      ResultSet resultSet = statement.executeQuery(query);
      if (close) {
        connection.close();
      }
      return(resultSet);
    } catch(SQLException sqle) {
      System.err.println("Error connecting: " + sqle);
      return(null);
    } 
  }

  
  public static DBResults getQueryResults(String driver,
                                          String url,
                                          String username,
                                          String password,
                                          String query,
                                          boolean close) {
    try {
      Class.forName(driver);
      Connection connection =
        DriverManager.getConnection(url, username, password);
      return(getQueryResults(connection, query, close));
    } catch(ClassNotFoundException cnfe) {
      System.err.println("Error loading driver: " + cnfe);
      return(null);
    } catch(SQLException sqle) {
      System.err.println("Error connecting: " + sqle);
      return(null);
    }
  }

  /** Retrieves results as in previous method but uses
   *  an existing connection instead of opening a new one.
   */
  
  public static DBResults getQueryResults(Connection connection,
                                          String query,
                                          boolean close) {
    try {
      DatabaseMetaData dbMetaData = connection.getMetaData();
      String productName =
        dbMetaData.getDatabaseProductName();
      String productVersion =
        dbMetaData.getDatabaseProductVersion();
      Statement statement = connection.createStatement();
      ResultSet resultSet = statement.executeQuery(query);
      ResultSetMetaData resultsMetaData =
        resultSet.getMetaData();
      int columnCount = resultsMetaData.getColumnCount();
      String[] columnNames = new String[columnCount];
      // Column index starts at 1 (a la SQL) not 0 (a la Java).
      for(int i=1; i<columnCount+1; i++) {
        columnNames[i-1] =
          resultsMetaData.getColumnName(i).trim();
      }
      DBResults dbResults =
        new DBResults(connection, productName, productVersion,
                      columnCount, columnNames);      
      while(resultSet.next()) {
        String[] row = new String[columnCount];
        // Again, ResultSet index starts at 1, not 0.
        for(int i=1; i<columnCount+1; i++) {
          String entry = resultSet.getString(i);
          if (entry != null) {
            entry = entry.trim();
          }
          row[i-1] = entry;
        }
        dbResults.addRow(row);
      }
      if (close) {
        connection.close();
      }
      return(dbResults);
    } catch(SQLException sqle) {
      System.err.println("Error connecting: " + sqle);
      return(null);
    } 
  }

  /** Build a table with the specified format and rows. */
  
  public static Connection createTable(String driver,
                                       String url,
                                       String username,
                                       String password,
                                       String tableName,
                                       String tableFormat,
                                       String[] tableRows,
                                       boolean close) {
    try {
      Class.forName(driver);
      Connection connection =
        DriverManager.getConnection(url, username, password);
      return(createTable(connection, username, password,
                         tableName, tableFormat,
                         tableRows, close));
    } catch(ClassNotFoundException cnfe) {
      System.err.println("Error loading driver: " + cnfe);
      return(null);
    } catch(SQLException sqle) {
      System.err.println("Error connecting: " + sqle);
      return(null);
    } 
  }

  /** Like the previous method, but uses existing connection. */
  
  public static Connection createTable(Connection connection,
                                       String username,
                                       String password,
                                       String tableName,
                                       String tableFormat,
                                       String[] tableRows,
                                       boolean close) {
    try {
      
      Statement statement = connection.createStatement();
      // Drop previous table if it exists, but don't get
      // error if it doesn't. Thus the separate try/catch here.
      try {
        statement.execute("DROP TABLE " + tableName);
      } catch(SQLException sqle) {}
      String createCommand =
        "CREATE TABLE " + tableName + " " + tableFormat;
      statement.execute(createCommand);
      String insertPrefix =
        "INSERT INTO " + tableName + " VALUES";
      for(int i=0; i<tableRows.length; i++) {
        statement.execute(insertPrefix + tableRows[i]);
      }
      if (close) {
        connection.close();
        return(null);
      } else {
        return(connection);
      }
    } catch(SQLException sqle) {
      System.err.println("Error creating table: " + sqle);
      return(null);
    } 
  }

  public static void printTable(String driver,
                                String url,
                                String username,
                                String password,
                                String tableName,
                                int entryWidth,
                                boolean close) {
    String query = "SELECT * FROM " + tableName;
    DBResults results =
      getQueryResults(driver, url, username,
                      password, query, close);
    printTableData(tableName, results, entryWidth, true);
  }

  /** Prints out all entries in a table. Each entry will
   *  be printed in a column that is entryWidth characters
   *  wide, so be sure to provide a value at least as big
   *  as the widest result.
   */

  public static void printTable(Connection connection,
                                String tableName,
                                int entryWidth,
                                boolean close) {
    String query = "SELECT * FROM " + tableName;
    DBResults results =
      getQueryResults(connection, query, close);
    printTableData(tableName, results, entryWidth, true);
  }

  public static void printTableData(String tableName,
                                    DBResults results,
                                    int entryWidth,
                                    boolean printMetaData) {
    if (results == null) {
      return;
    }
    if (printMetaData) {
      System.out.println("Database: " +
                         results.getProductName());
      System.out.println("Version: " +
                         results.getProductVersion());
      System.out.println();
    }
    System.out.println(tableName + ":");
    String underline =
      padString("", tableName.length()+1, "=");        
    System.out.println(underline);
    int columnCount = results.getColumnCount();
    String separator =
      makeSeparator(entryWidth, columnCount);
    System.out.println(separator);
    String row = makeRow(results.getColumnNames(), entryWidth);
    System.out.println(row);
    System.out.println(separator);
    int rowCount = results.getRowCount();
    for(int i=0; i<rowCount; i++) {
      row = makeRow(results.getRow(i), entryWidth);
      System.out.println(row);
    }
    System.out.println(separator);
  }
  
  // A String of the form "|  xxx |  xxx |  xxx |"

  private static String makeRow(String[] entries,
                                int entryWidth) {
    String row = "|";
    for(int i=0; i<entries.length; i++) {
      row = row + padString(entries[i], entryWidth, " ");
      row = row + " |";
    }
    return(row);
  }
    
  // A String of the form "+------+------+------+"
  
  private static String makeSeparator(int entryWidth,
                                      int columnCount) {
    String entry = padString("", entryWidth+1, "-");
    String separator = "+";
    for(int i=0; i<columnCount; i++) {
      separator = separator + entry + "+";
    }
    return(separator);
  }

  private static String padString(String orig, int size,
                                  String padChar) {
    if (orig == null) {
      orig = "<null>";
    }
    // Use StringBuffer, not just repeated String concatenation
    // to avoid creating too many temporary Strings.
    StringBuffer buffer = new StringBuffer("");
    int extraChars = size - orig.length();
    for(int i=0; i<extraChars; i++) {
      buffer.append(padChar);
    }
    buffer.append(orig);
    return(buffer.toString());
  }
}
