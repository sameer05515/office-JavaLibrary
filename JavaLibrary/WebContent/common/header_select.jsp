<%
// depend on user login type, then display the difference header
if( (login.isUserLogin()) ) {
	if( (staff.getUserType().equals("admin")) ) {
%>		<jsp:include page="../common/header_admin.jsp" flush="true"/>
<%	} else if( (staff.getUserType().equals("librarian")) ) {
%>		<jsp:include page="../common/header_librarian.jsp" flush="true"/>
<%	} else {
%>		<jsp:include page="../common/header_borrower.jsp" flush="true"/>
<%	}
} else {
%>	<jsp:include page="../common/header_normal.jsp" flush="true"/>
<%
}
%>
