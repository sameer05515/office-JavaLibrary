var ToolBar_Supported = ToolBar_Supported ;
if (ToolBar_Supported != null && ToolBar_Supported == true)
{
	//To Turn on/off Frame support, set Frame_Supported = true/false.
	Frame_Supported = false;

	// Customize default ICP menu color - bgColor, fontColor, mouseoverColor
	setDefaultICPMenuColor("#0099FF", "white", "red");
	
	// Customize toolbar background color
	//setToolbarBGColor("white");
	setBannerColor("#0099FF", "#0099FF", "White", "red");

	// display ICP Banner
	setICPBanner("../images/common/library-logo.gif","../mainmenu/mainmenu.jsp","Home") ;
	
	//Back to Home
	addICPMenu("Home Menu", "Home", "Home", "../mainmenu/mainmenu.jsp");

	//System Admin
	addICPMenu("AdminMenu", "Admin", "Admin", "");
	addICPSubMenu("AdminMenu", "User List", "../admin/user_list.jsp");

	//Search
	addICPMenu("SearchMenu", "Search", "Search","../search/search_libraryitem.jsp");
	
	//Operation
	addICPMenu("OperationMenu", "Operation", "Operation", "");
	addICPSubMenu("OperationMenu", "Borrow", "../operation/borrow.jsp");
	addICPSubMenu("OperationMenu", "Return", "../operation/return.jsp");
	
	//My Account
	addICPMenu("MyACMenu", "My Account","My Account", "");
	addICPSubMenu("MyACMenu", "Check My Account","../user/myaccount.jsp");
	addICPSubMenuLine("MyACMenu");	
	addICPSubMenu("MyACMenu", "My Borrow List","../user/my_borrow_list.jsp");
	addICPSubMenuLine("MyACMenu");
	addICPSubMenu("MyACMenu", "Add Reservatioin","../user/reservation_add.jsp");	
	addICPSubMenu("MyACMenu", "My Reservatioin List","../user/my_reservation_list.jsp");



}
