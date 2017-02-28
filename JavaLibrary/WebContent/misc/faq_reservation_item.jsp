<%@ include file="../common/common.jsp" %>
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
      <center>
        <center>
          <p><b><a name="top"></a><a href="faq.jsp">Frequently Asked Questions 
            (FAQs)</a> </b></p>
        </center>
        <img height=1 alt="" src="../images/misc/line_blu.gif" 
width="100%" border=0> 
      </center>
      <br>
      <table cellspacing=0 cellpadding=0 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td align=right>&nbsp; </td>
        </tr>
        </tbody>
      </table>
      <table cellspacing=0 cellpadding=0 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img  
      src="../images/common/1ptrans.gif" width=30 border=0><br>
          </td>
          <td valign=top width=590><b class=subHdrBlu>Reservation of Items</b> 
          </td>
        </tr>
        <tr> 
          <td colspan=2><img height=1 alt="" 
      src="../images/misc/line.gif" width=620 vspace=3 
      border=0></td>
        </tr>
        </tbody>
      </table>
      <table cellspacing=5 cellpadding=5 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img height=8 alt="" 
      src="../images/common/1ptrans.gif" width=30 border=0></td>
          <td width=590><b>What are library's policies on reservation of items?</b> 
            <ul type=square>
              <li><a 
        href="#Quota">Reservation Quota</a> 
              <li><a href="#Fee">Reservation Fee</a> 
              <li><a href="#Alert">Pick-up Alert</a> 
              <li><a 
        href="#Uncollected">Uncollected Items</a> 
              <li><a href="#Waiting">Waiting Period for Reserved Item</a> 
              <li><a 
        href="#Cancel">Cancelling a Reservation</a> 
              <li><a href="#Online">Online Reservation</a>
            </ul>
          </td>
        </tr>
        </tbody>
      </table>
      <p><a name=Quota></a><img height=1 alt="" 
      src="../images/misc/line.gif" width=620 vspace=3 
      border=0>
      <p> 
      <table cellspacing=0 cellpadding=0 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img  
      src="../images/common/1ptrans.gif" width=30 border=0><br>
          </td>
          <td valign=top width=590><b class=subHdrBlu>Reservation Quota</b> </td>
        </tr>
        </tbody>
      </table>
      <table cellspacing=5 cellpadding=5 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img height=8 alt="" 
      src="../images/common/1ptrans.gif" width=30 border=0></td>
          <td width=590>Each member can reserve a maximum of 3 items. <br>
            Available items cannot be reserved. However if the available quantity 
            is less the the request in reservation list, then member can make 
            reservation for it. 
            <p> 
            <div align=right><a 
      href="#top">Top</a></div>
          </td>
        </tr>
        </tbody>
      </table>
      <p><a name=Fee></a><img height=1 alt="" 
      src="../images/misc/line.gif" width=620 vspace=3 
      border=0>
      <p> 
      <table cellspacing=0 cellpadding=0 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img  
      src="../images/common/1ptrans.gif" width=30 border=0><br>
          </td>
          <td valign=top width=590><b class=subHdrBlu>Reservation Fee</b> </td>
        </tr>
        </tbody>
      </table>
      <table cellspacing=5 cellpadding=5 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img height=8 alt="" 
      src="../images/common/1ptrans.gif" width=30 border=0></td>
          <td width=590>Each reserved item is free of charge 
            <p> 
            <div align=right><a 
      href="#top">Top</a></div>
          </td>
        </tr>
        </tbody>
      </table>
      <p><a name=Alert></a><img height=1 alt="" 
      src="../images/misc/line.gif" width=620 vspace=3 
      border=0>
      <p> 
      <table cellspacing=0 cellpadding=0 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img  
      src="../images/common/1ptrans.gif" width=30 border=0><br>
          </td>
          <td valign=top width=590><b class=subHdrBlu>Pick-up Alert</b> </td>
        </tr>
        </tbody>
      </table>
      <table cellspacing=5 cellpadding=5 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img height=8 alt="" 
      src="../images/common/1ptrans.gif" width=30 border=0></td>
          <td width=590>
            <p>Member will be informed by email when the items are available. 
            </p>
            <p>Member also can check the availability of item form his/her reservation 
              list. </p>
            <div align=right><a 
      href="#top">Top</a></div>
          </td>
        </tr>
        </tbody>
      </table>
      <a 
name=Uncollected></a><img height=1 alt="" 
      src="../images/misc/line.gif" width=620 vspace=3 
      border=0>
<p> 
      <table cellspacing=0 cellpadding=0 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img  
      src="../images/common/1ptrans.gif" width=30 border=0><br>
          </td>
          <td valign=top width=590><b class=subHdrBlu>Uncollected Items</b> </td>
        </tr>
        </tbody>
      </table>
      <table cellspacing=5 cellpadding=5 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img height=8 alt="" 
      src="../images/common/1ptrans.gif" width=30 border=0></td>
          <td width=590>Reservation will be cancel after one week of inform for 
            it availability 
            <p> 
            <div align=right><a 
      href="#top">Top</a></div></td>
        </tr>
        </tbody>
      </table>
      <p><a name=Waiting></a><img height=1 alt="" 
      src="../images/misc/line.gif" width=620 vspace=3 
      border=0>
      <p> 
      <table cellspacing=0 cellpadding=0 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img  
      src="../images/common/1ptrans.gif" width=30 border=0><br>
          </td>
          <td valign=top width=590><b class=subHdrBlu>Waiting period for reserved 
            item</b> </td>
        </tr>
        </tbody>
      </table>
      <table cellspacing=5 cellpadding=5 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img height=8 alt="" 
      src="../images/common/1ptrans.gif" width=30 border=0></td>
          <td width=590>Reservation queue is base on first came first serve. The 
            availability of item will be inform to the person first make the reservation. 
            <p> 
            <div align=right><a 
      href="#top">Top</a></div>
          </td>
        </tr>
        </tbody>
      </table>
      <a name=Cancel></a><img height=1 alt="" 
      src="../images/misc/line.gif" width=620 vspace=3 
      border=0>
<p> 
      <table cellspacing=0 cellpadding=0 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img  
      src="../images/common/1ptrans.gif" width=30 border=0><br>
          </td>
          <td valign=top width=590><b class=subHdrBlu>Cancelling a reservation</b> 
          </td>
        </tr>
        </tbody>
      </table>
      <table cellspacing=5 cellpadding=5 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img height=8 alt="" 
      src="../images/common/1ptrans.gif" width=30 border=0></td>
          <td width=590>You can only cancel the reserved item any time. 
            <p> 
            <div align=right><a 
      href="#top">Top</a></div>
          </td>
        </tr>
        </tbody>
      </table>
      <a 
name=Online></a><img height=1 alt="" 
      src="../images/misc/line.gif" width=620 vspace=3 
      border=0>
<p> 
      <table cellspacing=0 cellpadding=0 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img  
      src="../images/common/1ptrans.gif" width=30 border=0><br>
          </td>
          <td valign=top width=590><b class=subHdrBlu>Online Reservation Process</b> 
          </td>
        </tr>
        </tbody>
      </table>
      <table cellspacing=5 cellpadding=5 width=620 border=0>
        <tbody> 
        <tr valign=top> 
          <td width=30><img height=8 alt="" 
      src="../images/common/1ptrans.gif" width=30 border=0></td>
          <td width=590> 
            <ol type=i>
              <li>Select add reservation from my account after login.
              <li>Search the database to check the item's availability. 
              <li>Select the `Add to Reserveation list' button. 
              <li>U can add as many item to your list before process the resrevation, 
                however system will inform U if the total items you plan to make 
                reserve is more then the total reserver quota you have.
              <li>Finaly click the 'Process reservation' button on the bottom.
            </ol>
            <div align=right><a 
      href="#top">Top</a></div>
          </td>
        </tr>
        </tbody>
      </table>
      <p><img height=1 alt="" 
      src="../images/misc/line.gif" width=620 vspace=3 
      border=0> 
      <p> <img height=1 alt="" src="../images/misc/line_blu.gif" 
width="100%" border=0>
      <p>&nbsp; 
    </td>
  </tr>
</table>
<jsp:include page="../common/footer.jsp" flush="true" />
</body>
</html>