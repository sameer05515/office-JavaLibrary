<%! boolean debug=false; 
%>

<SCRIPT LANGUAGE="JavaScript">
<!-- HIDE THE SCRIPT FROM OTHER BROWSERS
function validateComplete(formObj) {

	formObj.itemCategory.value = generateItemCategory(formObj.itemSubject.value);
	<% if (form.getFormType().equals("add")){
	%>	formObj.itemTotAvailable.value = formObj.itemTotQuantity.value;
		formObj.itemTotReserve.value = 0;
	<%	}
	%>

	if (!dropDownMenu(formObj.itemSubject, "\nYou must make a selection from the subject drop-down menu.")) {
	} else if(isCategory(formObj.itemSubject.value)) {
		alert("U cannot use main category as subject"); formObj.itemSubject.focus();
	} else if(!dropDownMenu(formObj.itemMediaType, "\nYou must make a selection from the Media drop-down menu.")) {
	} else if(!dropDownMenu(formObj.itemLanguage, "\nYou must make a selection from the Language drop-down menu.")) {
	} else if(emptyField(formObj.itemTitle)) {
		alert("Please fill out the item title"); formObj.itemTitle.focus(); 
	} else if(emptyField(formObj.itemKeyword)) {
		alert("please fill out the item keyword"); formObj.itemKeyword.focus();
	} else if(emptyField(formObj.itemTotQuantity)) {
		alert("Please fill out the Total Quantity"); formObj.itemTotQuantity.focus();
	} else if(formObj.itemTotQuantity.value <= 0) {
		alert("Item total quantity cannot less then 0"); formObj.itemTotQuantity.focus();
 //	} else if(formObj.itemTotQuantity.value < ((formObj.itemTotAvailable.value-0) + (formObj.itemTotBorrow.value-0))) {
//		alert("Item total quantity cannot less then the sum of total avaialble and borrow out");
	} else if( ((formObj.itemTotQuantity.value - <%= libraryitem.getItemTotQuantity() %>) + (formObj.itemTotAvailable.value-0)) < 0 ) {
		alert("The change your make for total quantity had change total available become negative!");
	} else {
		alert ("Thanks, All complete");
		<% 	if (form.getFormType().equals("add")){
		%>	
			formObj.itemCallNumber.value = generateCallNumber(formObj.itemSubject.value,
				formObj.itemMediaType.value, formObj.itemRecNumber.value);
			alert("Call Number for this item: " +formObj.itemCallNumber.value);
		<%} else {
		%>
			//alert("Old item total quantity: " +<%= libraryitem.getItemTotQuantity() %>);
			//alert("Old item total available: " +<%= libraryitem.getItemTotAvailable() %>);
			formObj.itemTotAvailable.value = (formObj.itemTotQuantity.value - <%= libraryitem.getItemTotQuantity() %>) + (formObj.itemTotAvailable.value-0);
			//alert("New item total quantity: " +formObj.itemTotQuantity.value);
			alert("New item total available: " +formObj.itemTotAvailable.value);
		<%} 
		%>
		return true;
	}
    return false;	
}

function isCategory(itemSubject)
{
	if ((itemSubject == "Arts") || (itemSubject =="Business") || (itemSubject =="Computing") 
		|| (itemSubject =="Commerce") || (itemSubject == "Education") 
		|| (itemSubject == "Engineering and Surveying") || (itemSubject == "Science and Technology") )
		return true;
	else
		return false;
}

function generateItemCategory(itemSubject){
	var itemCategory;
	// Arts Category
	if( (itemSubject == "Anthropology") || (itemSubject == "Journalism") || (itemSubject == "English Literature") 
		|| (itemSubject == "Media") || (itemSubject == "Music") || (itemSubject == "Theatre") 
		|| (itemSubject == "Visual Arts") ) {
		return "Arts";
	} else if( (itemSubject =="CRM") || (itemSubject == "Economics") || (itemSubject == "Employment") 
		|| (itemSubject == "HRM") || (itemSubject == "Marketing") || (itemSubject == "Information Systems") 
		|| (itemSubject == "Resource Management") ) {
		return "Business";
	} else if( (itemSubject == "Accounting") || (itemSubject == "Banking") || (itemSubject == "Finance") 
		|| (itemSubject == "Law") ) {
		return "Commerce";
	} else if( (itemSubject =="Application") || (itemSubject =="Certify Exam") || (itemSubject =="Computer Graphics") 
		|| (itemSubject =="Database") || (itemSubject =="Networking") || (itemSubject =="Operating System") 
		|| (itemSubject =="Programming") || (itemSubject =="Telecommunication") || (itemSubject =="Web Development") ) {
		return "Computing";
	} else if( (itemSubject == "Early Childhood") || (itemSubject == "Further Ed and Training") ) {
		return "Education"; 
	} else if( (itemSubject == "Agricultural") || (itemSubject == "Civil") || (itemSubject == "Electrical") 
		|| (itemSubject == "Mechanical")) {
		return "Engineering and Surveying Category";
	} else if( (itemSubject == "Biology") || (itemSubject == "Chemistry") || (itemSubject == "Maths") 
		|| (itemSubject == "Nursing") || (itemSubject == "Physics") || (itemSubject == "Psychology")) {
		return "Science and Technology Category";
	} else {
		return "Other";
	}
}

function generateCallNumber(itemSubject, itemMediaType, itemRecNumber) {
	var itemSubjectCode;
	var itemMediaTypeCode;
	itemSubjectCode = itemSubjectCodeConversion(itemSubject);
	itemMediaTypeCode = itemMediaCodeConversion(itemMediaType);
	return (itemSubjectCode +"-" +itemMediaTypeCode + "-" +itemRecNumber);
}

function itemSubjectCodeConversion(itemSubject)
{
	var itemSubjectCode = 0;
	
	// Arts Category
	if (itemSubject == "Anthropology") {
		itemSubjectCode = "A101";
	} else if (itemSubject == "Journalism") {
		itemSubjectCode = "A102";
	} else if (itemSubject == "English Literature") {
		itemSubjectCode = "A103";
	} else if (itemSubject == "Media") {
		itemSubjectCode = "A104";
	} else if (itemSubject == "Music") {
		itemSubjectCode = "A105";
	} else if (itemSubject == "Theatre") {
		itemSubjectCode = "A106";
	} else if (itemSubject == "Visual Arts") {
		itemSubjectCode = "A107";
	// Business Category
	} else if (itemSubject =="CRM") {
		itemSubjectCode = "B101";
	} else if (itemSubject == "Economics") {
		itemSubjectCode = "B102";
	} else if (itemSubject == "Employment") {
		itemSubjectCode = "B103";
	} else if (itemSubject == "HRM") {
		itemSubjectCode = "B104";
	} else if (itemSubject == "Marketing") {
		itemSubjectCode = "B105";
	} else if (itemSubject == "Information Systems") {
		itemSubjectCode = "B106";
	} else if (itemSubject == "Resource Management") {
		itemSubjectCode = "B107";
	// Commerce Category
	} else if (itemSubject == "Accounting") {
		itemSubjectCode = "C101";
	} else if (itemSubject == "Banking") {
		itemSubjectCode = "C102";
	} else if (itemSubject == "Finance") {
		itemSubjectCode = "C103";
	} else if (itemSubject == "Law") {
		itemSubjectCode = "C104";	
	// Computing Category
	} else if (itemSubject =="Application") {
		itemSubjectCode = "C201";
	} else if (itemSubject =="Certify Exam") {
		itemSubjectCode = "C202";
	} else if (itemSubject =="Computer Graphics") {
		itemSubjectCode = "C203";
	} else if (itemSubject =="Database") {
		itemSubjectCode = "C204";
	} else if (itemSubject =="Networking") {
		itemSubjectCode = "C205";
	} else if (itemSubject =="Operating System") {
		itemSubjectCode = "C206";
	} else if (itemSubject =="Programming") {
		itemSubjectCode = "C207";
	} else if (itemSubject =="Telecommunication") {
		itemSubjectCode = "C208";
	} else if (itemSubject =="Web Development") {
		itemSubjectCode = "C209";
	// Educatio Category	
	} else if (itemSubject == "Early Childhood") {
		itemSubjectCode = "E101";
	} else if (itemSubject == "Further Ed and Training") {
		itemSubjectCode = "E102";
	// Engineering and Surveying Category
	} else if (itemSubject == "Agricultural") {
		itemSubjectCode = "E201";
	} else if (itemSubject == "Civil") {
		itemSubjectCode = "E202";
	} else if (itemSubject == "Electrical") {
		itemSubjectCode = "E203";
	} else if (itemSubject == "Mechanical") {
		itemSubjectCode = "E204";
	// Science and Technology Category
	} else if (itemSubject == "Biology") {
		itemSubjectCode = "S101";
	} else if (itemSubject == "Chemistry") {
		itemSubjectCode = "S102";
	} else if (itemSubject == "Maths") {
		itemSubjectCode = "S103";
	} else if (itemSubject == "Nursing") {
		itemSubjectCode = "S104";
	} else if (itemSubject == "Physics") {
		itemSubjectCode = "S105";
	} else if (itemSubject == "Psychology") {
		itemSubjectCode = "S106";
	} else {
		itemSubjectCode = "O101";
	}
	return itemSubjectCode;
}

function itemMediaCodeConversion(itemMediaType)
{
	var itemMediaTypeCode=0;

	if (itemMediaType == "Audio CD") {
		itemMediaTypeCode = "A001";
	} else if (itemMediaType == "Audio Cassette") {
		itemMediaTypeCode = "A002";
	} else if (itemMediaType == "Book") {
		itemMediaTypeCode = "B001";
	} else if (itemMediaType =="CD-ROM") {
		itemMediaTypeCode = "C001";
	} else if (itemMediaType =="Magazine") {
		itemMediaTypeCode = "M001";
	}else if (itemMediaType =="Map") {
		itemMediaTypeCode = "M002";
	} else if (itemMediaType =="Video") {
		itemMediaTypeCode = "V001";
	} else {
		itemMediaTypeCode = O001;
	}
	return itemMediaTypeCode;
}

// Check that a selection was made.
function emptySelection(selectObj, selectNumber) {
  for (i = 0; i < selectNumber; i++){
    if (selectObj[i].checked) return false;
  }
	return true;
}

//Check to see if field is empty
function emptyField(textObj) {
    if (textObj.value.length == 0) return true;
    else return false;
}

function lengthChk(textObj, length) {
    if (textObj.value.length == length) return true;
    else return false;
}

function dropDownMenu(formObj, myMessage)  {
	var myindex=formObj.selectedIndex;
	if (myindex==0) {
		alert(myMessage);
		formObj.focus();
	} else {
		menu_selection=formObj.options[myindex].value;
		return true;
   }
}
//-->
</script>
<form name="item_form" method="post" action="/JavaLibrary/servlet/sjservlets.FormProcess">
  * Require to fill out<br>
  <table width="100%" border="0" cellspacing="1" cellpadding="1">
    <tr> 
      <td width="31%">Subject*</td>
      <td width="69%"> 
        <%! String itemSubject; %>
        <% itemSubject = libraryitem.getItemSubject(); %>
        <select name="itemSubject">
          <option value="">&nbsp;</option>
          <option value="Arts">Arts</option>
          <option value="Anthropology" <% if (itemSubject.equals("Anthropology")) out.println("selected"); %>>....Anthropology</option>
          <option value="Journalism" <% if (itemSubject.equals("Journalism")) out.println("selected"); %>>....Journalism</option>
          <option value="English Literature" <% if (itemSubject.equals("English Literature")) out.println("selected"); %>>....English 
          Literature</option>
          <option value="Media" <% if (itemSubject.equals("Media")) out.println("selected"); %>>....Media</option>
          <option value="Music" <% if (itemSubject.equals("Music")) out.println("selected"); %>>....Music</option>
          <option value="Theatre" <% if (itemSubject.equals("Theatre")) out.println("selected"); %>>....Theatre</option>
          <option value="Visual Arts" <% if (itemSubject.equals("Visual Arts")) out.println("selected"); %>>....Visual 
          Arts</option>
          <option value="Business">Business</option>
          <option value="CRM" <% if (itemSubject.equals("CRM")) out.println("selected"); %>>....CRM</option>
          <option value="Economics" <% if (itemSubject.equals("Economics")) out.println("selected"); %>>....Economics</option>
          <option value="Employment" <% if (itemSubject.equals("Employment")) out.println("selected"); %>>....Employment</option>
          <option value="HRM" <% if (itemSubject.equals("HRM")) out.println("selected"); %>>....HRM</option>
          <option value="Marketing" <% if (itemSubject.equals("Marketing")) out.println("selected"); %>>....Marketing</option>
          <option value="Information Systems" <% if (itemSubject.equals("Information Systems")) out.println("selected"); %>>....Information 
          Systems</option>
          <option value="Resource Management" <% if (itemSubject.equals("Resource Management")) out.println("selected"); %>>....Resource 
          Management</option>
          <option value="Commerce">Commerce</option>
          <option value="Accounting" <% if (itemSubject.equals("Accounting")) out.println("selected"); %>>....Accounting</option>
          <option value="Banking" <% if (itemSubject.equals("Banking")) out.println("selected"); %>>....Banking</option>
          <option value="Finance" <% if (itemSubject.equals("Finance")) out.println("selected"); %>>....Finance</option>
          <option value="Law" <% if (itemSubject.equals("Law")) out.println("selected"); %>>....Law</option>
          <option value="Computing">Computing</option>
          <option value="Application" <% if (itemSubject.equals("Application")) out.println("selected"); %>>....Application</option>
          <option value="Certify Exam" <% if (itemSubject.equals("Certify Exam")) out.println("selected"); %>>....Certify 
          Exam</option>
          <option value="Computer Graphics" <% if (itemSubject.equals("Computer Graphics")) out.println("selected"); %>>....Computer 
          Graphics</option>
          <option value="Database" <% if (itemSubject.equals("Database")) out.println("selected"); %>>....Database</option>
          <option value="Networking" <% if (itemSubject.equals("Networking")) out.println("selected"); %>>....Networking</option>
          <option value="Operating System" <% if (itemSubject.equals("Operating System")) out.println("selected"); %>>....Operating 
          System</option>
          <option value="Programming" <% if (itemSubject.equals("Programming")) out.println("selected"); %>>....Programming</option>
          <option value="Telecommunication" <% if (itemSubject.equals("Telecommunication")) out.println("selected"); %>>....Telecommunicaiton</option>
          <option value="Web Development" <% if (itemSubject.equals("Web Development")) out.println("selected"); %>>....Web 
          Development</option>
          <option value="Education">Education</option>
          <option value="Early Childhood" <% if (itemSubject.equals("Early Childhood")) out.println("selected"); %>>....Early 
          Childhood</option>
          <option value="Further Edu and Training" <% if (itemSubject.equals("Further Edu and Training")) out.println("selected"); %>>....Further 
          Edu and Training</option>
          <option value="Engineering and Surveying">Engineering and Surveying</option>
          <option value="Agricultural" <% if (itemSubject.equals("Agricultural")) out.println("selected"); %>>....Agricultural</option>
          <option value="Civil" <% if (itemSubject.equals("Civil")) out.println("selected"); %>>....Civil</option>
          <option value="Electrical" <% if (itemSubject.equals("Electrical")) out.println("selected"); %>>....Electrical</option>
          <option value="Mechanical" <% if (itemSubject.equals("Mechanical")) out.println("selected"); %>>....Mechanical</option>
          <option value="Science and Technology">Science and Technology</option>
          <option value="Biology" <% if (itemSubject.equals("Biology")) out.println("selected"); %>>....Biology</option>
          <option value="Chemistry" <% if (itemSubject.equals("Chemistry")) out.println("selected"); %>>....Chemistry</option>
          <option value="Maths" <% if (itemSubject.equals("Maths")) out.println("selected"); %>>....Maths</option>
          <option value="Nursing" <% if (itemSubject.equals("Nursing")) out.println("selected"); %>>....Nursing</option>
          <option value="Physics" <% if (itemSubject.equals("Physics")) out.println("selected"); %>>....Physics</option>
          <option value="Psychology" <% if (itemSubject.equals("Psychology")) out.println("selected"); %>>....Psychology</option>
        </select>
        <input type='hidden' name='itemCategory' value=''>
      </td>
    </tr>
    <tr> 
      <td width="31%">Media*</td>
      <td width="69%"> 
        <%! String itemMediaType; %>
        <% itemMediaType = libraryitem.getItemMediaType(); %>
        <select name=itemMediaType>
          <option value="">&nbsp;</option>
          <option value="Audio CD" <% if (itemMediaType.equals("Audio CD")) out.println("selected"); %>>Audio 
          CD</option>
          <option value="Audio Cassette" <% if (itemMediaType.equals("Audio Cassette")) out.println("selected"); %>>Audio 
          Cassette</option>
          <option value="Book" <% if (itemMediaType.equals("Book")) out.println("selected"); %>>Book</option>
          <option value="CD-ROM" <% if (itemMediaType.equals("CD-ROM")) out.println("selected"); %>>CD-ROM</option>
          <option value="Magazine" <% if (itemMediaType.equals("Magazine")) out.println("selected"); %>>Magazine</option>
          <option value="Map" <% if (itemMediaType.equals("Map")) out.println("selected"); %>>Map</option>
          <option value="Other" <% if (itemMediaType.equals("Other")) out.println("selected"); %>>Other</option>
          <option value="Video" <% if (itemMediaType.equals("Video")) out.println("selected"); %>>Video</option>
        </select>
      </td>
    </tr>
    <tr> 
      <td width="31%">Language*</td>
      <td width="69%"> 
        <%! String itemLanguage; %>
        <% itemLanguage = libraryitem.getItemLanguage(); %>
        <select name=itemLanguage>
          <option value="">&nbsp</option>
          <option value="English" <% if (itemLanguage.equals("English")) out.println("selected"); %>>English</option>
          <option value="Chinese" <% if (itemLanguage.equals("Chinese")) out.println("selected"); %>>Chinese</option>
          <option value="Malay" <% if (itemLanguage.equals("Malay")) out.println("selected"); %>>Malay 
          </option>
          <option value="Tamil" <% if (itemLanguage.equals("Tamil")) out.println("selected"); %>>Tamil</option>
        </select>
      </td>
    </tr>
    <tr> 
      <td width="31%"> </td>
    </tr>
    <tr> 
      <td width="31%">Call Number</td>
      <td width="69%"> 
        <%	if (form.getFormType().equals("add")){
					out.println("<i>Auto Generate</i>");
					out.println("<input type='hidden' name='itemCallNumber' value=''>");
					out.println("<input type='hidden' name='itemRecNumber' value='" +nextRecNumber +"'>");
			}else{
				out.println(libraryitem.getItemCallNumber());
			} 
		%>
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
        <input type="text" name="itemPublisherName" size="32" maxlength="30" value="<jsp:getProperty name="libraryitem" property="itemPublisherName" />">
      </td>
    </tr>
    <tr> 
      <td width="31%" height="32">ISBN</td>
      <td width="69%" height="32"> 
        <input type="text" name="itemISBN" size="17" maxlength="15" value="<jsp:getProperty name="libraryitem" property="itemISBN" />">
      </td>
    </tr>
    <tr> 
      <td width="31%">Length</td>
      <td width="69%"> 
        <input type="text" name="itemLength" maxlength="6" size="8" value="<jsp:getProperty name="libraryitem" property="itemLength" />">
        Hour(s) or Page(s)</td>
    </tr>
    <tr> 
      <td width="31%">Year</td>
      <td width="69%"> 
        <input type="text" name="itemYear" maxlength="4" size="6" value="<jsp:getProperty name="libraryitem" property="itemYear" />">
      </td>
    </tr>
    <tr> 
      <td width="31%">Total Quantity*</td>
      <td width="69%"> 
        <input type="text" name="itemTotQuantity" value="<%= libraryitem.getItemTotQuantity() %>" maxlength="3" size="5">
      </td>
    </tr>
    <tr> 
      <td width="31%">Total Available*</td>
      <td width="69%"> 
        <% if (form.getFormType().equals("add")){
	        	out.println("<input type='hidden' name='itemTotAvailable'>");
				out.println("<i>It will be same as Total Quantity</i>");	
			} else {
				out.println("<input type='hidden' name='itemTotAvailable' value='" +libraryitem.getItemTotAvailable() +"'>");
				out.println(libraryitem.getItemTotAvailable()); 
			}
		%>
      </td>
    </tr>
    <tr> 
      <td width="31%">Total Borrow Out</td>
      <td width="69%"> 
        <% if (form.getFormType().equals("add")){
        		out.println("<input type='hidden' name='itemTotBorrow' value='0'>");
				out.println("<i>0</i>");	
			} else {
				out.println("<input type='hidden' name='itemTotBorrow' value='" +libraryitem.getItemTotBorrow() +"'>");
				out.println(libraryitem.getItemTotBorrow()); 
			}
		%>
      </td>
    </tr>
    <tr> 
      <td width="31%">Total Reserve*</td>
      <td width="69%"> 
        <% if (form.getFormType().equals("add")){
	        	out.println("<input type='hidden' name='itemTotReserve' value='0'>");
				out.println("<i>0</i>");	
			} else {
				out.println("<input type='hidden' name='itemTotReserve' value='" +libraryitem.getItemTotReserve() +"'>");
				out.println(libraryitem.getItemTotReserve()); 
			}
		%>
      </td>
    </tr>
  </table>
  <p> 
    <input type="submit" name="Submit" value="Submit" onClick='return validateComplete(document.item_form)'>
    <input type="reset" name="Reset" value="Reset">
  </p>
</form>
