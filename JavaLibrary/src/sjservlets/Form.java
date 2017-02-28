package sjservlets;

/** A Java Bean to keep the HTML form information 
 *  , the form Name, the type (Add, Edit, View, Return Borrow)
 *  and the URL it came from.
 *  for later operations in FormProcess servlet. 
 *  <P>
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */

public class Form{
  	private String formName="";
  	private String formType = "";
  	private String formURL = "";
  	
  	public Form(String formName, String formType, String formURL){
		setFormName(formName);
		setFormType(formType);
		setFormURL(formURL);
	}

  	public Form(){
  	}

	public void resetVariable() {
		setFormName("");
		setFormType("");
		setFormURL("");
  	}

	public void setFormName(String formName) {
		this.formName = formName;
	}
	public void setFormType(String formType){
		this.formType = formType;
	}
	public void setFormURL(String formURL){
		this.formURL = formURL;
	}
  	
    public String getFormName() {
        return formName;
    }	
  	public String getFormType(){
  		return formType;
  	}
	public String getFormURL(){
		return formURL;
	}
}
  
