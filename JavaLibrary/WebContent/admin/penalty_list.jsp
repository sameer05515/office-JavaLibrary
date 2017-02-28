<%@ include file="/common/common.jsp" %>
<%@ include file="../common/dbconnect.jsp" %>
<jsp:setProperty name="form" property="formName" value="penalty" />
<jsp:setProperty name="form" property="formType" value="list" />
<jsp:setProperty name="form" property="formURL" value="/JavaLibrary/admin/penalty_list.jsp" />
<%  response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cahce");
// 	URLcurrent = "/JavaLibrary/admin/penalty_list.jsp";
//	URLcurrent=response.encodeURL(URLcurrent);	
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

	String borrowerID = "";

	int recDisplayNum= 0;
	String recDisplayNumStr= "";

	ResultSet myResultSet=null;
	ResultSet rsCount=null;

	int pageCurrent=0;
	int pageOffSet=0;
    String errorMsg= "";

	// Get the HTTP request parameter
	borrowerID = request.getParameter("borrowerID");
	recDisplayNumStr= request.getParameter("recDisplayNum");
	queryOrderField = request.getParameter("queryOrderField");
	queryOrderType = request.getParameter("queryOrderType");

	// Checking the HTTP request parameter
	if (recDisplayNumStr==null)
		recDisplayNum = 5;
	else
		recDisplayNum = Integer.parseInt(recDisplayNumStr);
	if (recDisplayNum <1) recDisplayNum = 1;

	if(borrowerID == null)
		borrowerID = "";

	if (!borrowerID.equals("")) 
		querySearch = " borrowerID like '%" + borrowerID +"%' ";

	if(queryOrderField ==null)
		queryOrderField ="";

	if (queryOrderType ==null)
		queryOrderType ="";

	// Generate the search query
	if((queryOrderField.equals("")) || (queryOrderType.equals("")))
		queryOrder = " ORDER BY borrowerID ASC ";
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
      <p align="center"><b>Penalty List</b><br>
        <br>
        <%@ include file="../common/printview.jsp" %>
      </p>
<%
	queryParameter="&queryOrderField=" +queryOrderField +
		"&queryOrderType=" +queryOrderType +"&recDisplayNum=" +recDisplayNum;
%>
      <form name="form1" action="../admin/penalty_list.jsp?<%= queryParameter%>" method="post">
        <center>
          Borrower ID 
          <input type="text" name="borrowerID" size="30">
          <input type="submit" name="Search" value="Search">
          <br>
        </center>
      </form>
<%		queryParameter="borrowerID="+borrowerID +"&queryOrderField=" +queryOrderField +
		"&queryOrderType=" +queryOrderType +"&borrowerID=" +borrowerID;
%>
      <form name="form2" method="post" action="../admin/penalty_list.jsp?<%= queryParameter%>">
        <input type="submit" name="Show" value="Show">
          <input type="text" name="recDisplayNum" maxlength="2" size="4" value="<%= recDisplayNum %>">
          records per page 
        </form>
<%
	queryParameter="&borrowerID=" +borrowerID +"&recDisplayNum=" +recDisplayNum;
%>
        <form name="form2" method="post" action="../admin/penalty_list.jsp">
        <i>* borrow record number for detail</i><br>

          
        <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
          <tr> 
            <th width="18%" bgcolor="#D3DCE3">Borrower ID<a href=../admin/penalty_list.jsp?&queryOrderField=borrowerID&queryOrderType=ASC&<%= queryParameter%>><br>
              <% if(queryOrderField.equals("borrowerID") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>
              </a> <a href=../admin/penalty_list.jsp?&queryOrderField=borrowerID&queryOrderType=DESC&<%= queryParameter%>> 
              <% if(queryOrderField.equals("borrowerID") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>
              </a></th>
            <th width="20%" bgcolor="#D3DCE3">Borrow Record Number*<a href=../admin/penalty_list.jsp?&queryOrderField=borrowRecNumber&queryOrderType=ASC&<%= queryParameter%>> 
              <br>
              <% if(queryOrderField.equals("borrowRecNumber") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>
              </a> <a href=../admin/penalty_list.jsp?&queryOrderField=borrowRecNumber&queryOrderType=DESC&<%= queryParameter%>> 
              <% if(queryOrderField.equals("borrowRecNumber") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>
              </a></th>
            <th width="18%" bgcolor="#D3DCE3">Overdue Day<a href=../admin/penalty_list.jsp?&queryOrderField=overdueDay&queryOrderType=ASC&<%= queryParameter%>><br>
              <% if(queryOrderField.equals("overdueDay") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>
              </a> <a href=../admin/penalty_list.jsp?&queryOrderField=overdueDay&queryOrderType=DESC&<%= queryParameter%>> 
              <% if(queryOrderField.equals("overdueDay") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>
              </a></th>
            <th width="15%" bgcolor="#D3DCE3">Penalty Amount ($)<a href=../admin/penalty_list.jsp?&queryOrderField=penaltyAmount&queryOrderType=ASC&<%= queryParameter%>><br>
              <% if(queryOrderField.equals("penaltyAmount") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>
              </a> <a href=../admin/penalty_list.jsp?&queryOrderField=penaltyAmount&queryOrderType=DESC&<%= queryParameter%>> 
              <% if(queryOrderField.equals("penaltyAmount") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>
              </a></th>
          </tr>
          <%
	queryParameter="&borrowerID=" +borrowerID + 
		"&queryOrderField=" +queryOrderField +"&queryOrderType=" +queryOrderType +"&recDisplayNum=" +recDisplayNum;
	
	// calculate the total record that will display for navigation
	String queryCount = "SELECT count(*) FROM penaltyrec" + queryCondition;
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
	query = "SELECT * FROM penaltyrec" + queryCondition + queryOrder +" limit " +pageOffSet +"," +recDisplayNum;
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
		float totalPenaltyAmount = 0;
    	if (myResultSet != null){
			int rowCount = 1 ; // set counter to separate even or odd
			try{
				while(myResultSet.next()) {
	    			if (rowCount % 2 == 0)
	       				out.println ("<tr bgcolor=#CCCCCC align=left>");
					else 
					out.println ("<tr bgcolor=#DDDDDD align=left>");
					out.println("<TD>"  +myResultSet.getString("borrowerID"));
					out.println("</TD><TD><a href='/JavaLibrary/operation/borrowrec_view.jsp?borrowRecNumber=" +myResultSet.getString("borrowRecNumber") +"'>" +myResultSet.getString("borrowRecNumber") +"</a>");
					out.println("</TD><TD>" +myResultSet.getString("overdueDay"));
					out.println("</TD><TD>" +myResultSet.getString("penaltyAmount"));
					out.println("</TD></TR>");					
					rowCount = rowCount+1;
					totalPenaltyAmount = totalPenaltyAmount + Float.parseFloat(myResultSet.getString("penaltyAmount"));					
				}
			} catch(SQLException sqle) {
				System.err.println("Error connecting: " +sqle);		
			}
		} 
%>
        </table>
        </form> 
<b>Total Penalty: $ <i><%= totalPenaltyAmount %></i></b>
		<br>    
    </td>
  </tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true" />
<% connectionPool.closeAllConnections(); %>
</body>
</html>