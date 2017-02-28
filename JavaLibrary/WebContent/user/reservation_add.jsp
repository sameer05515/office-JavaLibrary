<%  response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cahce");
// 	URLcurrent = "/JavaLibrary/user/reservation_add.jsp";
//	URLcurrent=response.encodeURL(URLcurrent);	
%>
<%@ page import="java.util.Date, java.text.DateFormat, java.util.*" %>
<%@ include file="/common/common.jsp" %>
<%@ include file="../common/dbconnect.jsp" %>
<jsp:setProperty name="form" property="formName" value="reserve" />
<jsp:setProperty name="form" property="formType" value="add" />
<jsp:setProperty name="form" property="formURL" value="/JavaLibrary/user/reservation_add.jsp" />
<% if( (login.getUserType().equals("admin")) || (login.getUserType().equals("librarian")))
	user.setPropertyFromOtherUserBean(staff); 
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
<%!
	// decare the class level variable so if reenter the same form
	// from will get back the same value
	String itemCallNumber = "";
	String itemTitle = "";
	int itemTotAvailable = 0;
	int itemTotQuantity = 0;
	int itemTotReserve = 0;
	int itemTotBorrow = 0;
	Vector itemsReserved = new Vector();
%>
<%

String refURL = "";
refURL = request.getHeader("Referer");
// if not from current URL
if (refURL!=null){
	if((refURL.indexOf("/user/reservation_add.jsp") < 0) || (dbprocess.isProcessComplete())) {
		//reset all the class variable if not reenter the form from same URL
		itemCallNumber = "";
		itemTitle = "";
		itemTotAvailable = 0;
		itemTotQuantity = 0;
		itemTotReserve = 0;
		itemTotBorrow = 0;
		itemsReserved = new Vector();
      	dbprocess.setProcessComplete(false);  
	}
}

// Initialize the variables
String query="";
ResultSet myResultSet=null;
String errorMsg= "";
Date reserveDate = new Date();
Date reserveCancelDate = ServletUtilities.diffrenceDay(reserveDate, 7);
String reserveDateStr = DateFormat.getDateInstance(DateFormat.MEDIUM).format(reserveDate);
String reserveCancelDateStr = DateFormat.getDateInstance(DateFormat.MEDIUM).format(reserveCancelDate);
String formName="";
String itemReserve[];
String[] itemCallNumberInList;
String[] removeItem;
String itemCallNumberToRemove = "";
String reserveStatus = "queue";

// Checking the HTTP request header for formName and process the request according to each form
if(request.getParameter("formName") != null) {
	formName=request.getParameter("formName");
	if (formName.equals("resetForm")) {
		// Reset the form
		itemCallNumber = "";
		itemTitle = "";
		itemTotAvailable = 0;
		itemTotQuantity = 0;
		itemTotReserve = 0;
		itemTotBorrow = 0;
		itemsReserved = new Vector();
      	dbprocess.setProcessComplete(false);  
	} else if (formName.equals("itemCallNumber")) {
		itemCallNumber = request.getParameter("itemCallNumber");
		if (itemCallNumber == null)
			itemCallNumber = "";
		if( !(itemCallNumber.equals("")) ) {
			// Reset all the value
			itemTitle = ""; itemTotAvailable = 0; itemTotQuantity = 0; itemTotReserve =0; itemTotBorrow=0;
			query = "SELECT * FROM libraryitem WHERE itemCallNumber ='" +itemCallNumber +"'";
			try {  
     	 		Connection connection = connectionPool.getConnection();
				myResultSet = DatabaseUtilities.getQueryResultSet(connection, query, false);                                        
    			connectionPool.free(connection);
   	 		} catch(Exception e) {
     			errorMsg = "Error: " + e;    		
    		}      
				
			itemCallNumber=""; 
    		if (myResultSet != null){
				try{
					while(myResultSet.next()) {
						itemCallNumber = myResultSet.getString("itemCallNumber");
						itemTitle = myResultSet.getString("itemTitle");
						itemTotAvailable = Integer.parseInt(myResultSet.getString("itemTotAvailable"));
						itemTotQuantity = Integer.parseInt(myResultSet.getString("itemTotQuantity"));
						itemTotReserve = Integer.parseInt(myResultSet.getString("itemTotReserve"));
						itemTotBorrow = Integer.parseInt(myResultSet.getString("itemTotBorrow"));					
					}
				} catch(SQLException sqle) {
					System.err.println("Error connecting: " +sqle);		
				}
			}
			if(itemCallNumber.equals(""))
				errorMsg = "Error: item call number not found!";
			if( (itemTotAvailable >0) && (itemTotReserve < itemTotAvailable) ) {
				errorMsg = "Error: item call number " +itemCallNumber +" currently are available in library";
				itemCallNumber=""; itemTitle=""; itemTotAvailable=0; 
				itemTotQuantity=0; itemTotReserve=0; itemTotBorrow=0;
			}
		}
	} else if (formName.equals("addToList")) {
		itemCallNumber = request.getParameter("itemCallNumber");
		itemTitle = request.getParameter("itemTitle");
		boolean itemInList = false;
			itemReserve = new String[2];
			itemReserve[0] = itemCallNumber;
			itemReserve[1] = itemTitle;
		if (itemsReserved.size()==0) {
			itemsReserved.addElement(itemReserve);
		} else{
			for(int i=0; i<itemsReserved.size(); i++){
				itemCallNumberInList = (String[])itemsReserved.elementAt(i);
				if(itemCallNumber.equals(itemCallNumberInList[0])) {
					itemInList = true;
				}
			}
			if(!itemInList)
				itemsReserved.addElement(itemReserve);
		}
	} else if(formName.equals("removeFromList")) {
		if(request.getParameter("removeItem") != null) {
			String[] paramValues = request.getParameterValues("removeItem");
			for(int x = 0; x<paramValues.length; x++) {
				itemCallNumberToRemove = paramValues[x];
				for(int y=0; y<itemsReserved.size(); y++){
					itemCallNumberInList = (String[])itemsReserved.elementAt(y);
					if(itemCallNumberToRemove.equals(itemCallNumberInList[0])) {
						itemsReserved.removeElementAt(y);
					}
				}
			}
		}
	} else {
		if(user.getUserReserveAvailable() < itemsReserved.size()) { 
			errorMsg="Error: user do not have any available reservation quota left!";
		} else if(itemsReserved.size()<=0) {
			errorMsg="Error: That is nothing in the reserve list";
		} else {
%>
			<jsp:forward page="/servlet/sjservlets.FormProcess">
			</jsp:forward>
<%		}
	}
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
      <p align="center"><b>Add Reservation</b></p>
      <center>
        <table width="75%" border="0">
          <tr> 
            <td width="25%">User ID: <%= user.getUserID() %></td>
            <td width="25%">Reservation Available: <%=user.getUserReserveAvailable() %> / <%=user.getUserTotReservation() %> </td>
          </tr>
          <tr> 
            <td width="25%">Today: 
              <% out.println(reserveDateStr); %>
            </td>
            <td width="25%">Reserve until (one week): 
              <% out.println(reserveCancelDateStr); %>
            </td>
          </tr>
        </table>
        <br>
      </center>
      <center><font color=RED><% out.println("<font color=RED><b><i>" +errorMsg +"</i></b></font>"); %></font></center>
      <hr>
      <table width="100%" border="0" bgcolor="#66FFCC">
        <tr>
          <td> 
            <form action="reservation_add.jsp" name="form1" method="post">
              <p>Item Call Number: 
                <input type="text" name="itemCallNumber" size="22" maxlength="20">
                <input type="submit" name="submit" value="Search">
              </p>
              <table width="100%" border="1" cellspacing="1" cellpadding="1">
                <tr> 
                  <th width="19%">Call Number</th>
                  <th width="47%">Title</th>
                  <th width="9%">Total Quantity</th>
                  <th width="9%">Total Available</th>
                  <th width="8%">Total Borrow</th>
                  <th width="8%">Total Reserve</th>
                </tr>
                <tr> 
                  <td width="19%">
                    <% if(itemCallNumber.equals("")){
							out.println("-");
						} else {		
							out.println(itemCallNumber);
						}
					%>
				  </td>
                  <td width="47%">
				  <% 
					if(itemCallNumber.equals("")){
						out.println("-");
					} else {		
						out.println(itemTitle);
					}
				  %>
                  </td>
                  <td width="9%">
                    <% 
					if(itemCallNumber.equals("")){
						out.println("-");
					} else {		
						out.println(itemTotQuantity);
					}
				  %>
                  </td>
                  <td width="9%">
                    <% 
					if(itemCallNumber.equals("")){
						out.println("-");
					} else {		
						out.println(itemTotAvailable);
					}
				  %>
                  </td>
                  <td width="8%">
                    <% 
					if(itemCallNumber.equals("")){
						out.println("-");
					} else {		
						out.println(itemTotBorrow);
					}
				  %>
                  </td>
                  <td width="8%">
                    <% 
					if(itemCallNumber.equals("")){
						out.println("-");
					} else {		
						out.println(itemTotReserve);
					}
				  %>
                  </td>
                </tr>
              </table>

			<input type="hidden" name="formName" value="itemCallNumber">
            </form>
            <form name="form2" action="reservation_add.jsp" method="post">
              <% if (!(itemCallNumber.equals(""))){ %>
              <input type="hidden" name="formName" value="addToList">
              <input type="hidden" name="itemCallNumber" value="<%= itemCallNumber %>">
              <input type="hidden" name="itemTitle" value="<%=itemTitle %>">
              <input type="submit" name="submit" value="Add to reserve list">
              <%	} %>
            </form></td>
        </tr>
      </table>
      <hr>
      <table width="100%" border="0" bgcolor="#66FFCC">
        <tr> 
          <td> 
            <form name="form3" action="reservation_add.jsp" method="post">
              <p align="center"><b> Reservation Lists</b></p>
              <table width="100%" border="1" cellspacing="1" cellpadding="1">
                <tr> 
                  <th width="4%">&nbsp;</th>
                  <th width="21%">Call Number</th>
                  <th width="75%">Title</th>
                </tr>
				<%
				if(itemsReserved.size() > 0){
					for(int i=0; i<itemsReserved.size(); i++){
						itemCallNumberInList = (String[])itemsReserved.elementAt(i);
						out.println("<tr><td width='4%'>");
						out.println("<input type=\"checkbox\" name=\"removeItem\" value=\"" +itemCallNumberInList[0] +"\">");
						out.println("</td>");
		
						out.println("<td width='21%'>");
						out.println(itemCallNumberInList[0]);
						out.println("</td>");

						out.println("<td width='75%'>");
						out.println(itemCallNumberInList[1]);
						out.println("</td></tr>");
					}
				}
				%>
              </table>
			  <input type="hidden" name="formName" value="removeFromList">
              <br>
              <img src="../images/common/arrow_ltr.gif" width="38" height="22">With 
              selected: 
              <input type='submit' name='clearList' value='Remove From List'>
            </form>
          </td>
        </tr>
      </table>
      
<hr>
<table width="100%" border="0" bgcolor="#66FF99">
        <tr>
          <td> 
            <table width="23%" border="0" align="center">
              <tr>
                  
                <td width="17%"> 
                  <form name="form4" method="post" action="reservation_add.jsp">
                    <% for(int i=0; i<itemsReserved.size(); i++){
					itemCallNumberInList = (String[])itemsReserved.elementAt(i);
					out.println("<input type='hidden' name='itemCallNumber' value='" +itemCallNumberInList[0] +"'>");
					}
				%>
				<input type="hidden" name="formName" value="processToBorrow">
				<input type="hidden" name="reserverID" value="<%= user.getUserID() %>">
				<input type="hidden" name="reserverEmail" value="<%= user.getUserEmail() %>">
				<input type="hidden" name="reserveDate" value="<%= ServletUtilities.dateToString(reserveDate) %>">
				<input type="hidden" name="reserveCancelDate" value="<%= ServletUtilities.dateToString(reserveCancelDate) %>">
				<input type="hidden" name="reserveStatus" value="<%= reserveStatus %>">
                    <input type="submit" name="submit" value="Process to reserve">
              </form>  </td>
                <td width="83%">            
                  <form name="form5" method="post" action="reservation_add.jsp">
                    <input type="hidden" name="formName" value="resetForm">
              <input type="submit" name="Submit" value="Reset Form">
            </form>
                 </td>
                </tr>
              </table>
             

 
          </td>
        </tr>
      </table>
          </td>
        </tr>
      </table>
    <jsp:include page="../common/footer.jsp" flush="true" />
<% connectionPool.closeAllConnections(); %>
</body>
</html>