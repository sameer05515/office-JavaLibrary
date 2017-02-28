package sjservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

/** A simple servlet use to display the bean varaible
 *  use in the Java Library application.
 *  Use only during debug process.
 *
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */
 
public class debug_bean extends HttpServlet {
  	public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
  			throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);		
		PrintWriter out = response.getWriter();

		// Get all the bean data from session variable
		User user = (User)session.getAttribute("user");
		Login login = (Login)session.getAttribute("login");
		User staff = (User)session.getAttribute("staff");
		Form form = (Form)session.getAttribute("form");
		DBProcess dbprocess = (DBProcess)session.getAttribute("dbprocess");		
		
		response.setContentType("text/html");
    	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    	response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
    	String title = "Connection Pool Test";
    	out.println(ServletUtilities.headWithTitle(title) +
        	 	"<BODY BGCOLOR=\"#FDF5E6\">\n" +
               	"<CENTER>\n"); 
        out.println("<b>Login Session Variables</b><br>");
        out.println("login.getUserID: " + login.getUserID() +"<br>");
        out.println("login.getUserType: " + login.getUserType() +"<br>");
        out.println("login.isUserLogin: " + login.isUserLogin() +"<br>");
		out.println("<HR>");
		out.println("<b>User Session Variables</b><br>");
		out.println("user.getUserRecNumber: " +user.getUserRecNumber() +"<br>");
		out.println("user.getUserID: " +user.getUserID() +"<br>");
		out.println("user.getUserPassword: " +user.getUserPassword() + "<br>");
		out.println("user.getUserType: " +user.getUserType() + "<br>");
		out.println("user.getUserFirstName: " +user.getUserFirstName() + "<br>");
		out.println("user.getUserLastName: " +user.getUserLastName() + "<br>");
		out.println("user.getUserGender: " +user.getUserGender() +"<br>");
		out.println("user.getUserEmail: " +user.getUserEmail() +"<br>");
		out.println("user.getUserICNumber: " +user.getUserICNumber() +"<br>");
		out.println("user.getUserAddress1: " +user.getUserAddress1() +"<br>");
		out.println("user.getUserAddress2: " +user.getUserAddress2() +"<br>");
		out.println("user.getUserCity: " +user.getUserCity() +"<br>");
		out.println("user.getUserState: " +user.getUserState() +"<br>");
		out.println("user.getUserPostCode: " +user.getUserPostCode() +"<br>");
		out.println("user.getUserCountry: " +user.getUserCountry() +"<br>");
		out.println("user.getUserOccupation: " +user.getUserOccupation() +"<br>");
		out.println("user.getUserContactNumber: " +user.getUserContactNumber() +"<br>");
		out.println("user.getUserTotQuota: " +user.getUserTotQuota() +"<br>");
		out.println("user.getUserQuotaAvailable: " +user.getUserQuotaAvailable() +"<br>");
		out.println("<HR>");
		out.println("<b>Staff Session Variables</b><br>");
		out.println("staff.getUserRecNumber: " +staff.getUserRecNumber() +"<br>");
		out.println("staff.getUserID: " +staff.getUserID() +"<br>");
		out.println("staff.getUserPassword: " +staff.getUserPassword() + "<br>");
		out.println("staff.getUserType: " +staff.getUserType() + "<br>");
		out.println("staff.getUserFirstName: " +staff.getUserFirstName() + "<br>");
		out.println("staff.getUserLastName: " +staff.getUserLastName() + "<br>");
		out.println("staff.getUserGender: " +staff.getUserGender() +"<br>");
		out.println("staff.getUserEmail: " +staff.getUserEmail() +"<br>");
		out.println("staff.getUserICNumber: " +staff.getUserICNumber() +"<br>");
		out.println("staff.getUserAddress1: " +staff.getUserAddress1() +"<br>");
		out.println("staff.getUserAddress2: " +staff.getUserAddress2() +"<br>");
		out.println("staff.getUserCity: " +staff.getUserCity() +"<br>");
		out.println("staff.getUserState: " +staff.getUserState() +"<br>");
		out.println("staff.getUserPostCode: " +staff.getUserPostCode() +"<br>");
		out.println("staff.getUserCountry: " +staff.getUserCountry() +"<br>");
		out.println("staff.getUserOccupation: " +staff.getUserOccupation() +"<br>");
		out.println("staff.getUserContactNumber: " +staff.getUserContactNumber() +"<br>");
		out.println("staff.getUserTotQuota: " +staff.getUserTotQuota() +"<br>");
		out.println("staff.getUserQuotaAvailable: " +staff.getUserQuotaAvailable() +"<br>");
		out.println("<HR>");		
		out.println("<b>Form Session Variables</b><br>");
        out.println("form.getFormName: " + form.getFormName() +"<br>");
        out.println("form.getFormType: " + form.getFormType() +"<br>");
        out.println("form.getFormURL: " +form.getFormURL() +"<br>");
		out.println("<HR>");
		out.println("<b>DBProcess Session Variables</b><br>");
		out.println("dbprocess.getDBName: " +dbprocess.getDBName() +"<br>");
		out.println("dbprocess.getTblName: " +dbprocess.getTblName() +"<br>");
		out.println("dbprocess.getProcessResult: " +dbprocess.getProcessResult() +"<br>");
		out.println("dbprocess.getProcessMsg: " +dbprocess.getProcessMsg() +"<br>");
		out.println("dbprocess.getProcessAction: " +dbprocess.getProcessAction() +"<br>"); 
		out.println("dbprocess.isProcessComplete: " +dbprocess.isProcessComplete() +"<br>");
		out.println("<HR>");

        out.println("</CENTER>\n</BODY></HTML>");
	}
}

