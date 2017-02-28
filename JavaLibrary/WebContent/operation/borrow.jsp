<%  response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cahce");
// 	URLcurrent = "/JavaLibrary/operation/borrow.jsp";
//	URLcurrent=response.encodeURL(URLcurrent);	
%>
<%@ page import="java.util.Date, java.text.DateFormat, java.util.*" %>
<%@ include file="/common/common.jsp" %>
<%@ include file="../common/dbconnect.jsp" %>
<jsp:setProperty name="form" property="formName" value="borrowrec" />
<jsp:setProperty name="form" property="formType" value="borrow" />
<jsp:setProperty name="form" property="formURL" value="/JavaLibrary/operation/borrow.jsp" />


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
	String borrowerID="";
	String userFirstName = "";
	String userEmail = "";
	int userTotQuota = 0;
	int userQuotaAvailable = 0;
	String itemCallNumber = "";
	String itemTitle = "";
	int itemTotAvailable = 0;
	int itemTotQuantity = 0;
	int itemTotReserve = 0;
	int itemTotBorrow = 0;
	Vector itemsBorrowed = new Vector();
%>
<%

String refURL = "";
refURL = request.getHeader("Referer");
// if not from current URL
if (refURL!=null){
	if((refURL.indexOf("/operation/borrow.jsp") < 0) || (dbprocess.isProcessComplete())) {
		//reset all the class variable if not reenter the form from same URL
		borrowerID="";
		userFirstName = "";
		userEmail = "";
		userTotQuota = 0;
		userQuotaAvailable = 0;
		itemCallNumber = "";
		itemTitle = "";
		itemTotAvailable = 0;
		itemTotQuantity = 0;
		itemTotReserve = 0;
		itemTotBorrow = 0;
		itemsBorrowed = new Vector();
      	dbprocess.setProcessComplete(false);  
	}
}

String query="";
ResultSet myResultSet=null;
String errorMsg= "";
Date borrowDate = new Date();
Date dueDate = ServletUtilities.diffrenceDay(borrowDate, 7);
String borrowDateStr = DateFormat.getDateInstance(DateFormat.MEDIUM).format(borrowDate);
String dueDateStr = DateFormat.getDateInstance(DateFormat.MEDIUM).format(dueDate);
String formName="";
String itemBorrow[];
String[] itemCallNumberInList;
String borrowStatus = "borrow";
String[] removeItem;
String itemCallNumberToRemove = "";
Vector itemBorrowCallNumber = new Vector();

if(request.getParameter("formName") != null) {
	formName=request.getParameter("formName");
	if (formName.equals("resetForm")) {
		// Reset the form
		borrowerID="";
		userFirstName = "";
		userEmail = "";
		userTotQuota = 0;
		userQuotaAvailable = 0;
		itemCallNumber = "";
		itemTitle = "";
		itemTotAvailable = 0;
		itemTotQuantity = 0;
		itemTotReserve = 0;
		itemTotBorrow = 0;
		itemsBorrowed = new Vector();
      	dbprocess.setProcessComplete(false);  
	}else if (formName.equals("borrowerID")) {
		borrowerID = request.getParameter("borrowerID");
		if (borrowerID == null)
			borrowerID = "";
		if( !(borrowerID.equals("")) ) {
			// Reset all the value			
			if(borrowerID.equals(staff.getUserID())) {
				errorMsg = "Error: borrower ID " + borrowerID +" cannot be same as staff in charge";
				borrowerID=""; userFirstName=""; userEmail=""; userTotQuota=0; userQuotaAvailable=0;
			}else {
				query = "SELECT * FROM user WHERE UserID ='" +borrowerID +"'";
				try {  
     	 			Connection connection = connectionPool.getConnection();
					myResultSet = DatabaseUtilities.getQueryResultSet(connection, query, false);                                        
    	  			connectionPool.free(connection);
   	 			} catch(Exception e) {
      				errorMsg = "Error: " + e;    		
    			}            
				
				borrowerID=""; userFirstName=""; userEmail=""; userTotQuota=0; userQuotaAvailable=0;
    			if (myResultSet != null){
					try{
						while(myResultSet.next()) {
							borrowerID = myResultSet.getString("userID");
							userFirstName = myResultSet.getString("userFirstName");
							userEmail = myResultSet.getString("userEmail");
							userTotQuota = Integer.parseInt(myResultSet.getString("userTotQuota"));
							userQuotaAvailable = Integer.parseInt(myResultSet.getString("userQuotaAvailable"));
						}
					} catch(SQLException sqle) {
						System.err.println("Error connecting: " +sqle);		
					}
				}
				if(borrowerID.equals("")) {
					errorMsg ="Error: borrower ID not found";
				} else {
					if(userQuotaAvailable <=0) {
						errorMsg = "Error: borrower ID " +borrowerID +" do not have quoat available!";
						borrowerID = ""; userFirstName=""; userEmail=""; userTotQuota=0; userQuotaAvailable=0;
					}
				}				
			}
		}
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
			if(itemTotAvailable <=0) {
				errorMsg = "Error: item call number " +itemCallNumber +" currently not available in quantity";
				itemCallNumber=""; itemTitle=""; itemTotAvailable=0; 
				itemTotQuantity=0; itemTotReserve=0; itemTotBorrow=0;
			}else{
				if(itemTotReserve >= itemTotAvailable) {
					errorMsg = "Error: All available item call number " +itemCallNumber +" currently under reservation";
					itemCallNumber=""; itemTitle=""; itemTotAvailable=0; 
					itemTotQuantity=0; itemTotReserve=0; itemTotBorrow=0;
				}
			}
		}
	} else if (formName.equals("addToList")) {
		itemCallNumber = request.getParameter("itemCallNumber");
		itemTitle = request.getParameter("itemTitle");
		boolean itemInList = false;
			itemBorrow = new String[2];
			itemBorrow[0] = itemCallNumber;
			itemBorrow[1] = itemTitle;
		if (itemsBorrowed.size()==0) {
			itemsBorrowed.addElement(itemBorrow);
		} else{
			for(int i=0; i<itemsBorrowed.size(); i++){
				itemCallNumberInList = (String[])itemsBorrowed.elementAt(i);
				if(itemCallNumber.equals(itemCallNumberInList[0])) {
					itemInList = true;
				}
			}
			if(!itemInList)
				itemsBorrowed.addElement(itemBorrow);
		}
	} else if(formName.equals("removeFromList")) {
		if(request.getParameter("removeItem") != null) {
			String[] paramValues = request.getParameterValues("removeItem");
			for(int x = 0; x<paramValues.length; x++) {
				itemCallNumberToRemove = paramValues[x];
				for(int y=0; y<itemsBorrowed.size(); y++){
					itemCallNumberInList = (String[])itemsBorrowed.elementAt(y);
					if(itemCallNumberToRemove.equals(itemCallNumberInList[0])) {
						itemsBorrowed.removeElementAt(y);
					}
				}
			}
		}
	} else {
		if (borrowerID.equals("")) {
			errorMsg="Error: Borrower ID Not Yet Keyin";
		} else if(userQuotaAvailable < itemsBorrowed.size()) { 
			errorMsg="Error: User cannot borrow more then quota available";
		} else if(itemsBorrowed.size()<=0) {
			errorMsg="Error: That is nothing in the borrow list";
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
      <p align="center"><b>Add Borrow Record</b></p>
      <center>
        <table width="75%" border="0">
          <tr> 
            <td width="25%">Staff ID: <%= staff.getUserID() %></td>
            <td width="25%">&nbsp;</td>
            <td width="25%">&nbsp; </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2">Today: 
              <% out.println(borrowDateStr); %>
            </td>
            <td colspan="2">Due Date (one week): 
              <% out.println(dueDateStr); %>
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
            <form name="form1" method="post" action="borrow.jsp">
              <p>Borrower ID 
                <input type="text" name="borrowerID" size="30">
                <input type="submit" name="submit" value="Submit">
              </p>
              <table width="100%" border="1" cellspacing="1" cellpadding="1">
                <tr> 
                  <th width="17%">Borrower ID</th>
                  <th width="29%">Borrower First Name</th>
                  <th width="30%">Borrower Email</th>
                  <th width="11%">Total Quota</th>
                  <th width="13%">Quota Available</th>
                </tr>
                <tr> 
                  <td width="17%"> 
                    <% if(borrowerID.equals("")){
							out.println("-");
						} else {		
							out.println(borrowerID);
						}
					%>
                  </td>
                  <td width="29%"> 
                    <% if(borrowerID.equals("")){
							out.println("-");
						} else {		
							out.println(userFirstName);
						}
					%>
                  </td>
                  <td width="30%"> 
                    <% if(borrowerID.equals("")){
							out.println("-");
						} else {		
							out.println(userEmail);
						}
					%>
                  </td>
                  <td width="11%"> 
                    <% if(borrowerID.equals("")){
							out.println("-");
						} else {		
							out.println(userTotQuota);
						}
					%>
                  </td>
                  <td width="13%"> 
                    <% if(borrowerID.equals("")){
							out.println("-");
						} else {		
							out.println(userQuotaAvailable);
						}
					%>
                  </td>
                </tr>
              </table>
			<input type="hidden" name="formName" value="borrowerID">
            </form>
          </td>
        </tr>
      </table>
      <hr>
      <table width="100%" border="0" bgcolor="#66FFCC">
        <tr>
          <td> 
            <form action="borrow.jsp" name="form2" method="post">
              <p>Item Call Number: 
                <input type="text" name="itemCallNumber" size="22" maxlength="20">
                <input type="submit" name="submit" value="Submit">
              </p>
              <table width="100%" border="1" cellspacing="1" cellpadding="1">
                <tr> 
                  <th width="19%">Call Number</th>
                  <th width="47%">Title</th>
                  <th width="9%">Total Available</th>
                  <th width="9%">Total Quantity</th>
                  <th width="8%">Total Reserve</th>
                  <th width="8%">Total Borrow</th>
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
						out.println(itemTotAvailable);
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
                  <td width="8%">
				  <% 
					if(itemCallNumber.equals("")){
						out.println("-");
					} else {		
						out.println(itemTotReserve);
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
                </tr>
              </table>

			<input type="hidden" name="formName" value="itemCallNumber">
            </form>
            <form name="form3" action="borrow.jsp" method="post">
              <% if (!(itemCallNumber.equals(""))){ %>
              <input type="hidden" name="formName" value="addToList">
              <input type="hidden" name="itemCallNumber" value="<%= itemCallNumber %>">
              <input type="hidden" name="itemTitle" value="<%=itemTitle %>">
              <input type="submit" name="submit" value="Add to borrow list">
              <%	} %>
            </form></td>
        </tr>
      </table>
      <hr>
      <table width="100%" border="0" bgcolor="#66FFCC">
        <tr> 
          <td> 
            <form name="form3" action="borrow.jsp" method="post">
              <p align="center"><b>Borrow Lists</b></p>
              <table width="100%" border="1" cellspacing="1" cellpadding="1">
                <tr> 
                  <th width="4%">&nbsp;</th>
                  <th width="21%">Call Number</th>
                  <th width="75%">Title</th>
                </tr>
				<%
				if(itemsBorrowed.size() > 0){
					for(int i=0; i<itemsBorrowed.size(); i++){
						itemCallNumberInList = (String[])itemsBorrowed.elementAt(i);
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
                  
                <td width="17%"> <form name="form5" method="post" action="borrow.jsp">
				<% for(int i=0; i<itemsBorrowed.size(); i++){
					itemCallNumberInList = (String[])itemsBorrowed.elementAt(i);
					out.println("<input type='hidden' name='itemCallNumber' value='" +itemCallNumberInList[0] +"'>");
					}
				%>
				<input type="hidden" name="formName" value="processToBorrow">
				<input type="hidden" name="staffIDBorrow" value="<%= staff.getUserID() %>">
				<input type="hidden" name="borrowerID" value="<%= borrowerID %>">
				<input type="hidden" name="borrowerEmail" value="<%= userEmail %>">
				<input type="hidden" name="borrowDate" value="<%= ServletUtilities.dateToString(borrowDate) %>">
				<input type="hidden" name="dueDate" value="<%= ServletUtilities.dateToString(dueDate) %>">
				<input type="hidden" name="borrowStatus" value="<%= borrowStatus %>">
               <input type="submit" name="submit" value="Proceed to Borrow">
              </form>  </td>
                <td width="83%">            <form name="form4" method="post" action="borrow.jsp">
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