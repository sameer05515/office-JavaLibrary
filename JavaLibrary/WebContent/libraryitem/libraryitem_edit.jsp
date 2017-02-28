<%@ include file="/common/common.jsp" %>
<%@ include file="../common/dbconnect.jsp" %>
<% 	URLcurrent = "/JavaLibrary/admin/libraryitem_list.jsp";
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
      <p align="center"><b>Edit Items</b></p>

<jsp:setProperty name="form" property="formName" value="libraryitem" />
<jsp:setProperty name="form" property="formType" value="edit" />
<jsp:setProperty name="form" property="formURL" value="/JavaLibrary/libraryitem/libraryitem_edit.jsp" />
<% libraryitem.resetVariable(); %>
        <% 
	int itemRecNumber = Integer.parseInt(request.getParameter("itemRecNumber"));
	String query;
	ResultSet myResultSet=null;
    String errorMsg;

	// Get the require item data from database
	query = ("SELECT * FROM libraryitem WHERE itemRecNumber = " +itemRecNumber); 
    	try {  
      		Connection connection = connectionPool.getConnection();
			myResultSet = DatabaseUtilities.getQueryResultSet(connection, query, false);                                            
      		connectionPool.free(connection);
    	} catch(Exception e) {
      		errorMsg = "Error: " + e;    		
    	}          

		// save the data to libraryitem java bean which will be use in the form for editing
    	if (myResultSet != null){
			try{
				while(myResultSet.next()) {
				libraryitem.setItemRecNumber(Integer.parseInt(myResultSet.getString("itemRecNumber")));
				libraryitem.setItemCallNumber(myResultSet.getString("itemCallNumber"));
				libraryitem.setItemCategory(myResultSet.getString("itemCategory"));
				libraryitem.setItemSubject(myResultSet.getString("itemSubject"));
				libraryitem.setItemMediaType(myResultSet.getString("itemMediaType"));
				libraryitem.setItemLanguage(myResultSet.getString("itemLanguage"));
				libraryitem.setItemTitle(myResultSet.getString("itemTitle"));
				libraryitem.setItemBriefDesc(myResultSet.getString("itemBriefDesc"));
				libraryitem.setItemAuthor(myResultSet.getString("itemAuthor"));
				libraryitem.setItemKeyword(myResultSet.getString("itemKeyword"));
				libraryitem.setItemPublisherName(myResultSet.getString("itemPublisherName"));
				libraryitem.setItemISBN(myResultSet.getString("itemISBN"));
				libraryitem.setItemLength(myResultSet.getString("itemLength"));
				libraryitem.setItemYear(myResultSet.getString("itemYear"));
				libraryitem.setItemTotQuantity(Integer.parseInt(myResultSet.getString("itemTotQuantity")));
				libraryitem.setItemTotAvailable(Integer.parseInt(myResultSet.getString("itemTotAvailable")));
				libraryitem.setItemTotBorrow(Integer.parseInt(myResultSet.getString("itemTotBorrow")));
				libraryitem.setItemTotReserve(Integer.parseInt(myResultSet.getString("itemTotReserve")));
				}
			} catch(SQLException sqle) {
				System.err.println("Error connecting: " +sqle);		
			}
		} 
%>  
		<%@ include file="../libraryitem/libraryitem_form.jsp" %>
      <br>
		</td>
  </tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true" />
<% connectionPool.closeAllConnections(); %>
</body>
</html>