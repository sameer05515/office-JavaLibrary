package sjservlets;

/**
 * Some simple utilities for building Oracle, Sybase and MYSQL JDBC connections.
 * For this Java Library applicaiton, only MYSQL is use.
 * <P>
 * &copy; 2002 Song Jing; may be freely used or adapted.
 */

public class DriverUtilities {
	public static final int ORACLE = 1;
	public static final int SYBASE = 2;
	public static final int MYSQL = 3;
	public static final int POSTGRESQL = 4;
	public static final int UNKNOWN = -1;

	/**
	 * Build a URL in the format needed by the Oracle and Sybase drivers I am
	 * using.
	 */

	public static String makeURL(String host, String dbName, int vendor) {
		if (vendor == ORACLE) {
			return ("jdbc:oracle:thin:@" + host + ":1521:" + dbName);
		} else if (vendor == SYBASE) {
			return ("jdbc:sybase:Tds:" + host + ":1521" + "?SERVICENAME=" + dbName);
		} else if (vendor == MYSQL) {
			return ("jdbc:mysql:///" + dbName);
		} else if (vendor == POSTGRESQL) {
			return ("jdbc:postgresql://" + host + ":5432/" + dbName);
		} else {
			return (null);
		}
	}

	// Class.forName("org.gjt.mm.mysql.Driver");
	// Connection myConn =
	// DriverManager.getConnection("jdbc:mysql:///jsp_library?user=root&password=masteryoda");

	/** Get the fully qualified name of a driver. */

	public static String getDriver(int vendor) {
		if (vendor == ORACLE) {
			return ("oracle.jdbc.driver.OracleDriver");
		} else if (vendor == SYBASE) {
			return ("com.sybase.jdbc.SybDriver");
		} else if (vendor == MYSQL) {
			return ("org.gjt.mm.mysql.Driver");
		} else if (vendor == POSTGRESQL) {
			return ("org.postgresql.Driver");
		} else {
			return (null);
		}
	}

	/** Map name to int value. */

	public static int getVendor(String vendorName) {
		if (vendorName.equalsIgnoreCase("oracle")) {
			return (ORACLE);
		} else if (vendorName.equalsIgnoreCase("sybase")) {
			return (SYBASE);
		} else if (vendorName.equalsIgnoreCase("mysql")) {
			return (MYSQL);
		} else if (vendorName.equalsIgnoreCase("postgresql")) {
			return (POSTGRESQL);
		} else {
			return (UNKNOWN);
		}
	}
}
