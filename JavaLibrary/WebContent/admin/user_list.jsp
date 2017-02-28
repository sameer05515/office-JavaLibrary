<%@ include file="/common/common.jsp" %>
<%@ include file="../common/dbconnect.jsp" %>
<jsp:setProperty name="form" property="formName" value="user" />
<jsp:setProperty name="form" property="formType" value="delete" />
<jsp:setProperty name="form" property="formURL" value="/JavaLibrary/admin/user_list.jsp" />
<%  response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cahce");
// 	URLcurrent = "/JavaLibrary/admin/user_list.jsp";
//	URLcurrent=response.encodeURL(URLcurrent);	
 	dbprocess.setProcessComplete(true);
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
<%
	// Initialize the variables
	String queryOrderField= "";
	String queryOrderType= "";
	String queryParameter= "";

	String queryFilter= "";
	String querySearch= "";
	String queryCondition= "";
	String queryOrder= "";
	String query= "";

	String userType = "";
	String userID= "";
	String searchOpt1= "";
	String userFirstName= "";
	String searchOpt2= "";
	String userLastName= "";
	int recDisplayNum= 0;
	String recDisplayNumStr= "";

	ResultSet myResultSet=null;
	ResultSet rsCount=null;

	int pageCurrent=0;
	int pageOffSet=0;
    String errorMsg= "";

	// Get the HTTP request parameter
	userType = request.getParameter("userType");
	userID = request.getParameter("userID");
	searchOpt1 = request.getParameter("searchOpt1");
	userFirstName = request.getParameter("userFirstName");
	searchOpt2 = request.getParameter("searchOpt2");
	userLastName = request.getParameter("userLastName");
	recDisplayNumStr= request.getParameter("recDisplayNum");
	queryOrderField = request.getParameter("queryOrderField");
	queryOrderType = request.getParameter("queryOrderType");

	// Checking the HTTP request parameter
	if (recDisplayNumStr==null)
		recDisplayNum = 5;
	else
		recDisplayNum = Integer.parseInt(recDisplayNumStr);
	if (recDisplayNum <1) recDisplayNum = 1;

	if (userType == null)
		userType = "all";

	if (userType.equals("all")) {
		queryFilter = "";
	} else{
		queryCondition = "";
		queryFilter = " WHERE userType = '" +userType +"'";
	}

	if(userID == null)
		userID = "";

	if (!userID.equals("")) 
		querySearch = " userID like '%" + userID +"%' ";

	if(userFirstName ==null)
		userFirstName = "";
	
	if(!userFirstName.equals("")){
		if(!querySearch.equals(""))
			querySearch = querySearch +" " +searchOpt1 +" userFirstName like '%" +userFirstName +"%' ";
		else
			querySearch = " userFirstName like '%" +userFirstName +"%' ";	
	}

	if(userLastName == null)
		userLastName = "";

	if(!userLastName.equals("")){
		if(!querySearch.equals(""))
			querySearch = querySearch +" " +searchOpt2 +" userLastName like '%" +userLastName +"%' ";
		else
			querySearch = " userLastName like '%" +userLastName +"%' ";
	}

	if(queryOrderField ==null)
		queryOrderField ="";

	if (queryOrderType ==null)
		queryOrderType ="";

	// Generate the search query
	if((queryOrderField.equals("")) || (queryOrderType.equals("")))
		queryOrder = " ORDER BY userType ASC ";
	else 
		queryOrder = " ORDER BY " +queryOrderField +" " +queryOrderType;

	if( queryFilter.equals("") ) {
		if(querySearch.equals(""))
			queryCondition = "";
		else			
			queryCondition = " where " +querySearch;
	} else {
		if (querySearch.equals(""))
			queryCondition = queryFilter;
		else
			queryCondition = queryFilter + " and " +querySearch;
	}
%>
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
        <b>User List<br>
        </b> 
      </center>
      <center>
        [<a href="../user/user_add.jsp">Add new user recod</a>] 
        <%@ include file="../common/printview.jsp" %>
<%
	queryParameter="&queryOrderField=" +queryOrderField +
		"&queryOrderType=" +queryOrderType +"&recDisplayNum=" +recDisplayNum;
%>
        <form name="form1" method="post" action="user_list.jsp?<%= queryParameter%>">
          Limiting options: 
          <select name=userType>
            <option value="all">All user records</option>
            <option value="admin">Admin</option>
            <option value="librarian">Librarian</option>
            <option value="borrower">Borrower</option>
          </select>
          <br>
          <br>
          <table width="55%" border="0">
            <tr> 
              <td width="29%">User ID</td>
              <td width="17%">&nbsp; </td>
              <td width="35%"> 
                <input type="text" name="userID" size="30">
              </td>
              <td width="19%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="29%">User First Name</td>
              <td width="17%"> 
                <select name="searchOpt1">
                  <option value="and" selected>And</option>
                  <option value="or">Or</option>
                </select>
              </td>
              <td width="35%"> 
                <input type="text" name="userFirstName" size="30">
              </td>
              <td width="19%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="29%">Use Last Namer</td>
              <td width="17%"> 
                <select name="searchOpt2">
                  <option value="and" selected>And</option>
                  <option value="or">Or</option>
                </select>
              </td>
              <td width="35%"> 
                <input type="text" name="userLastName" size="30">
              </td>
              <td width="19%"> 
                <input type="submit" name="Search" value="Search">
              </td>
            </tr>
          </table>
          </form>
</center>
<%	queryParameter="userType="+userType +"&queryOrderField=" +queryOrderField +
		"&queryOrderType=" +queryOrderType +"&userID=" +userID +"&searchOpt1=" +searchOpt1 +
		"&userFirstName=" +userFirstName +"&searchOpt2=" +searchOpt2 +"&userLastName=" +userLastName;
%>
<form name="form2" method="post" action="user_list.jsp?<%= queryParameter%>">
        <input type="submit" name="Show" value="Show">
        <input type="text" name="recDisplayNum" maxlength="2" size="4" value="<%= recDisplayNum %>">
        records per page 
</form>

<%
	queryParameter="userType="+userType +"&userID=" +userID +"&searchOpt1=" +searchOpt1 +
		"&userFirstName=" +userFirstName +"&searchOpt2=" +searchOpt2 +"&userLastName=" +userLastName +
		"&recDisplayNum=" +recDisplayNum;
%>

<form name='userList' action='/JavaLibrary/servlet/sjservlets.FormProcess'>
        <i>* click on User ID to view/edit the record</i><br>
        <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
        <tr> 
            <td width="4%"></td>
            <th width="19%" bgcolor="#D3DCE3"><b>ID*</b>
				<a href=user_list.jsp?&queryOrderField=userID&queryOrderType=ASC&<%= queryParameter%>>
				<% if(queryOrderField.equals("userID") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>	
				</a>
				<a href=user_list.jsp?&queryOrderField=userID&queryOrderType=DESC&<%= queryParameter%>>
				<% if(queryOrderField.equals("userID") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>	
				</a>
			</th>
            <th width="30%" bgcolor="#D3DCE3"><b>First Name</b>
				<a href=user_list.jsp?&queryOrderField=userFirstName&queryOrderType=ASC&<%= queryParameter%>>
				<% if(queryOrderField.equals("userFirstName") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>	
				</a>
				<a href=user_list.jsp?&queryOrderField=userFirstName&queryOrderType=DESC&<%= queryParameter%>>
				<% if(queryOrderField.equals("userFirstName") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>	
				</a>			</th>
            <th width="28%" bgcolor="#D3DCE3"><b>Last Name</b>
				<a href=user_list.jsp?&queryOrderField=userLastName&queryOrderType=ASC&<%= queryParameter%>>
				<% if(queryOrderField.equals("userLastName") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>	
				</a>
				<a href=user_list.jsp?&queryOrderField=userLastName&queryOrderType=DESC&<%= queryParameter%>>
				<% if(queryOrderField.equals("userLastName") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>	
				</a>			</th>
            <th width="19%" bgcolor="#D3DCE3"><b>User Type</b>
				<a href=user_list.jsp?&queryOrderField=userType&queryOrderType=ASC&<%= queryParameter%>>
				<% if(queryOrderField.equals("userType") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>	
				</a>
				<a href=user_list.jsp?&queryOrderField=userType&queryOrderType=DESC&<%= queryParameter%>>
				<% if(queryOrderField.equals("userType") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>	
				</a>			</th>
        </tr>


<%
	queryParameter="userType="+userType +"&queryOrderField=" +queryOrderField +
		"&queryOrderType=" +queryOrderType +"&userID=" +userID +"&searchOpt1=" +searchOpt1 +
		"&userFirstName=" +userFirstName +"&searchOpt2=" +searchOpt2 +"&userLastName=" +userLastName +
		"&recDisplayNum=" +recDisplayNum;

	// calculate the total record that will display for navigation
	String queryCount = "SELECT count(*) FROM user" + queryCondition;
   	try {  
      		Connection connection = connectionPool.getConnection();
			rsCount=DatabaseUtilities.getQueryResultSet(connection, queryCount, false);                                           
      		connectionPool.free(connection);
    	} catch(Exception e) {
      		errorMsg = "Error: " + e;    		
    	}  

		int recCount=0;  
		while (rsCount.next()){
			recCount=rsCount.getInt(1);
		}

		int pageCount = (recCount+recDisplayNum-1)/recDisplayNum;
		String strPage;
		strPage=request.getParameter("pageCurrent");
		if (strPage==null){
			pageCurrent = 1;
		} else{
			pageCurrent=Integer.parseInt(strPage);
		}
		if (pageCurrent<1) pageCurrent=1;
			pageOffSet=(pageCurrent-1)*recDisplayNum;
		
	// Get the request record result from search query
	query = "SELECT * FROM user" + queryCondition + queryOrder +" limit " +pageOffSet +"," +recDisplayNum;

  		try {  
      		Connection connection = connectionPool.getConnection();
			myResultSet = DatabaseUtilities.getQueryResultSet(connection, query, false);                                        
      		connectionPool.free(connection);
    	} catch(Exception e) {
      		errorMsg = "Error: " + e;    		
    	}            	
%>
	<%@ include file="/common/page_count.jsp" %>
<%
	// Display the search result 
   	if (myResultSet != null){
			int rowCount = 1 ; // set counter to separate even or odd
			try{
				while(myResultSet.next()) {
	    			if (rowCount % 2 == 0)
	       				out.println ("<tr bgcolor=#CCCCCC align=left><td>");
					else 
					out.println ("<tr bgcolor=#DDDDDD align=left><td>");
					if((login.getUserType().equals("admin"))){
						out.println("<input type=\"checkbox\" name=\"del_rec\" value=\"" +myResultSet.getString("userRecNumber") +"\">");
					}else{
						//out.println("</TD>&nbsp<TD>");
					}
					out.println("</TD><TD><a href='/JavaLibrary/user/user_edit.jsp?userRecNumber=" +myResultSet.getString("userRecNumber") +"'>" +myResultSet.getString("userID") +"</a>");
					out.println("</TD><TD>" +myResultSet.getString("userFirstName"));
					out.println("</TD><TD>" +myResultSet.getString("userLastName"));
					out.println("</TD><TD>" +myResultSet.getString("userType"));
					out.println("</TD></TR>");
					rowCount = rowCount+1;					
				}
			} catch(SQLException sqle) {
				System.err.println("Error connecting: " +sqle);		
			}
		} 
%>
      </table>
<% if((login.getUserType().equals("admin"))){ 
%>
        <p>&nbsp; <img src="../images/common/arrow_ltr.gif" width="38" height="22">With 
          selected: 
          <input type='submit' name='Delete' value='Delete'>
          Or 
          <input type='reset' name='Reset' value='Reset'>
        </p>
<% } %>
      </form>
<br>
		</td>
  </tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true" />
<% connectionPool.closeAllConnections(); %>
</body>
</html>