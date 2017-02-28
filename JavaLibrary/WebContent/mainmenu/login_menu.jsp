
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="240"> 
      <div align="center"><img src="../images/mainmenu/welcome.gif"></div>
    </td>
    <td> 
      <table width="100%" border="0" cellspacing="2" cellpadding="0">
        <tr> 
          <td width="19"><img src="../images/common/button.gif"></td>
          <td width="100%"><a href="../search/search_libraryitem.jsp">Search</a></td>
        </tr>
        <tr> 
          <td width="19"><img src="../images/common/button.gif"></td>
          <td width="100%"><a href="../user/myaccount.jsp">Check My Account</a></td>
        </tr>
        <tr> 
          <td width="19">&nbsp;</td>
          <td width="100%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="19"><img src="../images/common/button.gif"></td>
          <td width="100%"><a href="/JavaLibrary/servlet/sjservlets.LogoutProcess">Logout</a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p><br>
  <%	
	// Display the login user ID
	if((login.getUserType()).equals("admin")) {
		//out.println("<i>U had login as ADMIN access level</i><p>");
		out.println("G'Day <b>" +staff.getUserFirstName() +", " +staff.getUserLastName() +" </b> (<i>Admin</i>)");
	} else if((login.getUserType()).equals("librarian")) {
		//out.println("<i>U had login as LIBRARIAN access level</i><p>");
		out.println("G'Day <b>" +staff.getUserFirstName() +", " +staff.getUserLastName() +" </b> (<i>Librarian</i>)");
	} else{
		out.println("G'Day <b>" +user.getUserFirstName() +", " +staff.getUserLastName() +"</b>");
	}
%>
  <br>
  <br>
  <%

int numberOfOverDueRec = 0;
int numberOfReserveAvailable = 0;
String query = "";
String errorMsg="";
ResultSet myResultSet = null;

// Calculate the total number of overdue borrow record and number of reserve item that had available already
// And display the result as notice.

query = "SELECT count(*) FROM `borrowrec` where borrowStatus='overdue' and borrowerID='" +login.getUserID() +"'"; 
try {  
	Connection connection = connectionPool.getConnection();
	myResultSet = DatabaseUtilities.getQueryResultSet(connection, query, false);                                        
    connectionPool.free(connection);
} catch(Exception e) {
	errorMsg = "Error: " + e;    		
}            	

if (myResultSet != null){
	try{
		while(myResultSet.next()) {
			numberOfOverDueRec = Integer.parseInt(myResultSet.getString("count(*)"));
		}
	} catch(SQLException sqle) {
		System.err.println("Error connecting: " +sqle);		
	}
}   

query = "SELECT count(*) FROM `reserverec` where reserveStatus='available' and reserverID = '" +login.getUserID() +"'";
try {  
	Connection connection = connectionPool.getConnection();
	myResultSet = DatabaseUtilities.getQueryResultSet(connection, query, false);                                        
    connectionPool.free(connection);
} catch(Exception e) {
	errorMsg = "Error: " + e;    		
}            	

if (myResultSet != null){
	try{
		while(myResultSet.next()) {
			numberOfReserveAvailable = Integer.parseInt(myResultSet.getString("count(*)"));
		}
	} catch(SQLException sqle) {
		System.err.println("Error connecting: " +sqle);		
	}
}   
if ((numberOfOverDueRec !=0) || (numberOfReserveAvailable !=0)){
	out.println("<ul>");
	if (numberOfOverDueRec != 0) 
		out.println("<li>You have <i>" +numberOfOverDueRec +" </i>over due items not yet return!</li>");
	if (numberOfReserveAvailable != 0)
		out.println("<li>You have <i>" +numberOfReserveAvailable +" </i>reserve items available now!</li>"); 
	out.println("</ul><hr>");
}
%>

