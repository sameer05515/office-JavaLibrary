<%@ include file="../common/common.jsp" %>
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
		
      <p align="center"><b>Add User</b></p>
		<jsp:setProperty name="form" property="formName" value="user" />
		<jsp:setProperty name="form" property="formType" value="add" />
		<jsp:setProperty name="form" property="formURL" value="/JavaLibrary/user/user_add.jsp" />
		<% 
			// Checking either the previous add process had complete or not
			// If had complete the resert the user bean info
			if (dbprocess.isProcessComplete())
				user.resetVariable(); 
			else
				dbprocess.setProcessComplete(true);
		%>
		<%@ include file="../user/user_form.jsp" %>      
    </td>
  </tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true" />

</body>
</html>