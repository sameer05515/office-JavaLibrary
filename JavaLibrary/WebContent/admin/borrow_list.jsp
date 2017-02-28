<%@ include file="/common/common.jsp" %>
<%@ include file="../common/dbconnect.jsp" %>
<jsp:setProperty name="form" property="formName" value="borrow" />
<jsp:setProperty name="form" property="formType" value="list" />
<jsp:setProperty name="form" property="formURL" value="/JavaLibrary/admin/borrow_list.jsp" />
<%  response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cahce");
// 	URLcurrent = "/JavaLibrary/admin/borrow_list.jsp";
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
	// Initialize the variable
	String queryOrderField= "";
	String queryOrderType= "";
	String queryParameter= "";

	String queryFilter= "";
	String querySearch= "";
	String queryCondition= "";
	String queryOrder= "";
	String query= "";

	String borrowStatus = "";
	String borrowerID = "";
	String searchOpt1= "";
	String itemCallNumber = "";

	int recDisplayNum= 0;
	String recDisplayNumStr= "";

	ResultSet myResultSet=null;
	ResultSet rsCount=null;

	int pageCurrent=0;
	int pageOffSet=0;
    String errorMsg= "";

	// Get the HTTP request parameter
	borrowStatus = request.getParameter("borrowStatus");
	borrowerID = request.getParameter("borrowerID");
	itemCallNumber = request.getParameter("itemCallNumber");
	searchOpt1 = request.getParameter("searchOpt1");
	recDisplayNumStr= request.getParameter("recDisplayNum");
	queryOrderField = request.getParameter("queryOrderField");
	queryOrderType = request.getParameter("queryOrderType");

	// Checking the HTTP request parameter
	if (recDisplayNumStr==null)
		recDisplayNum = 5;
	else
		recDisplayNum = Integer.parseInt(recDisplayNumStr);
	if (recDisplayNum <1) recDisplayNum = 1;

	if (borrowStatus == null)
		borrowStatus = "all";
	
	if (borrowStatus.equals("all")) {
		queryFilter = "";
	} else {
		queryCondition = "";
		queryFilter = " WHERE borrowStatus = '" +borrowStatus +"'";
	}

	if(borrowerID == null)
		borrowerID = "";

	if (!borrowerID.equals("")) 
		querySearch = " borrowerID like '%" + borrowerID +"%' ";

	if(itemCallNumber ==null)
		itemCallNumber = "";
	
	if(!itemCallNumber.equals("")){
		if(!querySearch.equals(""))
			querySearch = querySearch +" " +searchOpt1 +" itemCallNumber like '%" +itemCallNumber +"%' ";
		else
			querySearch = " itemCallNumber like '%" +itemCallNumber +"%' ";	
	}

	// Generate the search query
	if(queryOrderField ==null)
		queryOrderField ="";

	if (queryOrderType ==null)
		queryOrderType ="";

	if((queryOrderField.equals("")) || (queryOrderType.equals("")))
		queryOrder = " ORDER BY itemCallNumber ASC ";
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
      <p align="center"><b>Borrow List</b> </p>
<%
	queryParameter="&queryOrderField=" +queryOrderField +
		"&queryOrderType=" +queryOrderType +"&recDisplayNum=" +recDisplayNum;
%>
      <form name="form1" action="../admin/borrow_list.jsp?<%= queryParameter%>" method="post">
        <center>
          <p>Limiting options: 
            <select name=borrowStatus>
              <option value="all">All borrow records</option>
              <option value="overdue">Over Due</option>
              <option value="borrow">Borrow Out</option>
              <option value="return">Had Return</option>
            </select>
          </p>
          <table width="55%" border="0">
            <tr> 
              <td width="29%">Borrower ID</td>
              <td width="17%">&nbsp; </td>
              <td width="35%"> 
                <input type="text" name="borrowerID" size="30">
              </td>
              <td width="19%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="29%">Item Call Number</td>
              <td width="17%"> 
                <select name="searchOpt1">
                  <option value="and" selected>And</option>
                  <option value="or">Or</option>
                </select>
              </td>
              <td width="35%"> 
                <input type="text" name="itemCallNumber" size="30">
              </td>
              <td width="19%"> 
                <input type="submit" name="Search" value="Search">
              </td>
            </tr>
          </table>
        </center>
      </form>
<%		queryParameter="borrowStatus="+borrowStatus +"&queryOrderField=" +queryOrderField +
		"&queryOrderType=" +queryOrderType +"&borrowerID=" +borrowerID +"&searchOpt1=" +searchOpt1 +
		"&itemCallNumber=" +itemCallNumber;
%>
      <form name="form2" method="post" action="../admin/borrow_list.jsp?<%= queryParameter%>">
        <input type="submit" name="Show" value="Show">
          <input type="text" name="recDisplayNum" maxlength="2" size="4" value="<%= recDisplayNum %>">
          records per page 
        </form>
<%
	queryParameter="borrowStatus="+borrowStatus +"&borrowerID=" +borrowerID +
		"&searchOpt1=" +searchOpt1 +"&itemCallNumber=" +itemCallNumber +"&recDisplayNum=" +recDisplayNum;
%>
        <form name="form2" method="post" action="../admin/borrow_list.jsp">
        <i>* click on Borrower ID to sent email for notice</i><br>

          
        <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
          <tr> 
            <th width="18%" bgcolor="#D3DCE3">Borrower ID<a href=../admin/borrow_list.jsp?&queryOrderField=borrowerID&queryOrderType=ASC&<%= queryParameter%>><br>
              <% if(queryOrderField.equals("borrowerID") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>
              </a> <a href=../admin/borrow_list.jsp?&queryOrderField=borrowerID&queryOrderType=DESC&<%= queryParameter%>> 
              <% if(queryOrderField.equals("borrowerID") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>
              </a></th>
            <th width="20%" bgcolor="#D3DCE3">Item Call No<a href=../admin/borrow_list.jsp?&queryOrderField=itemCallNumber&queryOrderType=ASC&<%= queryParameter%>><br>
              <% if(queryOrderField.equals("itemCallNumber") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>
              </a> <a href=../admin/borrow_list.jsp?&queryOrderField=itemCallNumber&queryOrderType=DESC&<%= queryParameter%>> 
              <% if(queryOrderField.equals("itemCallNumber") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>
              </a></th>
            <th width="18%" bgcolor="#D3DCE3">Borrow Date<a href=../admin/borrow_list.jsp?&queryOrderField=borrowDate&queryOrderType=ASC&<%= queryParameter%>><br>
              <% if(queryOrderField.equals("borrowDate") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>
              </a> <a href=../admin/borrow_list.jsp?&queryOrderField=borrowDate&queryOrderType=DESC&<%= queryParameter%>> 
              <% if(queryOrderField.equals("borrowDate") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>
              </a></th>
            <th width="15%" bgcolor="#D3DCE3">Due Date<a href=../admin/borrow_list.jsp?&queryOrderField=dueDate&queryOrderType=ASC&<%= queryParameter%>><br>
              <% if(queryOrderField.equals("dueDate") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>
              </a> <a href=../admin/borrow_list.jsp?&queryOrderField=dueDate&queryOrderType=DESC&<%= queryParameter%>> 
              <% if(queryOrderField.equals("dueDate") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>
              </a></th>
            <th width="17%" bgcolor="#D3DCE3">Return Date<a href=../admin/borrow_list.jsp?&queryOrderField=returnDate&queryOrderType=ASC&<%= queryParameter%>><br>
              <% if(queryOrderField.equals("returnDate") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>
              </a> <a href=../admin/borrow_list.jsp?&queryOrderField=returnDate&queryOrderType=DESC&<%= queryParameter%>> 
              <% if(queryOrderField.equals("returnDate") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>
              </a></th>
            <th width="12%" bgcolor="#D3DCE3">Status<a href=../admin/borrow_list.jsp?&queryOrderField=borrowStatus&queryOrderType=ASC&<%= queryParameter%>><br>
              <% if(queryOrderField.equals("borrowStatus") && queryOrderType.equals("ASC")) 
					out.println("<img src='../images/common/icon_sort_up_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_up_off.gif' width='20' height='7' border='0'>");
				%>
              </a> <a href=../admin/borrow_list.jsp?&queryOrderField=borrowStatus&queryOrderType=DESC&<%= queryParameter%>> 
              <% if(queryOrderField.equals("borrowStatus") && queryOrderType.equals("DESC")) 
					out.println("<img src='../images/common/icon_sort_down_on.gif' width='20' height='7' border='0'>");
					else
					out.println("<img src='../images/common/icon_sort_down_off.gif' width='20' height='7' border='0'>");
				%>
              </a></th>
          </tr>
<%
	queryParameter="borrowStatus="+borrowStatus +"&borrowerID=" +borrowerID + 
		"&searchOpt1=" +searchOpt1 +"&itemCallNumber=" +itemCallNumber +
		"&queryOrderField=" +queryOrderField +"&queryOrderType=" +queryOrderType +"&recDisplayNum=" +recDisplayNum;
	

	// Get the total record number to display for navigation
	String queryCount = "SELECT count(*) FROM borrowrec" + queryCondition;
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
	query = "SELECT * FROM borrowrec" + queryCondition + queryOrder +" limit " +pageOffSet +"," +recDisplayNum;
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
	       				out.println ("<tr bgcolor=#CCCCCC align=left>");
					else 
					out.println ("<tr bgcolor=#DDDDDD align=left>");
					out.println("<TD><a href='mailto:" +myResultSet.getString("borrowerEmail") +"'>" +myResultSet.getString("borrowerID") +"</a>");
					out.println("</TD><TD><a href='/JavaLibrary/libraryitem/libraryitem_view.jsp?itemCallNumber=" +myResultSet.getString("itemCallNumber") +"'>" +myResultSet.getString("itemCallNumber") +"</a>");
					out.println("</TD><TD>" +myResultSet.getString("borrowDate"));
					out.println("</TD><TD>" +myResultSet.getString("dueDate"));
					out.println("</TD><TD>" +myResultSet.getString("returnDate"));
					out.println("</TD><TD>" +myResultSet.getString("borrowStatus"));
					out.println("</TD></TR>");
					rowCount = rowCount+1;					
				}
			} catch(SQLException sqle) {
				System.err.println("Error connecting: " +sqle);		
			}
		} 
%>
        </table>
        </form> 
		<br>    
    </td>
  </tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true" />
<% connectionPool.closeAllConnections(); %>
</body>
</html>