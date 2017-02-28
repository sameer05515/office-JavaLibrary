package sjservlets;

/** A Servlet that contain various usefull small functions
 *  which will use by other servlet or/and JSP files
 *  <P>
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */
 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.util.Date;
import java.text.DateFormat;
import java.util.Locale;

/** Some simple time savers. Note that most are static methods.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2000 Marty Hall; may be freely used or adapted.
 */

public class ServletUtilities {
  public static final String DOCTYPE =
    "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
    "Transitional//EN\">";

  public static String headWithTitle(String title) {
    return(DOCTYPE + "\n" +
           "<HTML>\n" +
           "<HEAD><TITLE>" + title + "</TITLE></HEAD>\n");
  }

  /** Read a parameter with the specified name, convert it
   *  to an int, and return it. Return the designated default
   *  value if the parameter doesn't exist or if it is an
   *  illegal integer format.
  */
  
  public static int getIntParameter(HttpServletRequest request,
                                    String paramName,
                                    int defaultValue) {
    String paramString = request.getParameter(paramName);
    int paramValue;
    try {
      paramValue = Integer.parseInt(paramString);
    } catch(NumberFormatException nfe) { // null or bad format
      paramValue = defaultValue;
    }
    return(paramValue);
  }

  /** Given an array of Cookies, a name, and a default value,
   *  this method tries to find the value of the cookie with
   *  the given name. If there is no cookie matching the name
   *  in the array, then the default value is returned instead.
   */
  
  public static String getCookieValue(Cookie[] cookies,
                                      String cookieName,
                                      String defaultValue) {
    if (cookies != null) {
      for(int i=0; i<cookies.length; i++) {
        Cookie cookie = cookies[i];
        if (cookieName.equals(cookie.getName()))
          return(cookie.getValue());
      }
    }
    return(defaultValue);
  }

  /** Given an array of cookies and a name, this method tries
   *  to find and return the cookie from the array that has
   *  the given name. If there is no cookie matching the name
   *  in the array, null is returned.
   */
  
  public static Cookie getCookie(Cookie[] cookies,
                                 String cookieName) {
    if (cookies != null) {
      for(int i=0; i<cookies.length; i++) {
        Cookie cookie = cookies[i];
        if (cookieName.equals(cookie.getName()))
          return(cookie);
      }
    }
    return(null);
  }

  /** Given a string, this method replaces all occurrences of
   *  '<' with '&lt;', all occurrences of '>' with
   *  '&gt;', and (to handle cases that occur inside attribute
   *  values), all occurrences of double quotes with
   *  '&quot;' and all occurrences of '&' with '&amp;'.
   *  Without such filtering, an arbitrary string
   *  could not safely be inserted in a Web page.
   */

  public static String filter(String input) {
    StringBuffer filtered = new StringBuffer(input.length());
    char c;
    for(int i=0; i<input.length(); i++) {
      c = input.charAt(i);
      if (c == '<') {
        filtered.append("&lt;");
      } else if (c == '>') {
        filtered.append("&gt;");
      } else if (c == '"') {
        filtered.append("&quot;");
      } else if (c == '&') {
        filtered.append("&amp;");
      } else {
        filtered.append(c);
      }
    }
    return(filtered.toString());
  }
  
  // Builds a cascading style sheet with information
  // on three levels of headings and overall
  // foreground and background cover. Also tells
  // Internet Explorer to change color of mailto link
  // when mouse moves over it.
  
  public static String makeStyleSheet(String headingFont,
                                int heading1Size,
                                String bodyFont,
                                int bodySize,
                                String fgColor,
                                String bgColor) {
    int heading2Size = heading1Size*7/10;
    int heading3Size = heading1Size*6/10;
    String styleSheet =
      "<STYLE TYPE=\"text/css\">\n" +
      "<!--\n" +
      ".HEADING1 { font-size: " + heading1Size + "px;\n" +
      "            font-weight: bold;\n" +
      "            font-family: " + headingFont +
                     "Arial, Helvetica, sans-serif;\n" +
      "}\n" +
      ".HEADING2 { font-size: " + heading2Size + "px;\n" +
      "            font-weight: bold;\n" +
      "            font-family: " + headingFont +
                     "Arial, Helvetica, sans-serif;\n" +
      "}\n" +
      ".HEADING3 { font-size: " + heading3Size + "px;\n" +
      "            font-weight: bold;\n" +
      "            font-family: " + headingFont +
                     "Arial, Helvetica, sans-serif;\n" +
      "}\n" +
      "BODY { color: " + fgColor + ";\n" +
      "       background-color: " + bgColor + ";\n" +
      "       font-size: " + bodySize + "px;\n" +
      "       font-family: " + bodyFont +
                    "Times New Roman, Times, serif;\n" +
      "}\n" +
      "A:hover { color: red; }\n" +
      "-->\n" +
      "</STYLE>";
    return(styleSheet);
  }
  
  // Replaces null strings (no such parameter name) or
  // empty strings (e.g., if textfield was blank) with
  // the replacement. Returns the original string otherwise.
  
  public static String replaceIfMissing(String orig,
                                  String replacement) {
    if ((orig == null) || (orig.length() == 0)) {
      return(replacement);
    } else {
      return(orig);
    }
  }

  // Replaces null strings, empty strings, or the string
  // "default" with the replacement.
  // Returns the original string otherwise.
  
  public static String replaceIfMissingOrDefault(String orig,
                                           String replacement) {
    if ((orig == null) ||
        (orig.length() == 0) ||
        (orig.equals("default"))) {
      return(replacement);
    } else {
      return(orig + ", ");
    }
  }

  // Takes a string representing an integer and returns it
  // as an int. Returns a default if the string is null
  // or in an illegal format.
    
  public static int getSize(String sizeString, int defaultSize) {
    try {
      return(Integer.parseInt(sizeString));
    } catch(NumberFormatException nfe) {
      return(defaultSize);
    }
  }

  // Given "Java,C++,Lisp", "Java C++ Lisp" or
  // "Java, C++, Lisp", returns
  // "<UL>
  //   <LI>Java
  //   <LI>C++
  //   <LI>Lisp
  //  </UL>"

  public static String makeList(String listItems) {
    StringTokenizer tokenizer =
      new StringTokenizer(listItems, ", ");
    String list = "<UL>\n";
    while(tokenizer.hasMoreTokens()) {
      list = list + "  <LI>" + tokenizer.nextToken() + "\n";
    }
    list = list + "</UL>";
    return(list);
  }  
  
  public static Date stringToDate(String myDateStr) {
 	int inputYear = Integer.parseInt(myDateStr.substring(0,4)) - 1900;
	int inputMonth =  Integer.parseInt(myDateStr.substring(5,7)) - 1;
	int inputDate = Integer.parseInt(myDateStr.substring(8,10));	
  	return (new Date(inputYear, inputMonth, inputDate));
  }
  
  public static String dateToString(Date myDate) {  	
	int outputYear = myDate.getYear();
	int outputMonth = myDate.getMonth();
	int outputDate = myDate.getDate();
  	return ((outputYear+1900) +"-" +(outputMonth+1) +"-" +(outputDate));
  }
  
  public static Date diffrenceDay(Date myDate, int difDay){
  	int myYear = myDate.getYear();
	int myMonth = myDate.getMonth();
	int myDay = myDate.getDate();
  	return(new Date(myYear, myMonth, myDay + difDay));
  }
  
}
