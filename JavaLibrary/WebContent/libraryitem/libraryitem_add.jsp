<%@ include file="../common/common.jsp" %>
<%@ include file="../common/dbconnect.jsp" %>
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
<script type=text/javascript>
function houseKeeping() {
}
</script>

<body bgcolor="#0099ff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="" body onunload="houseKeeping();">
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
	<%
		// Get the next index number which use as part of new Item Call Number
		ResultSet rsCount=null;
		String errorMsg;
		String queryCount = "SELECT MAX(itemRecNumber) as itemRecNumber FROM libraryitem";
    	try {  
      		Connection connection = connectionPool.getConnection();
			rsCount=DatabaseUtilities.getQueryResultSet(connection, queryCount, false);                                           
      		connectionPool.free(connection);
    	} catch(Exception e) {
      		errorMsg = "Error: " + e;    		
    	}  

		while (rsCount.next()){
			nextRecNumber=rsCount.getInt(1) + 1;
		}
		libraryitem.resetVariable();
	%>
		
      <p align="center"><b>Add Items</b></p>
		<jsp:setProperty name="form" property="formName" value="libraryitem" />
		<jsp:setProperty name="form" property="formType" value="add" />
		<jsp:setProperty name="form" property="formURL" value="/JavaLibrary/libraryitem/libraryitem_add.jsp" />

		<%@ include file="../libraryitem/libraryitem_form.jsp" %>      
    </td>
  </tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true" />

</body>
</html>