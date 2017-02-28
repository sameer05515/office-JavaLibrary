package sjservlets;

/** A Java Servlet use to process the logout.
 *  Where reset the login, user bean attribute to initialize value 
 *  <P>
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */
 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LogoutProcess extends ConnectionPoolServlet {
	private boolean debug = true;

	
  	public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
  			throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);		
		
		PrintWriter out = response.getWriter();

		User user = (User)session.getAttribute("user");
		User staff = (User)session.getAttribute("staff");
		Login login = (Login)session.getAttribute("login");
	
		if ( login.getUserID() != "" ){		
			// Login login = new Login(false, "", "");			
			login.resetVariable();
			user.resetVariable();	
			staff.resetVariable();
			session.setAttribute("login", login);	
			session.setAttribute("user", user);
			session.setAttribute("staff", staff);
			
			//connectionPool.closeAllConnections();
			
			gotoPage("/login/after_logout.jsp", request, response);
		}else{
			gotoPage("/mainmenu/mainmenu.jsp", request, response);
		}		
	}
}

