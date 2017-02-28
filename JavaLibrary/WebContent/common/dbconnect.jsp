<%@ page import="sjservlets.*, java.sql.*"%>

<%
	ConnectionPool connectionPool;
	int vendor = DriverUtilities.POSTGRESQL;
	String driver = DriverUtilities.getDriver(vendor);
	String host = "localhost";
	String dbName = "jsp_library";
	String url = DriverUtilities.makeURL(host, dbName, vendor);
	String username = "postgres";
	String password = "vinu123";

	try {
		connectionPool = new ConnectionPool(driver, url, username, password, 10, 50, true);
		System.out.println("new connection object: " +connectionPool+ "created successfully.");
	} catch (SQLException sqle) {
		System.err.println("Error making pool: " + sqle);
		getServletContext().log("Error making pool: " + sqle);
		connectionPool = null;
	}

	// connectionPool.closeAllConnections();
%>