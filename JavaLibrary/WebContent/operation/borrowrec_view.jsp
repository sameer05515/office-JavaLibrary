<%@ include file="/common/common.jsp" %>
<%@ include file="../common/dbconnect.jsp" %>
<% 	URLcurrent = "/JavaLibrary/operation/borrowrec_view.jsp";
	URLcurrent=response.encodeURL(URLcurrent);
%>
<%! int nextRecNumber=0; %>
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
      <p align="center"><b>View Borrow Record<br>
        </b> </p>

<jsp:setProperty name="form" property="formName" value="libraryitem" />
<jsp:setProperty name="form" property="formType" value="view" />
<jsp:setProperty name="form" property="formURL" value="/JavaLibrary/operation/borrowrec_view.jsp" />
<% libraryitem.resetVariable(); %>
        <% 
			int itemRecNumber = 0;
			String borrowRecNumber = request.getParameter("borrowRecNumber");
			String query;
			ResultSet myResultSet=null;
    		String errorMsg;


		if (borrowRecNumber != null) {
			query = ("SELECT * FROM borrowrec WHERE borrowRecNumber = " +borrowRecNumber); 

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
						borrowrec.setBorrowRecNumber(Integer.parseInt(myResultSet.getString("borrowRecNumber")));
						borrowrec.setItemCallNumber(myResultSet.getString("itemCallNumber"));
						borrowrec.setStaffIDBorrow(myResultSet.getString("staffIDBorrow"));
						borrowrec.setStaffIDReturn(myResultSet.getString("staffIDReturn"));
						borrowrec.setBorrowerID(myResultSet.getString("borrowerID"));
						borrowrec.setBorrowerEmail(myResultSet.getString("borrowerEmail"));
						borrowrec.setBorrowDate(myResultSet.getString("borrowDate"));
						borrowrec.setDueDate(myResultSet.getString("dueDate"));
						borrowrec.setReturnDate(myResultSet.getString("returnDate"));
						borrowrec.setBorrowStatus(myResultSet.getString("borrowStatus"));
					}
				} catch(SQLException sqle) {
					System.err.println("Error connecting: " +sqle);		
				}
			}
		} 

%>  
		<%@ include file="../operation/borrowrec_form_view.jsp" %>
      <br>
		</td>
  </tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true" />
<% connectionPool.closeAllConnections(); %>
</body>
</html>