<%!	int pagePrevious = 0;
	int pageNext = 0;
%>
<%   
	// Generate the page display navigation 
	String formURL = form.getFormURL();   
  
	out.println("<br>");
	out.print("<CENTER>");

	pagePrevious = pageCurrent - 1;
	pageNext = pageCurrent + 1;

	if(pageCurrent<=1)
		out.println("[First Page] ");
	else
		out.println("<a href='" +formURL +"?pageCurrent=1&" +queryParameter +"'>[First Page] </a>");
	out.println("&nbsp;");	

	if(pagePrevious<1)
		out.println("[Prv Page] ");
	else
		out.println("<a href='" +formURL +"?pageCurrent=" +pagePrevious +"&" +queryParameter +"'>[Previous Page] </a>");
	out.println("&nbsp;");
        
	if(pageNext>pageCount)
		out.println("[Next Page] ");
	else
		out.println("<a href='" +formURL +"?pageCurrent=" +pageNext +"&" +queryParameter +"'>[Next Page] </a>");
	out.println("&nbsp;");
        
	if(pageCurrent>=pageCount)
		out.println("[Last Page] ");
	else	
		out.println("<a href='" +formURL +"?pageCurrent=" +pageCount +"&" +queryParameter +"'>[Last page] </a>");
 
	out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");

	out.println("Page " +pageCurrent +"of " +pageCount);
	out.println(" (Total: " +recCount +" record)");

	out.print("<BR></CENTER>");     
 %>
