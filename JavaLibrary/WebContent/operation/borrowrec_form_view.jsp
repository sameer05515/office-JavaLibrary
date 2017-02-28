<form>

  <table width="100%" border="0" cellspacing="1" cellpadding="1">
    <tr> 
      <td width="31%">Borrow Record Number</td>
      <td width="69%"> <%= borrowrec.getBorrowRecNumber() %> </td>
    </tr>
    <tr> 
      <td width="31%" height="21">Item Call Number</td>
      <td width="69%" height="21"> <%= borrowrec.getItemCallNumber() %> </td>
    </tr>
    <tr> 
      <td width="31%">Borrower ID</td>
      <td width="69%"> <%= borrowrec.getBorrowerID() %> </td>
    </tr>
    <tr> 
      <td width="31%"> </td>
    </tr>
    <tr> 
      <td width="31%">Borrower Email</td>
      <td width="69%"> 
        <% out.println(borrowrec.getBorrowerEmail());	%>
      </td>
    </tr>
    <tr> 
      <td width="31%">Staff ID in charge (Borrow)</td>
      <td width="69%"><%= borrowrec.getStaffIDBorrow() %> </td>
    </tr>
    <tr> 
      <td width="31%">Staff ID in charge (Return)</td>
      <td width="69%"><%= borrowrec.getStaffIDReturn() %> </td>
    </tr>
    <tr> 
      <td width="31%">Borrow Date</td>
      <td width="69%"><%= borrowrec.getBorrowDate() %> </td>
    </tr>
    <tr> 
      <td width="31%">Due Date</td>
      <td width="69%"><%= borrowrec.getDueDate() %> </td>
    </tr>
    <tr> 
      <td width="31%">Return Date</td>
      <td width="69%"><%= borrowrec.getReturnDate() %> </td>
    </tr>
    <tr>
      <td width="31%">Borrow Status</td>
      <td width="69%"><%= borrowrec.getBorrowStatus() %> </td>
    </tr>
  </table>
</form>

