<%@ include file="../common/common.jsp" %>
<%@ include file="../common/dbconnect.jsp" %>
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
<%
	if (login.isUserLogin()) { %>
	<%@ include file = "login_menu.jsp" %>
<%	} else { %>
	<%@ include file = "normal_menu.jsp" %>
<%	} %>
      <br>
      <b>
      Announcements</b> 
      <table width="100%" border="1" cellspacing="1" cellpadding="1">
        <tr>
          <td width="14%">29-Jan'2002</td>
          <td width="86%">Application estimate finish time</td>
        </tr>
        <tr>
          <td width="14%">&nbsp;</td>
          <td width="86%">Send any comments or suggestions to <a href="mailto:limsongjing@geocities.com">me</a> 
            for feedback<br>
          </td>
        </tr>
      </table>
      <p>&nbsp; </p>
    </td>
  </tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true" />
</body>
</html>