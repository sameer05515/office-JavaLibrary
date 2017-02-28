package sjservlets;

/** A Java Bean to keep login user Info
 *  Only simple info are keep where it use in conjunction 
 *  with another Java Bean (user).
 *  The main purpose is keep the info for admin/librarian 
 *  when they edit other user info.  The admin/librarian
 *  info will then switch back to user bean after operation.
 *  <P>
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */
 
public class Login {

    private boolean userLogin =  false;    
    private String userID = "";    
    private String userType = "";    

	public Login(boolean userLogin, String userID, String userType){
		setUserLogin(userLogin);
		setUserID(userID);
		setUserType(userType);
	}
	
	public Login(){
	}
	
	public void resetVariable() {
		setUserLogin(false);
		setUserID("");
		setUserType("");
	}
	
    public void setUserLogin(boolean userLogin) {
        this.userLogin = userLogin;
    }
    
    public boolean isUserLogin() {
        return userLogin;
    }
    
    public void setUserID(String userID) {
        this.userID = userID;
    }
    
    public String getUserID() {
        return userID;
    }
    
    public void setUserType(String userType) {
        this.userType = userType;
    }
    
    public String getUserType () {
        return userType;
    }     
    
}
