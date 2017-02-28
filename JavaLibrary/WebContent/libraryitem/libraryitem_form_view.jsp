<form>

 <table width="100%" border="0" cellspacing="1" cellpadding="1">
    <tr> 
      <td width="31%">Subject*</td>
      <td width="69%"> 
        <%= libraryitem.getItemSubject() %>
      </td>
    </tr>
    <tr> 
      
    <td width="31%" height="21">Media*</td>      
    <td width="69%" height="21"> 
        <%= libraryitem.getItemMediaType() %>
    </td>
    </tr>
    <tr> 
      <td width="31%">Language*</td>
      <td width="69%"> 
        <%= libraryitem.getItemLanguage() %>
    </td>
    </tr>
    <tr> 
      <td width="31%"> </td>
    </tr>
    <tr> 
      <td width="31%">Call Number</td>
      <td width="69%"> 
 		<% out.println(libraryitem.getItemCallNumber());	%>
      </td>
    </tr>
    <tr> 
      <td width="31%"> Title*</td>
      <td width="69%"> 
        <textarea name="itemTitle" cols="50" rows="3"><jsp:getProperty name="libraryitem" property="itemTitle" /></textarea>
      </td>
    </tr>
    <tr> 
      <td width="31%">Brief Description</td>
      <td width="69%"> 
        <textarea name="itemBriefDesc" cols="50" rows="4"><jsp:getProperty name="libraryitem" property="itemBriefDesc" /></textarea>
      </td>
    </tr>
    <tr> 
      <td width="31%">Author</td>
      <td width="69%"> 
        <textarea name="itemAuthor" cols="50" rows="4"><jsp:getProperty name="libraryitem" property="itemAuthor" /></textarea>
      </td>
    </tr>
    <tr> 
      <td width="31%">Keyword*</td>
      <td width="69%"> 
        <textarea name="itemKeyword" cols="50" rows="2"><jsp:getProperty name="libraryitem" property="itemKeyword" /></textarea>
      </td>
    </tr>
    <tr> 
      <td width="31%">Publisher Name</td>
      <td width="69%"> 
        <jsp:getProperty name="libraryitem" property="itemPublisherName" />
      </td>
    </tr>
    <tr> 
      <td width="31%" height="32">ISBN</td>
      <td width="69%" height="32"> 
        <jsp:getProperty name="libraryitem" property="itemISBN" />
      </td>
    </tr>
    <tr> 
      <td width="31%">Length</td>
      <td width="69%"> 
        <jsp:getProperty name="libraryitem" property="itemLength" />
        Hour(s) or Page(s)</td>
    </tr>
    <tr> 
      <td width="31%">Year</td>
      <td width="69%"> 
        <jsp:getProperty name="libraryitem" property="itemYear" />
      </td>
    </tr>
    <tr> 
      <td width="31%">Total Quantity*</td>
      <td width="69%"> 
        <%= libraryitem.getItemTotQuantity() %>
      </td>
    </tr>
    <tr> 
      <td width="31%">Total Available*</td>
      <td width="69%"> 
		<%	out.println(libraryitem.getItemTotAvailable()); %>
      </td>
    </tr>
    <tr> 
    <tr> 
      <td width="31%">Total Borrow Out</td>
      <td width="69%">
		<% out.println(libraryitem.getItemTotBorrow()); %>
	</td>
    </tr>
      <td width="31%">Total Reserve*</td>
      <td width="69%"> 
		<%	out.println(libraryitem.getItemTotReserve()); 	%>
      </td>
    </tr>
  </table>
</form>

