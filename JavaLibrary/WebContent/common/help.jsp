<!-- This file use to display the help for all section in the applicaiton -->
<HTML><title>HELP</title>
<BODY bgcolor="#FFFFFF">
<center><b>HELP</b></center>
<%
// Get the current URI and display the help section according to it
String refURL = (String)session.getAttribute("currentURI");
if(refURL != null){
	if(refURL.equals("/JavaLibrary/mainmenu/mainmenu.jsp")) {
%>
<center>
  <b>Main Menu</b> 
</center>
  
<ul>
  <li>Select login if your have the account for this library system. Which will 
    give U extra option depend on your login access level. </li>
  <li>Anyway, you still can search the library items (e.g. books, magazine, CD..) 
    from search menu.</li>
  <li>After login, U will get notice if U had borrowed library item that had overdue 
    and/or the reservation U make had had available now. </li>
  <li>Beside that, after login, depend on your security level (either admin, librarian 
    or borrower); U will have difference menu selection. </li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/login/login.jsp")) {
%>
<center>
  <b>Login</b> 
</center>
	
<ul>
  <li>Enter your login ID and password </li>
  <li>During login process, beside validation, system will update the reserve 
    record and borrow record.</li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/login/login_invalid.jsp")) {
%>
<center>
  <b>Invalid Login</b> 
</center>
	<ul>
  <li>Please make sure your login ID and password are match, and try again to 
    login </li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/misc/faq.jsp")) {
%>
<center>
  <b>FAQ</b> 
</center>
	
<ul>
  <li>Select the FAQ section from right. </li>
  <li>Available FAQ section include: Membership policies, Library open hours, 
    Reservation of library items, Apply for membership.</li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/misc/faq_member_policy.jsp")) {
%>
<center>
  <b>FAQ: Membership Policies</b>
</center>
<ul>
  <li>Part of FAQ information.</li>
  <li>About the Membership policies</li>
  <li>To back to FAQ selection, either click the 'FAQ' hyperlink at left or select 
    the 'Frequently Asked Questions (FAQs)' hyperlink on the top. 
    <p></p>
  </li>
</ul>
<HR>
<% } else if (refURL.equals("/JavaLibrary/misc/faq_library_open_hours.jsp")) {
%>
<center>
  <b>FAQ: 
  Library Opening Hours </b>
</center>
<ul>
  <li>Part of FAQ information.</li>
  <li>About the Library Opening Hours</li>
  <li>To back to FAQ selection, either click the 'FAQ' hyperlink at left or select 
    the 'Frequently Asked Questions (FAQs)' hyperlink on the top. </li>
</ul>
<HR>
<% } else if (refURL.equals("/JavaLibrary/misc/faq_reservation_item.jsp")) {
%>
<center>
  <b>FAQ: Reservation of Items </b> 
</center>
<ul>
  <li>Part of FAQ information.</li>
  <li>About the Reservatioin of Items.</li>
  <li>To back to FAQ selection, either click the 'FAQ' hyperlink at left or select 
    the 'Frequently Asked Questions (FAQs)' hyperlink on the top.</li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/misc/faq_apply_membership.jsp")) {
%>
<center>
</center>
<center>
  <b>FAQ: Applying for Membership </b> 
</center>
<ul>
  <li>Part of FAQ information.</li>
  <li>About the procedure and the fees to applying membership.</li>
  <li>To back to FAQ selection, either click the 'FAQ' hyperlink at left or select 
    the 'Frequently Asked Questions (FAQs)' hyperlink on the top</li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/misc/about.jsp")) {
%>
<center>
  <b>About</b>
</center>
<ul>
  <li>Some information about the system: Background and Mission, Objective and 
    the meaning of the logo for this application<br>
  </li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/search/search_libraryitem.jsp")) {
%>
<center>
  <b>Library Item Search</b>
</center>
	
<ul>
  <li>When you first came it, or if you leave all the fields empty, system will 
    display all the items in database. </li>
  <li>Anyway, you can limit the search by filter the Subject, Media Type or Language. 
    Furthermore youcan combine the filter with keyin the search criteria for item 
    title, call number, keyword or/and ISBN. </li>
  <li>You can limit the search result disply on screen by specify the record per 
    page. </li>
  <li>If search result is more then record per page specify, you can navigates 
    by select eitehr first page, previous page, next page or last page. </li>
  <li>By click on the item title, system will bring you to the item detail. </li>
</ul>
<p>U may sort the search result by click on icons below:<br>
</p>
<table width="70%" border="1">
  <tr> 
    <td width="50%"><img src="../images/common/icon_sort_down_off.gif" width="10" height="7"> 
      Descend order</td>
    <td><img src="../images/common/icon_sort_up_off.gif" width="20" height="7"> 
      Ascend order</td>
  </tr>
</table>
<br>
Meaning use in the result header<br>
<table width="70%" border="1">
  <tr> 
    <td width="20%">QTY</td>
    <td>Total Quantity for the item</td>
  </tr>
  <tr> 
    <td width="20%">AVA</td>
    <td>Current Available quantity for the item</td>
  </tr>
  <tr> 
    <td width="20%">BOR</td>
    <td>Current borrow out quantity for the item</td>
  </tr>
  <tr>
    <td width="20%">RES</td>
    <td>Current reserve quantity for the item</td>
  </tr>
</table>
<BR>
<hr>
<% } else if (refURL.equals("/JavaLibrary/admin/user_list.jsp")) {
%>
<center>
  <b>User List</b>
</center>
	
<p>Restrict access by: <i>admin</i> and <i>librarian</i> . <br>
  <br>
  <i>Librarian</i><br>
</p>
<ul>
  <li>You can add a new user by select [Add new user record] </li>
  <li>When U frist came it, or if youleave all the fields empty, system will display 
    all the users in database. Anyway, you can limit the search by filter the 
    user access level. Furthermore you can combine the filter with key in the 
    search criteria for user id, user first name or/and user last name.</li>
  <li>You can limit the search result display on screen by specify the record 
    per page.</li>
  <li>If search result is more then records per page specify, you can navigate 
    by select first page, previous page, next page or last page. </li>
  <li>By click on the user ID, system will bring U to the user edit section if 
    the user is belong to borrower access level. Else system will display view 
    section for the user who belong to librarian and admin access level. In other 
    word, librarian login cannot change other librarian and admin user data.</li>
</ul>

  
<p><i>Admin (same as Librarian with extra option)</i></p>
<ul>
  <li>Admin can edit all user</li>
  <li>Admin can delete user by click on the checkbox and follow by delete button. 
    However, it is limit to condition:
    <ul>
      <li> Admin cannot delete himself/herself</li>
      <li>User that still have item not yet return cannot be delete</li>
      <li>User that still have reservation in queue cannot be delete</li>
    </ul>
  </li>
</ul>
<p>U may sort the search result by click on icons below:<br>
</p>
<table width="70%" border="1">
  <tr> 
    <td width="50%"><img src="../images/common/icon_sort_down_off.gif" width="10" height="7"> 
      Descend order</td>
    <td><img src="../images/common/icon_sort_up_off.gif" width="20" height="7"> 
      Ascend order</td>
  </tr>
</table>
<hr>
<% } else if (refURL.equals("/JavaLibrary/admin/libraryitem_list.jsp")) {
%>
<center>
  <b>Library Item List</b>
</center>
<p>Restrict access by: <i>admin</i>. <br>
  <br>
  <i>Admin</i><br>
</p>
<ul>
  <li>You can add a new item by select [Add new item record] </li>
  <li>When you first came it, or if you leave all the fields empty, system will 
    display all the items in database. Anyway, you can limit the search by filter 
    the Subject, Media and/or Language. Furthermore you can combine the filter 
    with key in the search criteria for title, call number, keyword or/and ISBN.</li>
  <li>You can limit the search result display on screen by specify the record 
    per page.</li>
  <li>If search result is more then records per page specify, you can navigate 
    by select first page, previous page, next page or last page. </li>
  <li>By click on the item title, system will bring you to the item edit section 
  <li>Admin can delete item by click on the checkbox and follow by delete button. 
    However, it is limit to condition: 
    <ul>
      <li>Item still have quantity not yet return by borrower</li>
      <li>Item still have quantity in reserve queue</li>
    </ul>
  </li>
</ul>
<p>U may sort the search result by click on icons below:</p>
<table width="70%" border="1">
  <tr> 
    <td width="50%"><img src="../images/common/icon_sort_down_off.gif" width="10" height="7"> 
      Descend order</td>
    <td><img src="../images/common/icon_sort_up_off.gif" width="20" height="7"> 
      Ascend order</td>
  </tr>
</table>
<br>
Meaning use in the result header<br>
<table width="70%" border="1">
  <tr> 
    <td width="20%">QTY</td>
    <td>Total Quantity for the item</td>
  </tr>
  <tr> 
    <td width="20%">AVA</td>
    <td>Current Available quantity for the item</td>
  </tr>
  <tr> 
    <td width="20%">BOR</td>
    <td>Current borrow out quantity for the item</td>
  </tr>
  <tr> 
    <td width="20%">RES</td>
    <td>Current reserve quantity for the item</td>
  </tr>
</table>
<hr>
<% } else if (refURL.equals("/JavaLibrary/admin/borrow_list.jsp")) {
%>
<center>
  <b>Borrow List</b>
</center>
<p>Restrict access by: <i>admin</i><br>
  <br>
  <i>Admin</i><br>
</p>
<ul>
  <li>When you first came it, or if youleave all the fields empty, system will 
    display all the borrow record in database. Anyway, you can limit the search 
    by filter the borrow status (overdue, borrow or return). Furthermore you can 
    combine the filter with key in the search criteria for Borrower ID and/or 
    Item Call Number.</li>
  <li>U can limit the search result display on screen by specify the record per 
    page.</li>
  <li>If search result is more then records per page specify, you can navigate 
    by select first page, previous page, next page or last page. </li>
  <li>Click on the borrower ID to sent notice to borrower via email.
  <li>Click on the item title, system will bring you to the item edit section 
</ul>
<p>U may sort the search result by click on icons below:</p>
<table width="70%" border="1">
  <tr> 
    <td width="50%"><img src="../images/common/icon_sort_down_off.gif" width="10" height="7"> 
      Descend order</td>
    <td><img src="../images/common/icon_sort_up_off.gif" width="20" height="7"> 
      Ascend order</td>
  </tr>
</table>
<br>
<hr>
<% } else if (refURL.equals("/JavaLibrary/admin/reserve_list.jsp")) {
%>
<center>
  <b>Reserve List</b>
</center>
	
<p>Restrict access by: <i>admin</i><br>
  <br>
  <i>Admin</i><br>
</p>
<ul>
  <li>When you first came it, or if you leave all the fields empty, system will 
    display all the reserve record in database. Anyway, you can limit the search 
    by filter the reserve status (over reserve period, available or queue). Furthermore 
    you can combine the filter with key in the search criteria for Reserver ID 
    and/or Item Call Number.</li>
  <li>You can limit the search result display on screen by specify the record 
    per page.</li>
  <li>If search result is more then records per page specify, You can navigate 
    by select first page, previous page, next page or last page. </li>
  <li>Click on the borrower ID to sent notice to borrower via email. 
  <li>Click on the item title, system will bring you to the item view section 
  <li>To cancel the reservation, just by click on the checkbox and follow by 'cancel 
    reservation' button. System will update the library item reserve quantity, 
    user reserve quota and reservation availability for next reserver in queue. 
</ul>
<p>U may sort the search result by click on icons below:</p>
<table width="70%" border="1">
  <tr> 
    <td width="50%"><img src="../images/common/icon_sort_down_off.gif" width="10" height="7"> 
      Descend order</td>
    <td><img src="../images/common/icon_sort_up_off.gif" width="20" height="7"> 
      Ascend order</td>
  </tr>
</table>
<hr>
<% } else if (refURL.equals("/JavaLibrary/admin/penalty_list.jsp")) {
%>
<center>
  <b>Penalty List</b>
</center>
<p>Restrict access by: <i>admin</i><br>
</p>
<ul>
  <li>When you first came it, or if you leave all the fields empty, system will 
    display all the penalty record in database. Anyway, you can limit the search 
    by key in the Borrower ID.</li>
  <li>You can limit the search result display on screen by specify the record 
    per page.</li>
  <li>If search result is more then records per page specify, you can navigate 
    by select first page, previous page, next page or last page. </li>
  <li>Click on the item title, system will bring You to the item view section 
  <li>Click on the borrower record number, system will display the borrow record 
    in detail. 
  <li>Total penalty will be display at the bottom of the screen.
</ul>
<p>U may sort the search result by click on icons below:</p>
<table width="70%" border="1">
  <tr> 
    <td width="50%"><img src="../images/common/icon_sort_down_off.gif" width="10" height="7"> 
      Descend order</td>
    <td><img src="../images/common/icon_sort_up_off.gif" width="20" height="7"> 
      Ascend order</td>
  </tr>
</table>
<hr>
<% } else if (refURL.equals("/JavaLibrary/operation/borrow.jsp")) {
%>
<center>
  <b>Borrow</b>
</center>
	
<p>Restrict access by: <i>admin</i> and <i>librarian</i>. </p>
<ul>
  <li>To perform the borrow operation, U must fill in the borrower ID, Item Call 
    Number for the items to borrow out, add to borrow list and finally press the 
    'process to borrow' button on the bottom. Condition apply: 
    <ul>
      <li>Borrower ID: 
        <ul>
          <li>Must have borrow quota available more then zero and is a valid ID</li>
          <li>Cannot same as the staff in charge.</li>
        </ul>
      </li>
      <li>Item Call Number: 
        <ul>
          <li>Must be valid item call number</li>
          <li>Quantity available must more then zero and more than the total reserver 
            request for that item in queue</li>
        </ul>
      </li>
      <li>Add to borrow List. 
        <ul>
          <li>After U had search the item, just press the button label 'add to 
            borrow list' (will appear if valid item call number had keyin).</li>
          <li>U can add as many item to your borrow list. </li>
          <li>But before process the borrow operation, system will check the number 
            of items at borrow list with the user's borrow quota available. The 
            number of item that will be borrowed cannot more then the user available 
            quota. </li>
        </ul>
      </li>
      <li>Borrow List 
        <ul>
          <li>To remove the item from borrow list, just click on the checkbox 
            and follow by the button label 'Remove from list'.</li>
        </ul>
      </li>
    </ul>
  </li>
  <li>Error message with explanation will be display if the borrow condition not 
    follow.</li>
  <li> Borrow for item will be skipping if user had borrowed the same item, which 
    not yet returns, and/or the same item had in his/her reserve list. </li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/operation/return.jsp")) {
%>
<center>
  <b>Return</b>
</center>
	
<p>Restrict access by: <i>admin</i> and <i>librarian.</i></p>
<ul>
  <li>To perform the return operation, you must fill in the borrower ID which 
    must be valid and not the same as the staff in charge, then the system will 
    display a list of items that user currently borrow.</li>
  <li>&middot; Then select the items user wishes to return by click on the checkbox, 
    and follow by 'Process item return' button. System automatically will update 
    the user total borrow quota, item available quantity and reserve queue for 
    the reserver who had make reservation for that item. </li>
  <li>If the return item had request by reserver, it will be make as available 
    in reservation queue as first came first serve basic. The current date will 
    be record as inform date. Well, the cancel reservation period will be one 
    week later.</li>
  <li>Click on the item title, system will bring you to the item view section 
  </li>
  <li>If the borrow status is overdue, then penalty will be calculate as $1.50 
    per days </li>
  <li>Total Penalty for the user will be calculates and display in database process 
    result page.</li>
</ul>
<hr>
<% } else if(refURL.equals("/JavaLibrary/common/dbprocess_result.jsp")) {
%>
<center>
  <b>Database Result </b>
</center>
	
<ul>
  <li> This Page display the results for database process like return, borrow, 
    make reservation, and cancel reservation. </li>
  <li> Result includes the number of success and the error with message that may 
    occur. </li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/user/myaccount.jsp")) {
%>
<center>
  <b>My Account </b>
</center>
<ul>
  <li>This section let login user modify theirs own record. .</li>
  <li>Can modify filed include ID, Password, last name, first name, gender, email, 
    address, city, state, country, postcode, occupation and contact. </li>
  <li> If you change the login ID, the new ID must be unique and not use by other 
    user, else system will skip the update and display the error message in database 
    result page.</li>
  <li> To preserve database integrity, user total reservation quota, current reservation 
    number, item borrow quota and current number of item borrow out cannot be 
    change even for admin login. </li>
  <li> The change will be immediate re-flash after press the 'submit' button. 
  </li>
  <li>Field with * beside is require to fill in.</li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/user/my_borrow_list.jsp")) {
%>
<center>
  <b>My Borrow List </b> 
</center>
<ul>
  <li> This section let user check their borrow history either had return, just 
    borrow out or had overdue. </li>
  <li> As every time user login, system will update the reserve record and borrow 
    record, so all information display are updated</li>
  <li>When you first came it, or if you leave all the fields empty, system will 
    display all the borrow history for particular login user. Anyway, user can 
    limit the search by filter the borrow status (overdue, current borrow out 
    or had return). </li>
  <li>You can limit the search result display on screen by specify the record 
    per page.</li>
  <li> If search result is more then records per page specify, you can navigate 
    by select first page, previous page, next page or last page. </li>
  <li>Click on the item title, system will bring you to the item view section 
  </li>
</ul>
<p>U may sort the search result by click on icons below:</p>
<table width="70%" border="1">
  <tr> 
    <td width="50%"><img src="../images/common/icon_sort_down_off.gif" width="10" height="7"> 
      Descend order</td>
    <td><img src="../images/common/icon_sort_up_off.gif" width="20" height="7"> 
      Ascend order</td>
  </tr>
</table>
<hr>
<% } else if (refURL.equals("/JavaLibrary/user/reservation_add.jsp")){
%>
<center>
  <b>Add Reservation</b>
</center>
<ul>
  <li>To perform the reserve operation, you must fill in the Item Call Number 
    for the items to reserve, add to reserve list and finally press the Process 
    to reserve' button on the bottom. Condition apply: 
    <ul>
      <li>Item Call Number: 
        <ul>
          <li>Must be valid item call number</li>
          <li>Quantity available must either not available or the total available 
            is less then the total reserver request for that item in queue</li>
        </ul>
      </li>
      <li>Add to reserve List. 
        <ul>
          <li>After you had search the item, just press the button label 'add 
            to reserve list' (will appear if valid item call number had key in).</li>
          <li>You can add as many items to your reserve list. </li>
          <li> Before process the reserve operation, system will check the number 
            of items at reserve list with yours reserve quota available. The number 
            of item that will be reserve cannot more then the user available quota. 
          </li>
        </ul>
      </li>
      <li>Reserve List 
        <ul>
          <li>To remove the item from reserve list, just click on the checkbox 
            and follow by the button label 'Remove from list'.</li>
        </ul>
      </li>
    </ul>
  </li>
  <li>Error message with explanation will be display if the borrow condition not 
    follow.</li>
  <li>Reservation will be auto cancel after 1 week from the date makes reservation.</li>
  <li>Reservation for item will be skips if user had borrowed the same item, which 
    not yet returns, and/or the same item had in his/her reserve list. </li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/user/my_reservation_list.jsp")) {
%>
<center>
  <b>My Reservation</b>
</center>
<ul>
  <li>This section let user check their reservation either had over reserve period, 
    still in queue or had available (when other people had return or had cancel 
    the available reservation).</li>
  <li> As every time user login, system will update the reserve record and borrow 
    record, so all information display are updated </li>
  <li>When you first came it, or if you leave all the fields empty, system will 
    display all the reservation for particular login user. Anyway, user can limit 
    the search by filter the reservation status (over reserve period, queue or 
    available).</li>
  <li>You can limit the search result display on screen by specify the records 
    per page.</li>
  <li>If search result is more then records per page specify, you can navigate 
    by select first page, previous page, next page or last page. </li>
  <li>Click on the item title, system will bring you to the item view section 
  </li>
</ul>
<p>U may sort the search result by click on icons below:</p>
<table width="70%" border="1">
  <tr> 
    <td width="50%"><img src="../images/common/icon_sort_down_off.gif" width="10" height="7"> 
      Descend order</td>
    <td><img src="../images/common/icon_sort_up_off.gif" width="20" height="7"> 
      Ascend order</td>
  </tr>
</table>
<hr>
<% } else if (refURL.equals("/JavaLibrary/user/user_add.jsp")) {
%>
<center>
  <b>Add User</b>
</center>
<p>Restrict access by: <i>admin</i> and <i>librarian</i> .</p>
<p><i>Librarian</i></p>
<ul>
  <li>Librarian only can add user with borrower access right.</li>
  <li>New borrower wil be assign 
    <ul>
      <li>10 for item borrow quot </li>
      <li>3 for reservation quota.</li>
    </ul>
  </li>
  <li>Field with * beside is require to fill in. System will preform complete 
    checking before process the add operation.</li>
</ul>
<p><i>Admin (same as Librarian with extra option)</i></p>
<ul>
  <li>Admin can add any type of user (borrower, librarian, admin).</li>
  <li>The total quota for item borrow and total quota for reservation is depend 
    on user access level: 
    <ul>
      <li>Admin: 20 for borrow quota and 3 for reservation quota</li>
      <li>Librarian: 15 for borrow quota and 3 for reservation quota</li>
      <li>Borrower: 10 for borrow quota and 3 for reservation quota</li>
    </ul>
  </li>
  <li>Anyway, system allow admin to manually assign the borrow quota and reservation 
    quota for new user (take caution for this, because to preserve database integrity, 
    the assign quotas cannot be change later on). </li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/user/user_edit.jsp")) {
%>
<center>
  <b>Edit User</b>
</center>
<p>Restrict access by: <i>admin</i> and <i>librarian.</i></p>
<ul>
  <li><i>This section let admin and librarian modify other user record. </i></li>
</ul>
<p><i>Librarian</i></p>
<ul>
  <li>Librarians are restricting to edit borrower user only. If librarian clicks 
    on admin or other librarian user record from user list, system will show then 
    view records instead of edit record section. </li>
  <li>If you change the user login ID, the new ID must be unique and not use by 
    other user, else system will skip the update and display the error message 
    in database result page.</li>
  <li> To preserve database integrity, user total reservation quota, current reservation 
    number, item borrow quota and current number of item borrow out cannot be 
    change even for admin login. </li>
  <li> The change will be immediate re-flash after press the 'submit' button. 
  </li>
  <li>Field with * beside is require to fill in.</li>
</ul>
<p><i>Admin (same as Librarian with extra option)</i></p>
<ul>
  <li>Admin can edit any user</li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/libraryitem/libraryitem_add.jsp")) {
%>
<center>
  <b>Add Library Item</b>
</center>
<p>Restrict access by: <i>admin</i></p>
<ul>
  <li>Field with * beside is require to fill in. System will preform complete 
    checking before process the add operation.</li>
  <li>The Item Call Number will be auto generate using the combination of Subject 
    + Media + next record autoindex</li>
  <li>To preserve database integrity, the item call number will not be change 
    even later on that item had change the subject or/and media type.</li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/libraryitem/libraryitem_edit.jsp")) {
%>
<center>
  <b>Edit Library Item</b>
</center>
<p>Restrict access by: <i>admin</i></p>
<ul>
  <li>Field with * beside is require to fill in. System will preform complete 
    checking before process the add operation.</li>
  <li>To preserve database integrity, the item call number will not be change 
    even item had change the subject or/and media type.</li>
  <li>If item total quantity had change, the item new total availability will 
    be re-calculate.</li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/libraryitem/libraryitem_view.jsp")) {
%>
<center>
  <b>View Library Item</b>
</center>
<ul>
  <li>This section let you view the library item in detail</li>
  <li>No modify (edit) allow.</li>
</ul>
<hr>
<% } else if (refURL.equals("/JavaLibrary/about/songjing.jsp")) {
%>
<center>
  <b>About Me</b>
</center>
<br>
Brief information about me: Lim Song Jing. <br>
<br>
More detail, please surf to: <a href="http://www.geocities.com/limsongjing/%20" target="_blank">http://www.geocities.com/limsongjing/ 
</a> 
<hr>
<% } else if (refURL.equals("/JavaLibrary/about/contact.jsp")) {
%>
<center>
  <b>Contact me</b>
</center>
<br>
The way, you can reach me, via email or normal mail if you face any problem or 
have comment for this application. 
<hr>
<% } else if (refURL.equals("")) {
%>
<center>-</center>
	Sorry, that is no help for this section
<hr>
<% } else {
%>
<center>
</center><br>
	Sorry, that is no help for this section. 
<hr>
<%	} 
} else {
%>
<center>
</center><br>
	Sorry, that is no help for this section. 
<hr>
<%	
}
%>
<center>
  <a href="#" onclick="window.close()"><img src="../images/help/22_btn_x.gif" width="20" height="17"></a> 
  <a href="#" onclick="window.close()"><img src="../images/help/22_btn_close.gif" width="50" height="17"></a> 
</center>

</BODY>
</HTML>