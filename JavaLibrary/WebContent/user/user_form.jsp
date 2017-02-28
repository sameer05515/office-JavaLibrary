<%! boolean debug=false; 
	String userType; 
	String loginUserType; 
	String loginUserID;
%>
<% 	userType = user.getUserType();
	loginUserType = login.getUserType();
	loginUserID = login.getUserID();
%>

<SCRIPT LANGUAGE="JavaScript">
<!-- HIDE THE SCRIPT FROM OTHER BROWSERS
function validateComplete(formObj) {
	if(emptyField(formObj.userID)) {
		alert("Please fill out the user ID"); formObj.userID.focus(); 
	} else if(emptyField(formObj.userPassword)) {
		alert("Please fill out the user Password"); formObj.userPassword.focus(); 
	} else if ((formObj.selectUserType.value=='yes') && (!dropDownMenu(formObj.userType, "\nYou must make a selection from the user type drop-down menu."))) {
	} else if(emptyField(formObj.userFirstName)) {
		alert("Please fill out the user first name"); formObj.userFirstName.focus(); 
	} else if(emptyField(formObj.userLastName)) {
		alert("Please fill out the user last name"); formObj.userLastName.focus(); 
	} else if(emptySelection(formObj.userGender, 2)) {
		alert("Please make a Gender selection"); formObj.userGender[0].focus(); 
	} else if(emptyField(formObj.userEmail)) {
		alert("Please fill out the user Email"); formObj.userEmail.focus(); 
	} else if(emptyField(formObj.userAddress1)) {
		alert("Please fill out the user address"); formObj.userAddress1.focus(); 
	} else if(emptyField(formObj.userCity)) {
		alert("Please fill out the city"); formObj.userCity.focus(); 
	} else if(emptyField(formObj.userState)) {
		alert("Please fill out the state"); formObj.userState.focus(); 
	} else if (!dropDownMenu(formObj.userCountry, "\nYou must make a selection from the country drop-down menu.")) {
	} else if(emptyField(formObj.userPostCode)) {
		alert("Please fill out the post code"); formObj.userPostCode.focus(); 
	} else if (!dropDownMenu(formObj.userOccupation, "\nYou must make a selection from the occupation drop-down menu.")) {
	} else {
		<% if( ((loginUserType.equals("librarian")) || (loginUserType.equals("admin"))) && (form.getFormType().equals("add")) ){
		%>		
				formObj.userQuotaAvailable.value = formObj.userTotQuota.value;
				formObj.userReserveAvailable.value = formObj.userTotReservation.value;
		<%	}
		%>
		alert ("Thanks, All complete");
		return true;
	}	
    return false;
}

function changeUserQuota(formObj){
	var userTotQuota = formObj.userTotQuota.value - 0;
	var userTotQuotaNew = 0;
	var userQuotaAvailable = formObj.userQuotaAvailable.value - 0;
	var userQuotaAvailableNew = 0;
	var userTotQuotaDiference = 0;

	if(formObj.userType.options[1].selected){
		userTotQuotaNew = 20;		
	}else if(formObj.userType.options[2].selected){
		userTotQuotaNew = 15;
	}else if(formObj.userType.options[3].selected){
		userTotQuotaNew = 10;
	}else {
		userTotQuotaNew = 0;
	}
	userQuotaAvailableNew = userQuotaAvailable + (userTotQuotaNew - userTotQuota);

	if(userQuotaAvailableNew<0) {
		alert("The changes had make the user available quota become negative!!");
	}
	formObj.userTotQuota.value = userTotQuotaNew;
	formObj.userQuotaAvailable.value = userQuotaAvailableNew;
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
<form name="user_form" method="post" action="/JavaLibrary/servlet/sjservlets.FormProcess">
  * Require to fill out<br>
  <table width="100%" border="0" cellspacing="1" cellpadding="1">
    <tr> 
      <td width="31%">ID</td>
      <td width="69%"> 
        <p> 
          <input type="text" name="userID" maxlength="10" size="12" 
			value="<jsp:getProperty name="user" property="userID" />">
        </p>
      </td>
    </tr>
    <tr> 
      <td width="31%">Password*</td>
      <td width="69%"> 
        <input type="password" name="userPassword" maxlength="20" size="22"
			value="<jsp:getProperty name="user" property="userPassword" />">
      </td>
    </tr>
    <tr> 
      <td width="31%">User Type*</td>
      <td width="69%"> 
        <%
if( (loginUserType.equals("admin")) && (form.getFormType().equals("add")) ){
%>
        <select name="userType" onchange=changeUserQuota(document.user_form)>
          <option value="">&nbsp</option>
          <option value="admin" <% if (userType.equals("admin")) out.println("selected"); %>>admin</option>
          <option value="librarian" <% if (userType.equals("librarian")) out.println("selected"); %>>librarian</option>
          <option value="borrower" <% if (userType.equals("borrower")) out.println("selected"); %>>borrower</option>
        </select>
        <input type="hidden" name="selectUserType" value="yes">
        <%	}else if( (loginUserType.equals("librarian")) && (form.getFormType().equals("add")) ){
		out.println("borrower");
		out.println("<input type='hidden' name='userType' value='borrower'>");
		out.println("<input type='hidden' name='selectUserType' value='no'>");
	}else {
		out.println(user.getUserType());
		out.println("<input type='hidden' name='userType' value='" +userType +"'>");
		out.println("<input type='hidden' name='selectUserType' value='no'>");
	}
%>
      </td>
    </tr>
    <tr> 
      <td width="31%"> </td>
    </tr>
    <tr> 
      <td width="31%">Last Name*</td>
      <td width="69%"> 
        <input type="text" name="userLastName" maxlength="20" size="22"
			value="<jsp:getProperty name="user" property="userLastName" />">
      </td>
    </tr>
    <tr> 
      <td width="31%"> First Name*</td>
      <td width="69%"> 
        <input type="text" name="userFirstName" maxlength="20" size="22"
			value="<jsp:getProperty name="user" property="userFirstName" />">
      </td>
    </tr>
    <tr> 
      <td width="31%">Gender*</td>
      <td width="69%"> 
        <input type="radio" name="userGender" value="Male"
			<% if (user.getUserGender().equals("Male")) {
				out.println("checked"); }
			%>
		>
        Male 
        <input type="radio" name="userGender" value="Female"
			<% if (user.getUserGender().equals("Female")) {
				out.println("checked"); }
			%>	
		>
        Female </td>
    </tr>
    <tr> 
      <td width="31%">Email*</td>
      <td width="69%"> 
        <input type="text" name="userEmail"
			value="<jsp:getProperty name="user" property="userEmail" />" size="52" maxlength="50">
      </td>
    </tr>
    <tr> 
      <td width="31%">IC/Social Security Number</td>
      <td width="69%"> 
        <input type="text" name="userICNumber"
			value="<jsp:getProperty name="user" property="userICNumber" />" maxlength="15" size="17">
      </td>
    </tr>
    <tr> 
      <td width="31%">Address</td>
      <td width="69%"> 
        <input type="text" name="userAddress1"
			value="<jsp:getProperty name="user" property="userAddress1" />" maxlength="30" size="32">
        *<br>
        <input type="text" name="userAddress2"
			value="<jsp:getProperty name="user" property="userAddress2" />" size="32" maxlength="30">
      </td>
    </tr>
    <tr> 
      <td width="31%">City*</td>
      <td width="69%"> 
        <input type="text" name="userCity"
			value="<jsp:getProperty name="user" property="userCity" />" maxlength="15" size="17">
      </td>
    </tr>
    <tr> 
      <td width="31%">State*</td>
      <td width="69%"> 
        <input type="text" name="userState"
			value="<jsp:getProperty name="user" property="userState" />" maxlength="15" size="17">
      </td>
    </tr>
    <tr> 
      <td width="31%">Country*</td>
      <td width="69%"> 
        <%! String userCountry; %>
        <% userCountry = user.getUserCountry();%>
        <select name="userCountry">
          <option value="">&nbsp</option>
          <option value="Afghanistan [AF]" <% if (userCountry.equals("Afghanistan [AF]")) out.println("selected"); %>>Afghanistan 
          [AF]</option>
          <option value="Albania [AL]" <% if (userCountry.equals("Albania [AL]")) out.println("selected"); %>>Albania 
          [AL]</option>
          <option value="Algeria [DZ]" <% if (userCountry.equals("Algeria [DZ]")) out.println("selected"); %>>Algeria 
          [DZ]</option>
          <option value="American Samoa [AS]" <% if (userCountry.equals("American Samoa [AS]")) out.println("selected"); %>>American 
          Samoa [AS]</option>
          <option value="Andorra [AD]" <% if (userCountry.equals("Andorra [AD]")) out.println("selected"); %>>Andorra 
          [AD]</option>
          <option value="Angola [AO]" <% if (userCountry.equals("Angola [AO]")) out.println("selected"); %>>Angola 
          [AO]</option>
          <option value="Anguilla [AI]" <% if (userCountry.equals("Anguilla [AI]")) out.println("selected"); %>>Anguilla 
          [AI]</option>
          <option value="Antarctica [AQ]" <% if (userCountry.equals("Antarctica [AQ]")) out.println("selected"); %>>Antarctica 
          [AQ]</option>
          <option value="Antigua and Barbuda [AG]" <% if (userCountry.equals("Antigua and Barbuda [AG]")) out.println("selected"); %>>Antigua 
          and Barbuda [AG]</option>
          <option value="Argentina [AR]" <% if (userCountry.equals("Argentina [AR]")) out.println("selected"); %>>Argentina 
          [AR]</option>
          <option value="Armenia [AM]" <% if (userCountry.equals("Armenia [AM]")) out.println("selected"); %>>Armenia 
          [AM]</option>
          <option value="Aruba [AW]" <% if (userCountry.equals("Aruba [AW]")) out.println("selected"); %>>Aruba 
          [AW]</option>
          <option value="Australia [AU]" <% if (userCountry.equals("Australia [AU]")) out.println("selected"); %>>Australia 
          [AU]</option>
          <option value="Austria [AT]" <% if (userCountry.equals("Austria [AT]")) out.println("selected"); %>>Austria 
          [AT]</option>
          <option value="Azerbaijan [AZ]" <% if (userCountry.equals("Azerbaijan [AZ]")) out.println("selected"); %>>Azerbaijan 
          [AZ]</option>
          <option value="Bahama [BS]" <% if (userCountry.equals("Bahama [BS]")) out.println("selected"); %>>Bahama 
          [BS]</option>
          <option value="Bahrain [BH]" <% if (userCountry.equals("Bahrain [BH]")) out.println("selected"); %>>Bahrain 
          [BH]</option>
          <option value="Bangladesh [BD]" <% if (userCountry.equals("Bangladesh [BD]")) out.println("selected"); %>>Bangladesh 
          [BD]</option>
          <option value="Barbados [BB]" <% if (userCountry.equals("Barbados [BB]")) out.println("selected"); %>>Barbados 
          [BB]</option>
          <option value="Belarus [BY]" <% if (userCountry.equals("Belarus [BY]")) out.println("selected"); %>>Belarus 
          [BY]</option>
          <option value="Belgium [BE]" <% if (userCountry.equals("Belgium [BE]")) out.println("selected"); %>>Belgium 
          [BE]</option>
          <option value="Belize [BZ]" <% if (userCountry.equals("Belize [BZ]")) out.println("selected"); %>>Belize 
          [BZ]</option>
          <option value="Benin [BJ]" <% if (userCountry.equals("Benin [BJ]")) out.println("selected"); %>>Benin 
          [BJ]</option>
          <option value="Bermuda [BM]" <% if (userCountry.equals("Bermuda [BM]")) out.println("selected"); %>>Bermuda 
          [BM]</option>
          <option value="Bhutan [BT]" <% if (userCountry.equals("Bhutan [BT]")) out.println("selected"); %>>Bhutan 
          [BT]</option>
          <option value="Bolivia [BO]" <% if (userCountry.equals("Bolivia [BO]")) out.println("selected"); %>>Bolivia 
          [BO]</option>
          <option value="Bosnia and Herzegovina [BA]" <% if (userCountry.equals("Bosnia and Herzegovina [BA]")) out.println("selected"); %>>Bosnia 
          and Herzegovina [BA]</option>
          <option value="Botswana [BW]" <% if (userCountry.equals("Botswana [BW]")) out.println("selected"); %>>Botswana 
          [BW]</option>
          <option value="Bouvet Island [BV]" <% if (userCountry.equals("Bouvet Island [BV]")) out.println("selected"); %>>Bouvet 
          Island [BV]</option>
          <option value="Brazil [BR]" <% if (userCountry.equals("Brazil [BR]")) out.println("selected"); %>>Brazil 
          [BR]</option>
          <option value="British Indian Ocean Territory [IO]" <% if (userCountry.equals("British Indian Ocean Territory [IO]")) out.println("selected"); %>>British 
          Indian Ocean Territory [IO]</option>
          <option value="British Virgin Islands [VG]" <% if (userCountry.equals("British Virgin Islands [VG]")) out.println("selected"); %>>British 
          Virgin Islands [VG]</option>
          <option value="Brunei Darussalam [BN]" <% if (userCountry.equals("Brunei Darussalam [BN]")) out.println("selected"); %>>Brunei 
          Darussalam [BN]</option>
          <option value="Bulgaria [BG]" <% if (userCountry.equals("Bulgaria [BG]")) out.println("selected"); %>>Bulgaria 
          [BG]</option>
          <option value="Burkina Faso [BF]" <% if (userCountry.equals("Burkina Faso [BF]")) out.println("selected"); %>>Burkina 
          Faso [BF]</option>
          <option value="Burundi [BI]" <% if (userCountry.equals("Burundi [BI]")) out.println("selected"); %>>Burundi 
          [BI]</option>
          <option value="C&ocirc;te D'ivoire (Ivory Coast) [CI]" <% if (userCountry.equals("C&ocirc;te D'ivoire (Ivory Coast) [CI]")) out.println("selected"); %>>C&ocirc;te 
          D'ivoire (Ivory Coast) [CI]</option>
          <option value="Cambodia [KH]" <% if (userCountry.equals("Cambodia [KH]")) out.println("selected"); %>>Cambodia 
          [KH]</option>
          <option value="Cameroon [CM]" <% if (userCountry.equals("Cameroon [CM]")) out.println("selected"); %>>Cameroon 
          [CM]</option>
          <option value="Canada [CA]" <% if (userCountry.equals("Canada [CA]")) out.println("selected"); %>>Canada 
          [CA]</option>
          <option value="Cape Verde [CV]" <% if (userCountry.equals("Cape Verde [CV]")) out.println("selected"); %>>Cape 
          Verde [CV]</option>
          <option value="Cayman Islands [KY]" <% if (userCountry.equals("Cayman Islands [KY]")) out.println("selected"); %>>Cayman 
          Islands [KY]</option>
          <option value="Central African Republic [CF]" <% if (userCountry.equals("Central African Republic [CF]")) out.println("selected"); %>>Central 
          African Republic [CF]</option>
          <option value="Chad [TD]" <% if (userCountry.equals("Chad [TD]")) out.println("selected"); %>>Chad 
          [TD]</option>
          <option value="Chile [CL]" <% if (userCountry.equals("Chile [CL]")) out.println("selected"); %>>Chile 
          [CL]</option>
          <option value="China [CN]" <% if (userCountry.equals("China [CN]")) out.println("selected"); %>>China 
          [CN]</option>
          <option value="Christmas Island [CX]" <% if (userCountry.equals("Christmas Island [CX]")) out.println("selected"); %>>Christmas 
          Island [CX]</option>
          <option value="Cocos (Keeling) Islands [CC]" <% if (userCountry.equals("Cocos (Keeling) Islands [CC]")) out.println("selected"); %>>Cocos 
          (Keeling) Islands [CC]</option>
          <option value="Colombia [CO]" <% if (userCountry.equals("Colombia [CO]")) out.println("selected"); %>>Colombia 
          [CO]</option>
          <option value="Comoros [KM]" <% if (userCountry.equals("Comoros [KM]")) out.println("selected"); %>>Comoros 
          [KM]</option>
          <option value="Congo [CG]" <% if (userCountry.equals("Congo [CG]")) out.println("selected"); %>>Congo 
          [CG]</option>
          <option value="Cook Islands [CK]" <% if (userCountry.equals("MCook Islands [CK]")) out.println("selected"); %>>Cook 
          Islands [CK]</option>
          <option value="Costa Rica [CR]" <% if (userCountry.equals("Costa Rica [CR]")) out.println("selected"); %>>Costa 
          Rica [CR]</option>
          <option value="Croatia [HR]" <% if (userCountry.equals("Croatia [HR]")) out.println("selected"); %>>Croatia 
          [HR]</option>
          <option value="Cuba [CU]" <% if (userCountry.equals("Cuba [CU]")) out.println("selected"); %>>Cuba 
          [CU]</option>
          <option value="Cyprus [CY]" <% if (userCountry.equals("Cyprus [CY]")) out.println("selected"); %>>Cyprus 
          [CY]</option>
          <option value="Czech Republic [CZ]" <% if (userCountry.equals("Czech Republic [CZ]")) out.println("selected"); %>>Czech 
          Republic [CZ]</option>
          <option value="Denmark [DK]" <% if (userCountry.equals("Denmark [DK]")) out.println("selected"); %>>Denmark 
          [DK]</option>
          <option value="Djibouti [DJ]" <% if (userCountry.equals("Djibouti [DJ]")) out.println("selected"); %>>Djibouti 
          [DJ]</option>
          <option value="Dominica [DM]" <% if (userCountry.equals("Dominica [DM]")) out.println("selected"); %>>Dominica 
          [DM]</option>
          <option value="Dominican Republic [DO]" <% if (userCountry.equals("Dominican Republic [DO]")) out.println("selected"); %>>Dominican 
          Republic [DO]</option>
          <option value="East Timor [TP]" <% if (userCountry.equals("East Timor [TP]")) out.println("selected"); %>>East 
          Timor [TP]</option>
          <option value="Ecuador [EC]" <% if (userCountry.equals("Ecuador [EC]")) out.println("selected"); %>>Ecuador 
          [EC]</option>
          <option value="Egypt [EG]" <% if (userCountry.equals("Egypt [EG]")) out.println("selected"); %>>Egypt 
          [EG]</option>
          <option value="El Salvador [SV]" <% if (userCountry.equals("El Salvador [SV]")) out.println("selected"); %>>El 
          Salvador [SV]</option>
          <option value="Equatorial Guinea [GQ]" <% if (userCountry.equals("Equatorial Guinea [GQ]")) out.println("selected"); %>>Equatorial 
          Guinea [GQ]</option>
          <option value="Eritrea [ER]" <% if (userCountry.equals("Eritrea [ER]")) out.println("selected"); %>>Eritrea 
          [ER]</option>
          <option value="Estonia [EE]" <% if (userCountry.equals("Estonia [EE]")) out.println("selected"); %>>Estonia 
          [EE]</option>
          <option value="Ethiopia [ET]" <% if (userCountry.equals("Ethiopia [ET]")) out.println("selected"); %>>Ethiopia 
          [ET]</option>
          <option value="Falkland Islands (Malvinas) [FK]" <% if (userCountry.equals("Falkland Islands (Malvinas) [FK]")) out.println("selected"); %>>Falkland 
          Islands (Malvinas) [FK]</option>
          <option value="Faroe Islands [FO]" <% if (userCountry.equals("Faroe Islands [FO]")) out.println("selected"); %>>Faroe 
          Islands [FO]</option>
          <option value="Fiji [FJ]" <% if (userCountry.equals("Fiji [FJ]")) out.println("selected"); %>>Fiji 
          [FJ]</option>
          <option value="Finland [FI]" <% if (userCountry.equals("Finland [FI]")) out.println("selected"); %>>Finland 
          [FI]</option>
          <option value="France [FR]" <% if (userCountry.equals("France [FR]")) out.println("selected"); %>>France 
          [FR]</option>
          <option value="France, Metropolitan [FX]" <% if (userCountry.equals("France, Metropolitan [FX]")) out.println("selected"); %>>France, 
          Metropolitan [FX]</option>
          <option value="French Guiana [GF]" <% if (userCountry.equals("French Guiana [GF]")) out.println("selected"); %>>French 
          Guiana [GF]</option>
          <option value="French Polynesia [PF]" <% if (userCountry.equals("French Polynesia [PF]")) out.println("selected"); %>>French 
          Polynesia [PF]</option>
          <option value="French Southern Territories [TF]" <% if (userCountry.equals("French Southern Territories [TF]")) out.println("selected"); %>>French 
          Southern Territories [TF]</option>
          <option value="Gabon [GA]" <% if (userCountry.equals("Gabon [GA]")) out.println("selected"); %>>Gabon 
          [GA]</option>
          <option value="Gambia [GM]" <% if (userCountry.equals("Gambia [GM]")) out.println("selected"); %>>Gambia 
          [GM]</option>
          <option value="Georgia [GE]" <% if (userCountry.equals("Georgia [GE]")) out.println("selected"); %>>Georgia 
          [GE]</option>
          <option value="Germany [DE]" <% if (userCountry.equals("Germany [DE]")) out.println("selected"); %>>Germany 
          [DE]</option>
          <option value="Ghana [GH]" <% if (userCountry.equals("Ghana [GH]")) out.println("selected"); %>>Ghana 
          [GH]</option>
          <option value="Gibraltar [GI]" <% if (userCountry.equals("Gibraltar [GI]")) out.println("selected"); %>>Gibraltar 
          [GI]</option>
          <option value="Greece [GR]" <% if (userCountry.equals("MGreece [GR]")) out.println("selected"); %>>Greece 
          [GR]</option>
          <option value="Greenland [GL]" <% if (userCountry.equals("Greenland [GL]")) out.println("selected"); %>>Greenland 
          [GL]</option>
          <option value="Grenada [GD]" <% if (userCountry.equals("Grenada [GD]")) out.println("selected"); %>>Grenada 
          [GD]</option>
          <option value="Guadeloupe [GP]" <% if (userCountry.equals("Guadeloupe [GP]")) out.println("selected"); %>>Guadeloupe 
          [GP]</option>
          <option value="Guam [GU]" <% if (userCountry.equals("Guam [GU]")) out.println("selected"); %>>Guam 
          [GU]</option>
          <option value="Guatemala [GT]" <% if (userCountry.equals("Guatemala [GT]")) out.println("selected"); %>>Guatemala 
          [GT]</option>
          <option value="Guinea [GN]" <% if (userCountry.equals("Guinea [GN]")) out.println("selected"); %>>Guinea 
          [GN]</option>
          <option value="Guinea-Bissau [GW]" <% if (userCountry.equals("Guinea-Bissau [GW]")) out.println("selected"); %>>Guinea-Bissau 
          [GW]</option>
          <option value="Guyana [GY]" <% if (userCountry.equals("MGuyana [GY]")) out.println("selected"); %>>Guyana 
          [GY]</option>
          <option value="Haiti [HT]" <% if (userCountry.equals("Haiti [HT]")) out.println("selected"); %>>Haiti 
          [HT]</option>
          <option value="Heard and McDonald Islands [HM]" <% if (userCountry.equals("Heard and McDonald Islands [HM]")) out.println("selected"); %>>Heard 
          and McDonald Islands [HM]</option>
          <option value="Honduras [HN]" <% if (userCountry.equals("Honduras [HN]")) out.println("selected"); %>>Honduras 
          [HN]</option>
          <option value="Hong Kong [HK]" <% if (userCountry.equals("Hong Kong [HK]")) out.println("selected"); %>>Hong 
          Kong [HK]</option>
          <option value="Hungary [HU]" <% if (userCountry.equals("Hungary [HU]")) out.println("selected"); %>>Hungary 
          [HU]</option>
          <option value="Iceland [IS]" <% if (userCountry.equals("Iceland [IS]")) out.println("selected"); %>>Iceland 
          [IS]</option>
          <option value="India [IN]" <% if (userCountry.equals("India [IN]")) out.println("selected"); %>>India 
          [IN]</option>
          <option value="Indonesia [ID]" <% if (userCountry.equals("Indonesia [ID]")) out.println("selected"); %>>Indonesia 
          [ID]</option>
          <option value="Iraq [IQ]" <% if (userCountry.equals("Iraq [IQ]")) out.println("selected"); %>>Iraq 
          [IQ]</option>
          <option value="Ireland [IE]" <% if (userCountry.equals("Ireland [IE]")) out.println("selected"); %>>Ireland 
          [IE]</option>
          <option value="Islamic Republic of Iran [IR]" <% if (userCountry.equals("Islamic Republic of Iran [IR]")) out.println("selected"); %>>Islamic 
          Republic of Iran [IR]</option>
          <option value="Israel [IL]" <% if (userCountry.equals("Israel [IL]")) out.println("selected"); %>>Israel 
          [IL]</option>
          <option value="Italy [IT]" <% if (userCountry.equals("Italy [IT]")) out.println("selected"); %>>Italy 
          [IT]</option>
          <option value="Jamaica [JM]" <% if (userCountry.equals("Jamaica [JM]")) out.println("selected"); %>>Jamaica 
          [JM]</option>
          <option value="Japan [JP]" <% if (userCountry.equals("Japan [JP]")) out.println("selected"); %>>Japan 
          [JP]</option>
          <option value="Jordan [JO]" <% if (userCountry.equals("Jordan [JO]")) out.println("selected"); %>>Jordan 
          [JO]</option>
          <option value="Kazakhstan [KZ]" <% if (userCountry.equals("Kazakhstan [KZ]")) out.println("selected"); %>>Kazakhstan 
          [KZ]</option>
          <option value="Kenya [KE]" <% if (userCountry.equals("Kenya [KE]")) out.println("selected"); %>>Kenya 
          [KE]</option>
          <option value="Kiribati [KI]" <% if (userCountry.equals("Kiribati [KI]")) out.println("selected"); %>>Kiribati 
          [KI]</option>
          <option value="Korea, Democratic People's Republic of [KP]" <% if (userCountry.equals("Korea, Democratic People's Republic of [KP]")) out.println("selected"); %>>Korea, 
          Democratic People's Republic of [KP]</option>
          <option value="Korea, Republic of [KR]" <% if (userCountry.equals("Korea, Republic of [KR]")) out.println("selected"); %>>Korea, 
          Republic of [KR]</option>
          <option value="Kuwait [KW]" <% if (userCountry.equals("Kuwait [KW]")) out.println("selected"); %>>Kuwait 
          [KW]</option>
          <option value="Kyrgyzstan [KG]" <% if (userCountry.equals("Kyrgyzstan [KG]")) out.println("selected"); %>>Kyrgyzstan 
          [KG]</option>
          <option value="Lao People's Democratic Republic [LA]" <% if (userCountry.equals("Lao People's Democratic Republic [LA]")) out.println("selected"); %>>Lao 
          People's Democratic Republic [LA]</option>
          <option value="Latvia [LV]" <% if (userCountry.equals("Latvia [LV]")) out.println("selected"); %>>Latvia 
          [LV]</option>
          <option value="Lebanon [LB]" <% if (userCountry.equals("Lebanon [LB]")) out.println("selected"); %>>Lebanon 
          [LB]</option>
          <option value="Lesotho [LS]" <% if (userCountry.equals("Lesotho [LS]")) out.println("selected"); %>>Lesotho 
          [LS]</option>
          <option value="Liberia [LR]" <% if (userCountry.equals("Liberia [LR]")) out.println("selected"); %>>Liberia 
          [LR]</option>
          <option value="Libyan Arab Jamahiriya [LY]" <% if (userCountry.equals("Libyan Arab Jamahiriya [LY]")) out.println("selected"); %>>Libyan 
          Arab Jamahiriya [LY]</option>
          <option value="Liechtenstein [LI]" <% if (userCountry.equals("Liechtenstein [LI]")) out.println("selected"); %>>Liechtenstein 
          [LI]</option>
          <option value="Lithuania [LT]" <% if (userCountry.equals("Lithuania [LT]")) out.println("selected"); %>>Lithuania 
          [LT]</option>
          <option value="Luxembourg [LU]" <% if (userCountry.equals("Luxembourg [LU]")) out.println("selected"); %>>Luxembourg 
          [LU]</option>
          <option value="Macau [MO]" <% if (userCountry.equals("Macau [MO]")) out.println("selected"); %>>Macau 
          [MO]</option>
          <option value="Madagascar [MG]" <% if (userCountry.equals("Madagascar [MG]")) out.println("selected"); %>>Madagascar 
          [MG]</option>
          <option value="Malawi [MW]" <% if (userCountry.equals("Malawi [MW]")) out.println("selected"); %>>Malawi 
          [MW]</option>
          <option value="Malaysia [MY]" <% if (userCountry.equals("Malaysia [MY]")) out.println("selected"); %>>Malaysia 
          [MY]</option>
          <option value="Maldives [MV]" <% if (userCountry.equals("Maldives [MV]")) out.println("selected"); %>>Maldives 
          [MV]</option>
          <option value="Mali [ML]" <% if (userCountry.equals("Mali [ML]")) out.println("selected"); %>>Mali 
          [ML]</option>
          <option value="Malta [MT]" <% if (userCountry.equals("Malta [MT]")) out.println("selected"); %>>Malta 
          [MT]</option>
          <option value="Marshall Islands [MH]" <% if (userCountry.equals("Marshall Islands [MH]")) out.println("selected"); %>>Marshall 
          Islands [MH]</option>
          <option value="Martinique [MQ]" <% if (userCountry.equals("Martinique [MQ]")) out.println("selected"); %>>Martinique 
          [MQ]</option>
          <option value="Mauritania [MR]" <% if (userCountry.equals("Mauritania [MR]")) out.println("selected"); %>>Mauritania 
          [MR]</option>
          <option value="Mauritius [MU]" <% if (userCountry.equals("Mauritius [MU]")) out.println("selected"); %>>Mauritius 
          [MU]</option>
          <option value="Mayotte [YT]" <% if (userCountry.equals("Mayotte [YT]")) out.println("selected"); %>>Mayotte 
          [YT]</option>
          <option value="Mexico [MX]" <% if (userCountry.equals("Mexico [MX]")) out.println("selected"); %>>Mexico 
          [MX]</option>
          <option value="Micronesia [FM]" <% if (userCountry.equals("Micronesia [FM]")) out.println("selected"); %>>Micronesia 
          [FM]</option>
          <option value="Moldova, Republic of [MD]" <% if (userCountry.equals("Moldova, Republic of [MD]")) out.println("selected"); %>>Moldova, 
          Republic of [MD]</option>
          <option value="Monaco [MC]" <% if (userCountry.equals("Monaco [MC]")) out.println("selected"); %>>Monaco 
          [MC]</option>
          <option value="Mongolia [MN]" <% if (userCountry.equals("Mongolia [MN]")) out.println("selected"); %>>Mongolia 
          [MN]</option>
          <option value="Monserrat [MS]" <% if (userCountry.equals("Monserrat [MS]")) out.println("selected"); %>>Monserrat 
          [MS]</option>
          <option value="Morocco [MA]" <% if (userCountry.equals("Morocco [MA]")) out.println("selected"); %>>Morocco 
          [MA]</option>
          <option value="Mozambique [MZ]" <% if (userCountry.equals("Mozambique [MZ]")) out.println("selected"); %>>Mozambique 
          [MZ]</option>
          <option value="Myanmar [MM]" <% if (userCountry.equals("Myanmar [MM]")) out.println("selected"); %>>Myanmar 
          [MM]</option>
          <option value="Nambia [NA]" <% if (userCountry.equals("Nambia [NA]")) out.println("selected"); %>>Nambia 
          [NA]</option>
          <option value="Nauru [NR]" <% if (userCountry.equals("Nauru [NR]")) out.println("selected"); %>>Nauru 
          [NR]</option>
          <option value="Nepal [NP]" <% if (userCountry.equals("Nepal [NP]")) out.println("selected"); %>>Nepal 
          [NP]</option>
          <option value="Netherlands Antilles [AN]" <% if (userCountry.equals("Netherlands Antilles [AN]")) out.println("selected"); %>>Netherlands 
          Antilles [AN]</option>
          <option value="Netherlands [NL]" <% if (userCountry.equals("Netherlands [NL]")) out.println("selected"); %>>Netherlands 
          [NL]</option>
          <option value="New Caledonia [NC]" <% if (userCountry.equals("New Caledonia [NC]")) out.println("selected"); %>>New 
          Caledonia [NC]</option>
          <option value="New Zealand [NZ]" <% if (userCountry.equals("New Zealand [NZ]")) out.println("selected"); %>>New 
          Zealand [NZ]</option>
          <option value="Nicaragua [NI]" <% if (userCountry.equals("Nicaragua [NI]")) out.println("selected"); %>>Nicaragua 
          [NI]</option>
          <option value="Niger [NE]" <% if (userCountry.equals("Niger [NE]")) out.println("selected"); %>>Niger 
          [NE]</option>
          <option value="Nigeria [NG]" <% if (userCountry.equals("Nigeria [NG]")) out.println("selected"); %>>Nigeria 
          [NG]</option>
          <option value="Niue [NU]" <% if (userCountry.equals("Niue [NU]")) out.println("selected"); %>>Niue 
          [NU]</option>
          <option value="Norfolk Island [NF]" <% if (userCountry.equals("Norfolk Island [NF]")) out.println("selected"); %>>Norfolk 
          Island [NF]</option>
          <option value="Northern Mariana Islands [MP]" <% if (userCountry.equals("Northern Mariana Islands [MP]")) out.println("selected"); %>>Northern 
          Mariana Islands [MP]</option>
          <option value="Norway [NO]" <% if (userCountry.equals("Norway [NO]")) out.println("selected"); %>>Norway 
          [NO]</option>
          <option value="Oman [OM]" <% if (userCountry.equals("Oman [OM]")) out.println("selected"); %>>Oman 
          [OM]</option>
          <option value="Pakistan [PK]" <% if (userCountry.equals("Pakistan [PK]")) out.println("selected"); %>>Pakistan 
          [PK]</option>
          <option value="Palau [PW]" <% if (userCountry.equals("Palau [PW]")) out.println("selected"); %>>Palau 
          [PW]</option>
          <option value="Panama [PA]" <% if (userCountry.equals("Panama [PA]")) out.println("selected"); %>>Panama 
          [PA]</option>
          <option value="Papua New Guinea [PG]" <% if (userCountry.equals("Papua New Guinea [PG]")) out.println("selected"); %>>Papua 
          New Guinea [PG]</option>
          <option value="Paraguay [PY]" <% if (userCountry.equals("Paraguay [PY]")) out.println("selected"); %>>Paraguay 
          [PY]</option>
          <option value="Peru [PE]" <% if (userCountry.equals("Peru [PE]")) out.println("selected"); %>>Peru 
          [PE]</option>
          <option value="Philippines [PH]" <% if (userCountry.equals("Philippines [PH]")) out.println("selected"); %>>Philippines 
          [PH]</option>
          <option value="Pitcairn [PN]" <% if (userCountry.equals("Pitcairn [PN]")) out.println("selected"); %>>Pitcairn 
          [PN]</option>
          <option value="Poland [PL]" <% if (userCountry.equals("Poland [PL]")) out.println("selected"); %>>Poland 
          [PL]</option>
          <option value="Portugal [PT]" <% if (userCountry.equals("Portugal [PT]")) out.println("selected"); %>>Portugal 
          [PT]</option>
          <option value="Puerto Rico [PR]" <% if (userCountry.equals("Puerto Rico [PR]")) out.println("selected"); %>>Puerto 
          Rico [PR]</option>
          <option value="Qatar [QA]" <% if (userCountry.equals("Qatar [QA]")) out.println("selected"); %>>Qatar 
          [QA]</option>
          <option value="R&eacute;union [RE]" <% if (userCountry.equals("R&eacute;union [RE]")) out.println("selected"); %>>R&eacute;union 
          [RE]</option>
          <option value="Romania [RO]" <% if (userCountry.equals("Romania [RO]")) out.println("selected"); %>>Romania 
          [RO]</option>
          <option value="Russian Federation [RU]" <% if (userCountry.equals("Russian Federation [RU]")) out.println("selected"); %>>Russian 
          Federation [RU]</option>
          <option value="Rwanda [RW]" <% if (userCountry.equals("Rwanda [RW]")) out.println("selected"); %>>Rwanda 
          [RW]</option>
          <option value="Saint Lucia [LC]" <% if (userCountry.equals("Saint Lucia [LC]")) out.println("selected"); %>>Saint 
          Lucia [LC]</option>
          <option value="Samoa [WS]" <% if (userCountry.equals("Samoa [WS]")) out.println("selected"); %>>Samoa 
          [WS]</option>
          <option value="San Marino [SM]" <% if (userCountry.equals("San Marino [SM]")) out.println("selected"); %>>San 
          Marino [SM]</option>
          <option value="Sao Tome and Principe [ST]" <% if (userCountry.equals("Sao Tome and Principe [ST]")) out.println("selected"); %>>Sao 
          Tome and Principe [ST]</option>
          <option value="Saudi Arabia [SA]" <% if (userCountry.equals("Saudi Arabia [SA]")) out.println("selected"); %>>Saudi 
          Arabia [SA]</option>
          <option value="Senegal [SN]" <% if (userCountry.equals("Senegal [SN]")) out.println("selected"); %>>Senegal 
          [SN]</option>
          <option value="Seychelles [SC]" <% if (userCountry.equals("Seychelles [SC]")) out.println("selected"); %>>Seychelles 
          [SC]</option>
          <option value="Sierra Leone [SL]" <% if (userCountry.equals("Sierra Leone [SL]")) out.println("selected"); %>>Sierra 
          Leone [SL]</option>
          <option value="Singapore [SG]" <% if (userCountry.equals("Singapore [SG]")) out.println("selected"); %>>Singapore 
          [SG]</option>
          <option value="Slovakia [SK]" <% if (userCountry.equals("Slovakia [SK]")) out.println("selected"); %>>Slovakia 
          [SK]</option>
          <option value="Slovenia [SI]" <% if (userCountry.equals("Slovenia [SI]")) out.println("selected"); %>>Slovenia 
          [SI]</option>
          <option value="Solomon Islands [SB]" <% if (userCountry.equals("Solomon Islands [SB]")) out.println("selected"); %>>Solomon 
          Islands [SB]</option>
          <option value="Somalia [SO]" <% if (userCountry.equals("Somalia [SO]")) out.println("selected"); %>>Somalia 
          [SO]</option>
          <option value="South Africa [ZA]" <% if (userCountry.equals("South Africa [ZA]")) out.println("selected"); %>>South 
          Africa [ZA]</option>
          <option value="South Georgia and the South Sandwich Islands [GS]" <% if (userCountry.equals("South Georgia and the South Sandwich Islands [GS]")) out.println("selected"); %>>South 
          Georgia and the South Sandwich Islands [GS]</option>
          <option value="Spain [ES]" <% if (userCountry.equals("Spain [ES]")) out.println("selected"); %>>Spain 
          [ES]</option>
          <option value="Sri Lanka [LK]" <% if (userCountry.equals("Sri Lanka [LK]")) out.println("selected"); %>>Sri 
          Lanka [LK]</option>
          <option value="St. Helena [SH]" <% if (userCountry.equals("St. Helena [SH]")) out.println("selected"); %>>St. 
          Helena [SH]</option>
          <option value="St. Kitts and Nevis [KN]" <% if (userCountry.equals("St. Kitts and Nevis [KN]")) out.println("selected"); %>>St. 
          Kitts and Nevis [KN]</option>
          <option value="St. Pierre and Miquelon [PM]" <% if (userCountry.equals("St. Pierre and Miquelon [PM]")) out.println("selected"); %>>St. 
          Pierre and Miquelon [PM]</option>
          <option value="St. Vincent and the Grenadines [VC]" <% if (userCountry.equals("St. Vincent and the Grenadines [VC]")) out.println("selected"); %>>St. 
          Vincent and the Grenadines [VC]</option>
          <option value="Sudan [SD]" <% if (userCountry.equals("Sudan [SD]")) out.println("selected"); %>>Sudan 
          [SD]</option>
          <option value="Suriname [SR]" <% if (userCountry.equals("Suriname [SR]")) out.println("selected"); %>>Suriname 
          [SR]</option>
          <option value="Svalbard and Jan Mayen Islands [SJ]" <% if (userCountry.equals("Svalbard and Jan Mayen Islands [SJ]")) out.println("selected"); %>>Svalbard 
          and Jan Mayen Islands [SJ]</option>
          <option value="Swaziland [SZ]" <% if (userCountry.equals("Swaziland [SZ]")) out.println("selected"); %>>Swaziland 
          [SZ]</option>
          <option value="Sweden [SE]" <% if (userCountry.equals("Sweden [SE]")) out.println("selected"); %>>Sweden 
          [SE]</option>
          <option value="Switzerland [CH]" <% if (userCountry.equals("Switzerland [CH]")) out.println("selected"); %>>Switzerland 
          [CH]</option>
          <option value="Syrian Arab Republic [SY]" <% if (userCountry.equals("Syrian Arab Republic [SY]")) out.println("selected"); %>>Syrian 
          Arab Republic [SY]</option>
          <option value="Taiwan, Province of China [TW]" <% if (userCountry.equals("Taiwan, Province of China [TW]")) out.println("selected"); %>>Taiwan, 
          Province of China [TW]</option>
          <option value="Tajikistan [TJ]" <% if (userCountry.equals("Tajikistan [TJ]")) out.println("selected"); %>>Tajikistan 
          [TJ]</option>
          <option value="Tanzania, United Republic of [TZ]" <% if (userCountry.equals("Tanzania, United Republic of [TZ]")) out.println("selected"); %>>Tanzania, 
          United Republic of [TZ]</option>
          <option value="Thailand [TH]" <% if (userCountry.equals("Thailand [TH]")) out.println("selected"); %>>Thailand 
          [TH]</option>
          <option value="Togo [TG]" <% if (userCountry.equals("Togo [TG]")) out.println("selected"); %>>Togo 
          [TG]</option>
          <option value="Tokelau [TK]" <% if (userCountry.equals("Tokelau [TK]")) out.println("selected"); %>>Tokelau 
          [TK]</option>
          <option value="Tonga [TO]" <% if (userCountry.equals("Tonga [TO]")) out.println("selected"); %>>Tonga 
          [TO]</option>
          <option value="Trinidad and Tobago [TT]" <% if (userCountry.equals("Trinidad and Tobago [TT]")) out.println("selected"); %>>Trinidad 
          and Tobago [TT]</option>
          <option value="Tunisia [TN]" <% if (userCountry.equals("Tunisia [TN]")) out.println("selected"); %>>Tunisia 
          [TN]</option>
          <option value="Turkey [TR]" <% if (userCountry.equals("Turkey [TR]")) out.println("selected"); %>>Turkey 
          [TR]</option>
          <option value="Turkmenistan [TM]" <% if (userCountry.equals("Turkmenistan [TM]")) out.println("selected"); %>>Turkmenistan 
          [TM]</option>
          <option value="Turks and Caicos Islands [TC]" <% if (userCountry.equals("Turks and Caicos Islands [TC]")) out.println("selected"); %>>Turks 
          and Caicos Islands [TC]</option>
          <option value="Tuvalu [TV]" <% if (userCountry.equals("Tuvalu [TV]")) out.println("selected"); %>>Tuvalu 
          [TV]</option>
          <option value="Uganda [UG]" <% if (userCountry.equals("Uganda [UG]")) out.println("selected"); %>>Uganda 
          [UG]</option>
          <option value="Ukraine [UA]" <% if (userCountry.equals("Ukraine [UA]")) out.println("selected"); %>>Ukraine 
          [UA]</option>
          <option value="United Arab Emirates [AE]" <% if (userCountry.equals("United Arab Emirates [AE]")) out.println("selected"); %>>United 
          Arab Emirates [AE]</option>
          <option value="United Kingdom (Great Britain) [GB]" <% if (userCountry.equals("United Kingdom (Great Britain) [GB]")) out.println("selected"); %>>United 
          Kingdom (Great Britain) [GB]</option>
          <option value="United States Minor Outlying Islands [UM]" <% if (userCountry.equals("United States Minor Outlying Islands [UM]")) out.println("selected"); %>>United 
          States Minor Outlying Islands [UM]</option>
          <option value="United States of America [US]" <% if (userCountry.equals("United States of America [US]")) out.println("selected"); %>>United 
          States of America [US]</option>
          <option value="United States Virgin Islands [VI]" <% if (userCountry.equals("United States Virgin Islands [VI]")) out.println("selected"); %>>United 
          States Virgin Islands [VI]</option>
          <option value="Unknown or unspecified country [ZZ]" <% if (userCountry.equals("Unknown or unspecified country [ZZ]")) out.println("selected"); %>>Unknown 
          or unspecified country [ZZ]</option>
          <option value="Uruguay [UY]" <% if (userCountry.equals("Uruguay [UY]")) out.println("selected"); %>>Uruguay 
          [UY]</option>
          <option value="Uzbekistan [UZ]" <% if (userCountry.equals("Uzbekistan [UZ]")) out.println("selected"); %>>Uzbekistan 
          [UZ]</option>
          <option value="Vanuatu [VU]" <% if (userCountry.equals("Vanuatu [VU]")) out.println("selected"); %>>Vanuatu 
          [VU]</option>
          <option value="Vatican City State [VA]" <% if (userCountry.equals("Vatican City State [VA]")) out.println("selected"); %>>Vatican 
          City State [VA]</option>
          <option value="Venezuela [VE]" <% if (userCountry.equals("Venezuela [VE]")) out.println("selected"); %>>Venezuela 
          [VE]</option>
          <option value="Viet Nam [VN]" <% if (userCountry.equals("Viet Nam [VN]")) out.println("selected"); %>>Viet 
          Nam [VN]</option>
          <option value="Wallis and Futuna Islands [WF]" <% if (userCountry.equals("Wallis and Futuna Islands [WF]")) out.println("selected"); %>>Wallis 
          and Futuna Islands [WF]</option>
          <option value="Western Sahara [EH]" <% if (userCountry.equals("Western Sahara [EH]")) out.println("selected"); %>>Western 
          Sahara [EH]</option>
          <option value="Yemen [YE]" <% if (userCountry.equals("Yemen [YE]")) out.println("selected"); %>>Yemen 
          [YE]</option>
          <option value="Yugoslavia [YU]" <% if (userCountry.equals("Yugoslavia [YU]")) out.println("selected"); %>>Yugoslavia 
          [YU]</option>
          <option value="Zaire [ZR]" <% if (userCountry.equals("Zaire [ZR]")) out.println("selected"); %>>Zaire 
          [ZR]</option>
          <option value="Zambia [ZM]" <% if (userCountry.equals("Zambia [ZM]")) out.println("selected"); %>>Zambia 
          [ZM]</option>
          <option value="Zimbabwe [ZW]" <% if (userCountry.equals("Zimbabwe [ZW]")) out.println("selected"); %>>Zimbabwe 
          [ZW]</option>
        </select>
      </td>
    </tr>
    <tr> 
      <td width="31%">Post Code*</td>
      <td width="69%"> 
        <input type="text" name="userPostCode"
			value="<jsp:getProperty name="user" property="userPostCode" />" maxlength="7" size="9">
        <font class="sbd"> </font> </td>
    </tr>
    <tr> 
      <td width="31%">Occupation*</td>
      <td width="69%"> 
        <%! String userOccupation; %>
        <% userOccupation = user.getUserOccupation();%>
        <select name="userOccupation">
          <option value="">&nbsp</option>
          <option value="Accounting" <% if (userOccupation.equals("Accounting")) out.println("selected"); %>>Accounting</option>
          <option value="CEO" <% if (userOccupation.equals("CEO")) out.println("selected"); %>>CEO</option>
          <option value="Consulting" <% if (userOccupation.equals("Consulting")) out.println("selected"); %>>Consulting</option>
          <option value="Craftsman" <% if (userOccupation.equals("Craftsman")) out.println("selected"); %>>Craftsman</option>
          <option value="Customer Service" <% if (userOccupation.equals("Customer Service")) out.println("selected"); %>>Customer 
          Service</option>
          <option value="Education" <% if (userOccupation.equals("Eduction")) out.println("selected"); %>>Education 
          </option>
          <option value="Engineering" <% if (userOccupation.equals("Engineering")) out.println("selected"); %>>Engineering 
          </option>
          <option value="Executive" <% if (userOccupation.equals("Executive")) out.println("selected"); %>>Executive</option>
          <option value="Government" <% if (userOccupation.equals("Government")) out.println("selected"); %>>Government</option>
          <option value="Homemaker" <% if (userOccupation.equals("Homemaker")) out.println("selected"); %>>Homemaker</option>
          <option value="IT" <% if (userOccupation.equals("IT")) out.println("selected"); %>>IT</option>
          <option value="Lecturer" <% if (userOccupation.equals("Lecturer")) out.println("selected"); %>>Lecturer</option>
          <option value="Manufacturing" <% if (userOccupation.equals("Manufacturing")) out.println("selected"); %>>Manufacturing</option>
          <option value="Professional" <% if (userOccupation.equals("Professional")) out.println("selected"); %>>Professional</option>
          <option value="Research" <% if (userOccupation.equals("Research")) out.println("selected"); %>>Research</option>
          <option value="Retired" <% if (userOccupation.equals("Retired")) out.println("selected"); %>>Retired</option>
          <option value="Sales" <% if (userOccupation.equals("Sales")) out.println("selected"); %>>Sales</option>
          <option value="Self-employed" <% if (userOccupation.equals("Self-employed")) out.println("selected"); %>>Self-employed</option>
          <option value="Student" <% if (userOccupation.equals("Student")) out.println("selected"); %>>Student</option>
          <option value="Senior Management" <% if (userOccupation.equals("Senior Management")) out.println("selected"); %>>Senior 
          Management</option>
          <option value="Other" <% if (userOccupation.equals("Other")) out.println("selected"); %>>Other 
          </option>
        </select>
      </td>
    </tr>
    <tr> 
      <td width="31%">Contact Telephone/Mobile</td>
      <td width="69%"> 
        <input type="text" name="userContactNumber"
			value="<jsp:getProperty name="user" property="userContactNumber" />" maxlength="15" size="17">
      </td>
    </tr>
    <tr> 
      <td width="31%">Item Reservation Quota</td>
      <td width="69%"> 
        <%
		if( (loginUserType.equals("admin")) || debug){
			if ( form.getFormType().equals("add")) {
	        	out.println("<input type='text' name='userTotReservation' maxlength='2' size='4' value='3'>");
			}else{
				out.println("<input type='hidden' name='userTotReservation' value='" +user.getUserTotReservation() +"'>");
				out.println(user.getUserTotReservation()); 
			}
		}else if( (loginUserType.equals("librarian")) && (form.getFormType().equals("add")) ){
	        out.println("<input type='hidden' name='userTotReservation' value='3'>");
			out.println("3");
		}else {
			out.println("<input type='hidden' name='userTotReservation' value='" +user.getUserTotReservation() +"'>");
			out.println(user.getUserTotReservation()); 
		}
%>
      </td>
    </tr>
    <tr> 
      <td width="31%">Item Reserve Quota Available</td>
      <td width="69%"> 
        <%
		if( (loginUserType.equals("admin")) || debug){
			if ( form.getFormType().equals("add")) {
	    	    out.println("<input type='hidden' name='userReserveAvailable' value='" +user.getUserTotReservation() +"'>");
				out.println("<i>It will be same as Item Reservation Quota</i>");
			}else {
				out.println("<input type='hidden' name='userReserveAvailable' value='" +user.getUserReserveAvailable() +"'>");
				out.println(user.getUserReserveAvailable()); 
			}
		}else if( (loginUserType.equals("librarian")) && (form.getFormType().equals("add")) ){
	        out.println("<input type='hidden' name='userReserveAvailable' value='3'>");
			out.println("3");
		}else {
			out.println("<input type='hidden' name='userReserveAvailable' value='" +user.getUserReserveAvailable() +"'>");
			out.println(user.getUserReserveAvailable()); 
		}
%>
      </td>
    </tr>
    <tr> 
      <td width="31%">Item Borrow Quota</td>
      <td width="69%"> 
        <%
		if( (loginUserType.equals("admin")) || debug){
			if ( form.getFormType().equals("add")) {
	        	out.println("<input type='text' name='userTotQuota' maxlength='2' size='4' value='" +user.getUserTotQuota() +"'>");
			}else{
				out.println("<input type='hidden' name='userTotQuota' value='" +user.getUserTotQuota() +"'>");
				out.println(user.getUserTotQuota()); 
			}
//	        out.println("<input type='text' name='userTotQuota' maxlength='2' size='4' value='" +user.getUserTotQuota() +"'>");
		}else if( (loginUserType.equals("librarian")) && (form.getFormType().equals("add")) ){
	        out.println("<input type='hidden' name='userTotQuota' value='10'>");
			out.println("10");
		}else {
			out.println("<input type='hidden' name='userTotQuota' value='" +user.getUserTotQuota() +"'>");
			out.println(user.getUserTotQuota()); 
		}
%>
      </td>
    </tr>
    <tr> 
      <td width="31%">Item Quota Available</td>
      <td width="69%"> 
        <%
		if( (loginUserType.equals("admin")) || debug){
			if ( form.getFormType().equals("add")) {
	    	    out.println("<input type='hidden' name='userQuotaAvailable' value='" +user.getUserTotQuota() +"'>");
				out.println("<i>It will be same as Item Borrow Quota</i>");
			}else {
				out.println("<input type='hidden' name='userQuotaAvailable' value='" +user.getUserQuotaAvailable() +"'>");
				out.println(user.getUserQuotaAvailable()); 
			}
/*			if ( form.getFormType().equals("add")) {

	    	    out.println("<input type='hidden' name='userQuotaAvailable' value='" +user.getUserTotQuota() +"'>");
				out.println("<i>It will be same as Item Borrow Quota</i>");
			} else {
	    	    out.println("<input type='text' name='userQuotaAvailable' maxlength='2' size='4' value='" +user.getUserQuotaAvailable() +"'>");
			}				
*/		}else if( (loginUserType.equals("librarian")) && (form.getFormType().equals("add")) ){
	        out.println("<input type='hidden' name='userQuotaAvailable' value='10'>");
			out.println("10");
		}else {
			out.println("<input type='hidden' name='userQuotaAvailable' value='" +user.getUserQuotaAvailable() +"'>");
			out.println(user.getUserQuotaAvailable()); 
		}
%>
      </td>
    </tr>
  </table>
  <p> 
    <%	
	String submitStm=("<input type='submit' name='Submit' value='Submit' onClick='return validateComplete(document.user_form)'>");
	String resetStm=("&nbsp; <input type='reset' name='Reset' value='Reset'>");

	// the condition that user can edit the a/c
	if( (loginUserType.equals("admin")) || debug ){
		out.println(submitStm +resetStm); 
	} else if(form.getFormType().equals("add")) {
		out.println(submitStm + resetStm);
	} else if(form.getFormURL().equals("/JavaLibrary/user/myaccount.jsp")) {
		out.println(submitStm + resetStm);
	} else if( (loginUserType.equals("librarian")) && (user.getUserType().equals("borrower"))) {
		out.println(submitStm + resetStm);
	} else if (loginUserID.equals(user.getUserID())) {
		out.println(submitStm + resetStm);
	}
%>
  </p>
</form>
