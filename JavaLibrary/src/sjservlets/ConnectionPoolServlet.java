package sjservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

/** A class that extent the Connection Pool servlet which 
 *  JDBC connections for this applicaiton (Java Library)
 *
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */
 
public class ConnectionPoolServlet extends HttpServlet {
  	protected ConnectionPool connectionPool;
  
  	public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
  			throws ServletException, IOException {
  	}

  /** Initialize the connection pool when servlet is
   *  initialized. To avoid a delay on first access, load
   *  the servlet ahead of time yourself or have the
   *  server automatically load it after reboot.
   */
  
	public void init() {
		int vendor = DriverUtilities.POSTGRESQL;
    	String driver = DriverUtilities.getDriver(vendor);
    	String host = "localhost";
    	String dbName = "jsp_library";
    	String url = DriverUtilities.makeURL(host, dbName, vendor);
    	String username = "postgres";
    	String password = "vinu123";
    	try {
      		connectionPool =
        	new ConnectionPool(driver, url, username, password,
                           initialConnections(),
                           maxConnections(),
                           true);
      		System.out.println("new connection object: " +connectionPool+ "created successfully.");
    	} catch(SQLException sqle) {
      		System.err.println("Error making pool: " + sqle);
      		getServletContext().log("Error making pool: " + sqle);
      		connectionPool = null;
    	}
  	}

  	public void destroy() {
    	connectionPool.closeAllConnections();
  	}

  	/** Override this in subclass to change number of initial
   	*  connections.
   	*/
  
  	protected int initialConnections() {
    	return(3);
  	}

  	/** Override this in subclass to change maximum number of 
   	*  connections.
   	*/

    protected int maxConnections() {
    	return(60);
  	}
  
  	public void doPost(HttpServletRequest request,
					   HttpServletResponse response)
		   throws ServletException, IOException{
		doGet(request, response);
	}
	
	protected void gotoPage(String address, 
						  HttpServletRequest request,
						  HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = 
			getServletContext().getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}
}
