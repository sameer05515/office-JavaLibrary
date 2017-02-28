<% 
//	String currentURI=(String) session.getAttribute("currentURI");
//	if(currentURI==null) {
		String currentURI = request.getRequestURI();
		session.setAttribute("currentURI", currentURI);
//	}
%>
<SCRIPT LANGUAGE="JAVASCRIPT">
<!--  hide	

function customize(form) {    
	var address = document.helpForm.url.value;   
	var op_tool  = (document.helpForm.tool.value== "true")  ? 1 : 0;   
	var op_loc_box  = (document.helpForm.loc_box.value == "true")  ? 1 : 0; 
	var op_dir  = (document.helpForm.dir.value == "true")  ? 1 : 0;    
	var op_stat  = (document.helpForm.stat.value == "true")  ? 1 : 0;    
	var op_menu  = (document.helpForm.menu.value == "true")  ? 1 : 0;    
	var op_scroll  = (document.helpForm.scroll.value == "true")  ? 1 : 0;  
	var op_resize  = (document.helpForm.resize.value == "true")  ? 1 : 0;    

	var op_wid  = document.helpForm.wid.value;   
	var op_heigh = document.helpForm.heigh.value;                 

	var option = "toolbar=" + op_tool + ",location=" + op_loc_box + ",directories=" 
		+ op_dir + ",status=" + op_stat + ",menubar=" + op_menu + ",scrollbars="  
		+ op_scroll + ",resizable="  + op_resize + ",width=" + op_wid + ",height=" 
		+ op_heigh;

	var new_win = window.open(address, "NewWindow", option );

}



function clear(form){ 

	document.form1.wid.value=""; 

	document.form1.heigh.value="";

}

// done hiding -->

</SCRIPT>

<table width="180" border="0" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
  <tr> 
    <td>
		<%
			if (login.isUserLogin()) { 
				out.println("<b>Login ID: <i>" +login.getUserID() +"</i></b><br>"); 
				out.println("<a href='/JavaLibrary/servlet/sjservlets.LogoutProcess'>[Logout]</a>");
			}
			else
				out.println("<a href='/JavaLibrary/login/login.jsp'>[Login]</a><br>");
		%>
	</td>
  </tr>
</table>
<table class=flyoutMenu 
      style="BORDER-TOP-WIDTH: 1px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" 
      cellspacing=0 cellpadding=2 width=180 border=0>
  <tbody> 
  <tr> 
    <td> 
      <table cellspacing=0 cellpadding=0 width=176 border=0>
        <tbody> 
        <tr> 
          <td class=flyoutHeading><a href="../misc/about.jsp">About</a></td>
        </tr>
        <tr> 
          <td class=flyoutHeading><a href="../misc/faq.jsp">FAQ</a></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=176 border=0>
        <tbody> 
        <tr> 
          <td class=flyoutLink>&nbsp;</td>
        </tr>
        <tr> 
          <td class=flyoutLink> 
            <FORM name=helpForm  ACTION="javascript:" METHOD="POST">
              	<INPUT type="hidden" NAME="url" value="../common/help.jsp" >
              	<INPUT TYPE="hidden" NAME="tool" value="false">
              	<INPUT TYPE="hidden" NAME="loc_box" value="false">
              	<INPUT TYPE="hidden" NAME="dir" value="false">
              	<INPUT TYPE="hidden" NAME="stat" value="false">
              	<INPUT TYPE="hidden" NAME="menu" value="false">
              	<INPUT TYPE="hidden" NAME="scroll" value="true">
              	<INPUT TYPE="hidden" NAME="resize" value="false">
              	<INPUT TYPE="hidden" NAME="wid" value=600 >
             	<INPUT TYPE="hidden" NAME="heigh" value=400>
              <a href="#" onclick="customize(this.helpForm)"> <img src="../images/common/help.gif" width="23" height="22" align="absbottom" vspace="0" border="0">[Online 
              Help]</a>
</form>
          </td>
        </tr>
        </tbody> 
      </table>
    </td>
  </tr>
  </tbody> 
</table>

