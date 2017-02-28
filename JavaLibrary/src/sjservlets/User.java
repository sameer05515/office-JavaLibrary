package sjservlets;

/** A Java Bean to keep the user information
 *  <P>
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class User {
	private int	userRecNumber = 0;
  	private String userID = "";
  	private String userPassword = "";
  	private String userType = "";
  	private String userFirstName = "";
  	private String userLastName = "";
  	private String userGender = "";
  	private String userEmail = "";
  	private String userICNumber = "";
  	private String userAddress1 = "";
  	private String userAddress2 = "";
  	private String userCity = "";
  	private String userState = "";
  	private String userPostCode = "";
  	private String userCountry = "";
  	private String userOccupation = "";
  	private String userContactNumber = "";
  	private int userTotQuota = 0;
  	private int userQuotaAvailable = 0;
  	private int userTotReservation = 0;
  	private int userReserveAvailable = 0;

  	public User(){
	}
  	
  	public User(int userRecNumber, String userID, String userPassword, String userType,
  				String userFirstName, String userLastName, String userGender, String userEmail,
  				String userICNumber, String userAddress1, String userAddress2, String userCity,
  				String userState, String userPostCode, String userCountry, String userOccupation,
  				String userContactNumber, int userTotQuota, int userQuotaAvailable, 
  				int userTotReservation, int userReserveAvailable){
		setUserRecNumber(userRecNumber);
		setUserID(userID);
		setUserPassword(userPassword);
		setUserType(userType);
		setUserFirstName(userFirstName);
		setUserLastName(userLastName);
		setUserGender(userGender);
		setUserEmail(userEmail);
		setUserICNumber(userICNumber);
		setUserAddress1(userAddress1);
		setUserAddress2(userAddress2);
		setUserCity(userCity);
		setUserState(userState);
		setUserPostCode(userPostCode);
		setUserCountry(userCountry);
		setUserOccupation(userOccupation);
		setUserContactNumber(userContactNumber);
		setUserTotQuota(userTotQuota);
		setUserQuotaAvailable(userQuotaAvailable);
		setUserTotReservation(userTotReservation);
		setUserReserveAvailable(userReserveAvailable);
	}
  	
  	public void setPropertyFromRequestParameter(HttpServletRequest request){
		//setUserRecNumber(userRecNumber);		
		setUserID(request.getParameter("userID"));		
		setUserPassword(request.getParameter("userPassword"));
		setUserType(request.getParameter("userType"));
		setUserFirstName(request.getParameter("userFirstName"));
		setUserLastName(request.getParameter("userLastName"));
		setUserGender(request.getParameter("userGender"));
		setUserEmail(request.getParameter("userEmail"));
		setUserICNumber(request.getParameter("userICNumber"));
		setUserAddress1(request.getParameter("userAddress1"));
		setUserAddress2(request.getParameter("userAddress2"));
		setUserCity(request.getParameter("userCity"));
		setUserState(request.getParameter("userState"));
		setUserPostCode(request.getParameter("userPostCode"));
		setUserCountry(request.getParameter("userCountry"));
		setUserOccupation(request.getParameter("userOccupation"));
		setUserContactNumber(request.getParameter("userContactNumber"));
		setUserTotQuota(Integer.parseInt(request.getParameter("userTotQuota")));
		setUserQuotaAvailable(Integer.parseInt(request.getParameter("userQuotaAvailable")));	
		setUserTotReservation(Integer.parseInt(request.getParameter("userTotReservation")));	
		setUserReserveAvailable(Integer.parseInt(request.getParameter("userReserveAvailable")));		
	}		

	public void setPropertyFromOtherUserBean(User user){
		setUserRecNumber(user.getUserRecNumber());
		setUserID(user.getUserID());		
		setUserPassword(user.getUserPassword());
		setUserType(user.getUserType());
		setUserFirstName(user.getUserFirstName());
		setUserLastName(user.getUserLastName());
		setUserGender(user.getUserGender());
		setUserEmail(user.getUserEmail());
		setUserICNumber(user.getUserICNumber());
		setUserAddress1(user.getUserAddress1());
		setUserAddress2(user.getUserAddress2());
		setUserCity(user.getUserCity());
		setUserState(user.getUserState());
		setUserPostCode(user.getUserPostCode());
		setUserCountry(user.getUserCountry());
		setUserOccupation(user.getUserOccupation());
		setUserContactNumber(user.getUserContactNumber());
		setUserTotQuota(user.getUserTotQuota());
		setUserQuotaAvailable(user.getUserQuotaAvailable());
		setUserTotReservation(user.getUserTotReservation());
		setUserReserveAvailable(user.getUserReserveAvailable());
	}

	public void resetVariable() {
		setUserRecNumber(0);
		setUserID("");
		setUserPassword("");
		setUserType("");
		setUserFirstName("");
		setUserLastName("");
		setUserGender("");
		setUserEmail("");
		setUserICNumber("");
		setUserAddress1("");
		setUserAddress2("");
		setUserCity("");
		setUserState("");
		setUserPostCode("");
		setUserCountry("");
		setUserOccupation("");
		setUserContactNumber("");
		setUserTotQuota(0);
		setUserQuotaAvailable(0);
		setUserTotReservation(0);
		setUserReserveAvailable(0);
  	}

	public void setUserRecNumber(int userRecNumber) {
		this.userRecNumber = userRecNumber;
	}	
	public void setUserID(String userID) {
		//userFirstName = ServletUtilities.replaceIfMissing(userFirstName, "Unknow First Name");
		this.userID = userID;
	}
	public void setUserPassword(String userPassword){
		this.userPassword = userPassword;
	}
	public void setUserType(String userType){
		this.userType = userType;
	}
  	public void setUserFirstName(String userFirstName){
  		this.userFirstName = userFirstName;
  	}
  	public void setUserLastName(String userLastName){
  		this.userLastName = userLastName;
  	}
  	public void setUserGender(String userGender){
  		this.userGender = userGender;
  	}
  	public void setUserEmail(String userEmail){
  		this.userEmail = userEmail;
  	}
  	public void setUserICNumber(String userICNumber){
  		this.userICNumber = userICNumber;
  	}
  	public void setUserAddress1(String userAddress1){ 
  		this.userAddress1 = userAddress1;
  	}
  	public void setUserAddress2(String userAddress2){
  		this.userAddress2 = userAddress2;
  	}
  	public void setUserCity(String userCity){
  		this.userCity = userCity;
  	}
  	public void setUserState(String userState){
  		this.userState = userState;
  	}
  	public void setUserPostCode(String userPostCode){
  		this.userPostCode = userPostCode;
  	}
  	public void setUserCountry(String userCountry){
  		this.userCountry  = userCountry;
  	}
  	public void setUserOccupation(String userOccupation){
  		this.userOccupation = userOccupation;
  	}
  	public void setUserContactNumber(String userContactNumber){
  		this.userContactNumber = userContactNumber;
  	}
  	public void setUserTotQuota(int userTotQuota){
  		this.userTotQuota = userTotQuota;
  	}
  	public void setUserQuotaAvailable(int userQuotaAvailable){
  		this.userQuotaAvailable = userQuotaAvailable;
  	}
  	public void setUserTotReservation(int userTotReservation){
  		this.userTotReservation = userTotReservation;
  	}
  	public void setUserReserveAvailable(int userReserveAvailable){
  		this.userReserveAvailable = userReserveAvailable;
  	}
  	
  	public int getUserRecNumber() {
  		return userRecNumber;
  	}
    public String getUserID() {
        return userID;
    }	
  	public String getUserPassword(){
  		return userPassword;
  	}
  	public String getUserType(){
  		return userType;
  	}
  	public String getUserFirstName(){
  		return userFirstName;
  	}
  	public String getUserLastName(){
  		return userLastName;
  	}
  	public String getUserGender(){
  		return userGender;
  	}
  	public String getUserEmail(){
  		return userEmail;
  	}
  	public String getUserICNumber(){
  		return userICNumber;
  	}
  	public String getUserAddress1(){
  		return userAddress1;
  	}
  	public String getUserAddress2(){
  		return userAddress2;
  	}
  	public String getUserCity(){
  		return userCity;
  	}  	
  	public String getUserState(){
  		return userState;
  	}
  	public String getUserPostCode(){
  		return userPostCode;
  	}
  	public String getUserCountry(){
  		return userCountry;
  	}
  	public String getUserOccupation(){
  		return userOccupation;
  	}
  	public String getUserContactNumber(){
  		return userContactNumber;
  	}
  	public int getUserTotQuota(){
  		return userTotQuota;
  	}
  	public int getUserQuotaAvailable(){
  		return userQuotaAvailable;
  	}
  	public int getUserTotReservation(){
  		return userTotReservation;
  	}
  	public int getUserReserveAvailable() {
  		return userReserveAvailable;
  	}
}
  
