package sjservlets;

/** A Java that use during user login.
 *  Beside validate the login ID and password, this servlet
 *  also update the borrower and reserver database when user login.
 *
 *  Actualy the update process should be done using CRON job in linux
 *  , but since that is develop under windows environment, so that is
 *  temporaly alternative.
 *  <P>
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */
 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Date;
import java.text.DateFormat;

public class LoginProcess extends ConnectionPoolServlet {
	
	private boolean debug = false;
	private String loginName;
	private String loginPassword;
	private int userRecNumber = 0;
  	private String userID="";
  	private String userPassword="";
	private String userFirstName="";
	private String userLastName="";
	private String userType="";
	private ResultSet myResultSet=null;
	private String query="";		
  	private String userGender = "";
  	private String userEmail = "";
  	private String userICNumber = "";
  	private String userAddress1 = "";
  	private String userAddress2 = "";
  	private String userCity = "";
  	private String userState = "";
  	private String userPostCode = "";
  	private String userCountry = "";
  	private String userOccupation = "";
  	private String userContactNumber = "";
  	private int userTotQuota = 0;
  	private int userQuotaAvailable = 0;
  	private int userTotReservation = 0;
  	private int userReserveAvailable = 0;

  	public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
  			throws ServletException, IOException {
		
		loginName = request.getParameter("loginname");
		loginPassword = request.getParameter("password"); 		
	
    	String errorMsg;
    	//String table;
    	try {
      		query = "SELECT * FROM user where userID = '" +loginName +"' and userPassword = PASSWORD('"  +loginPassword +"')";      
      		Connection connection = connectionPool.getConnection();
      		//DBResults results = DatabaseUtilities.getQueryResults(connection, query, false);
			myResultSet = DatabaseUtilities.getQueryResultSet(connection, query, false);                                            
      		connectionPool.free(connection);
      		//table = results.toHTMLTable("#FFAD00");
    	} catch(Exception e) {
      		errorMsg = "Error: " + e;    		
    	}                   	
        
        resetVariable();
                      	
    	if (myResultSet != null){
			try{
				while(myResultSet.next()) {
					userRecNumber = Integer.parseInt(myResultSet.getString("userRecNumber"));
					userID = myResultSet.getString("userID");
					userPassword = myResultSet.getString("userPassword");
					userFirstName = myResultSet.getString("userFirstName");
					userLastName = myResultSet.getString("userLastName");
					userType = myResultSet.getString("userType");
					userGender = myResultSet.getString("userGender");
					userEmail = myResultSet.getString("userEmail");
					userICNumber = myResultSet.getString("userICNumber");
					userAddress1 = myResultSet.getString("userAddress1");
					userAddress2 = myResultSet.getString("userAddress2");
					userCity = myResultSet.getString("userCity");
					userState = myResultSet.getString("userState");
					userPostCode = myResultSet.getString("userPostCode");
					userCountry = myResultSet.getString("userCountry");
					userOccupation = myResultSet.getString("userOccupation"); 
					userContactNumber = myResultSet.getString("userContactNumber");
					userTotQuota = Integer.parseInt(myResultSet.getString("userTotQuota"));
					userQuotaAvailable = Integer.parseInt(myResultSet.getString("userQuotaAvailable"));	
					userTotReservation = Integer.parseInt(myResultSet.getString("userTotReservation"));	
					userReserveAvailable = Integer.parseInt(myResultSet.getString("userReserveAvailable"));			
				}
			} catch(SQLException sqle) {
				System.err.println("Error connecting: " +sqle);		
			}
		} 
		
		if (userID != ""){		

			HttpSession session = request.getSession(true);
			
			Login login = new Login(true, userID, userType);
			session.setAttribute("login", login);	
			
			if( (userType.equals("admin")) || (userType.equals("librarian")))
			{
			User staff = new User(userRecNumber, userID, userPassword, userType, userFirstName, userLastName, 
								 userGender, userEmail, userICNumber, userAddress1, userAddress2, 
								 userCity, userState, userPostCode, userCountry, userOccupation, userContactNumber, 
								 userTotQuota, userQuotaAvailable, userTotReservation, userReserveAvailable);					
				session.setAttribute("staff", staff);
			} else {
			User user = new User(userRecNumber, userID, userPassword, userType, userFirstName, userLastName, 
								 userGender, userEmail, userICNumber, userAddress1, userAddress2, 
								 userCity, userState, userPostCode, userCountry, userOccupation, userContactNumber,
								 userTotQuota, userQuotaAvailable, userTotReservation, userReserveAvailable);	
				session.setAttribute("user", user);
			}	
			
			// Update the borrow list
			Date inputDate = new Date();
			String outputDateStr = ServletUtilities.dateToString(inputDate);
			try {
				query = "UPDATE borrowrec SET borrowStatus = 'overdue' WHERE" +
					" dueDate < '" +outputDateStr +"' and borrowStatus = 'borrow'";
      			Connection connection = connectionPool.getConnection();
				myResultSet = DatabaseUtilities.getQueryResultSet(connection, query, false);                                            
      			connectionPool.free(connection);
    		} catch(Exception e) {
      			errorMsg = "Error: " + e;    		
    		}  
    		
    		// Update the reserve list - checking the reservation cancel date
			try {
				query = "UPDATE reserverec SET reserveStatus = 'over' WHERE" +
					" reserveCancelDate < '" +outputDateStr +"'";
      			Connection connection = connectionPool.getConnection();
				myResultSet = DatabaseUtilities.getQueryResultSet(connection, query, false);                                            
      			connectionPool.free(connection);
    		} catch(Exception e) {
      			errorMsg = "Error: " + e;    		
    		}  		
    		
			
			if (debug){
				response.setContentType("text/html");
    			response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    			response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
    			PrintWriter out = response.getWriter();
    			String title = "Connection Pool Test";
    			out.println(ServletUtilities.headWithTitle(title) +
                	"<BODY BGCOLOR=\"#FDF5E6\">\n" +
                	"<CENTER>\n"); 
        		out.println("Query: " +query +"<br>");
        		out.println("userID: " +userID +"<br>");
        		out.println("userEmail: " +userEmail +"<br>");
        		out.println("outputDateStr: " +outputDateStr +"<br>");
        		out.println("query: " +query +"<br>");
        		out.println("</CENTER>\n</BODY></HTML>");
			}
			else{
				gotoPage("/mainmenu/mainmenu.jsp", request, response);
			}
		}else{
			gotoPage("/login/login_invalid.jsp", request, response);
		}		
  	}
  	
  	private void resetVariable(){
  		this.userRecNumber=0;
  	  	this.userID="";
		this.userFirstName="";
		this.userLastName="";
		this.userType="";
  	}    
}

