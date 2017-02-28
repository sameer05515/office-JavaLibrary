<%@ include file="/common/common.jsp" %>
<%@ include file="../common/dbconnect.jsp" %>
<% 	URLcurrent = "/JavaLibrary/admin/user_list.jsp";
	URLcurrent=response.encodeURL(URLcurrent);
%>
<html>
<head>
<title>Library Management System</title>
<META NAME="description" CONTENT="">
<META NAME="keywords" CONTENT="">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
   A:link                  { text-decoration:  none; font-weight: bold; color: #660033}
   A:active                { text-decoration:  none; font-weight: bold; color: #660033}
   A:visited               { text-decoration:  none; font-weight: bold; color: #336699}
   A:hover                 { text-decoration:  underline; font-weight: bold; color: #FF9999}
.footerLink {  font-family: Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: bold; color: #000099}
-->
</style>
</head>

<body bgcolor="#0099ff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="">
<a name="top"></a> 
<%@ include file="../common/header_select.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="#f1f1f1"> 
    <td width="180" align="left" valign="top"> 
	  	  <%@ include file = "../common/navi.jsp" %>
    </td>
        <TD width=1 bgColor=#999999><IMG height=1 alt="" 
      src="../images/common/1ptrans.gif" 
      width=1 border=0></TD>
    <td valign="top" width="100%" bgcolor="#f1f1f1"> 
      <center>

<jsp:setProperty name="form" property="formName" value="user" />
<jsp:setProperty name="form" property="formType" value="edit" />
<jsp:setProperty name="form" property="formURL" value="/JavaLibrary/user/user_edit.jsp" />
<% user.resetVariable(); %>
<% 
	int userRecNumber = Integer.parseInt(request.getParameter("userRecNumber"));
	String query;
	ResultSet myResultSet=null;
    String errorMsg;

	// Retrieve the database according to the parameter pass by HTTP request 
	query = ("SELECT * FROM user WHERE userRecNumber = " +userRecNumber); 
    	try {  
      		Connection connection = connectionPool.getConnection();
			myResultSet = DatabaseUtilities.getQueryResultSet(connection, query, false);                                            
      		connectionPool.free(connection);
    	} catch(Exception e) {
      		errorMsg = "Error: " + e;    		
    	}  
           	
		// Save the information to user java bean
    	if (myResultSet != null){
			try{
				while(myResultSet.next()) {
				user.setUserRecNumber(Integer.parseInt(myResultSet.getString("userRecNumber")));
				user.setUserID(myResultSet.getString("userID"));
				user.setUserPassword(myResultSet.getString("userPassword"));
				user.setUserFirstName(myResultSet.getString("userFirstName"));
				user.setUserLastName(myResultSet.getString("userLastName"));
				user.setUserType(myResultSet.getString("userType"));
				user.setUserGender(myResultSet.getString("userGender"));
				user.setUserEmail(myResultSet.getString("userEmail"));
				user.setUserICNumber(myResultSet.getString("userICNumber"));
				user.setUserAddress1(myResultSet.getString("userAddress1"));
				user.setUserAddress2(myResultSet.getString("userAddress2"));
				user.setUserCity(myResultSet.getString("userCity"));
				user.setUserState(myResultSet.getString("userState"));
				user.setUserPostCode(myResultSet.getString("userPostCode"));
				user.setUserCountry(myResultSet.getString("userCountry"));
				user.setUserOccupation(myResultSet.getString("userOccupation")); 
				user.setUserContactNumber(myResultSet.getString("userContactNumber"));
				user.setUserTotQuota(Integer.parseInt(myResultSet.getString("userTotQuota")));
				user.setUserQuotaAvailable(Integer.parseInt(myResultSet.getString("userQuotaAvailable")));
				user.setUserTotReservation(Integer.parseInt(myResultSet.getString("userTotReservation")));
				user.setUserReserveAvailable(Integer.parseInt(myResultSet.getString("userReserveAvailable")));
				}
			} catch(SQLException sqle) {
				System.err.println("Error connecting: " +sqle);		
			}
		} 
%>  

<% 	String userType = user.getUserType();
	String loginUserType = login.getUserType();
	String loginUserID = login.getUserID();

	String title1 = "<b>Edit User</b><br><br>";
	String title2 = "<b>View User</b><br><br>" +
		"<font color=red>U can view this record but<br>" +
		"U don't have sufficient security right to edit it!</font><br>" +
		"<i>Librarian security level limited to edit borrower and self record only</i><br>";

	if( (loginUserType.equals("admin")) || debug ) {
		out.println(title1); 
	} else if(form.getFormURL().equals("/JavaLibrary/user/myaccount.jsp")) {
		out.println(title1);
	}else if( (loginUserType.equals("librarian"))) {
		if ( (user.getUserType().equals("borrower")) ||  (loginUserID.equals(user.getUserID())))
			out.println(title1);
		else
			out.println(title2);
	}
%>
</center><br>
 		<%@ include file="../user/user_form.jsp" %>
<br>
		</td>
  </tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true" />
<% connectionPool.closeAllConnections(); %>
</body>
</html>