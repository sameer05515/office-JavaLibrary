<%@ page language="java" import="sjservlets.*" %>
<%@ page errorPage="../error/errorpage.jsp" %>
<%@ page session="true" %>
<jsp:useBean id="login" scope="session" class="sjservlets.Login" />
<jsp:useBean id="user" scope="session" class="sjservlets.User" />
<jsp:useBean id="form" scope="session" class="sjservlets.Form" />
<jsp:useBean id="staff" scope="session" class="sjservlets.User" />
<jsp:useBean id="dbprocess" scope="session" class="sjservlets.DBProcess" />
<jsp:useBean id="libraryitem" scope="session" class="sjservlets.LibraryItem" />
<jsp:useBean id="borrowrec" scope="session" class="sjservlets.BorrowRec" />
<jsp:useBean id="reserverec" scope="session" class="sjservlets.ReserveRec" />

<%!
	String URLcurrent;
%>