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

	//Search
	addICPMenu("SearchMenu", "Search", "Search","../search/search_libraryitem.jsp");

}
