package sjservlets;

/** A Java Bean use to keep track the database process.
 *
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */
 
public class DBProcess {
  
    private String dBName = "";    
    private String tblName = ""; 
    private String SQLQuery = "";
    private String processResult = "";
    private String processMsg = "";
    private String processAction = "";  
    private boolean processComplete = false;

	public DBProcess(String dBName, String tblName, String SQLQuery, String processResult, 
					 String processMsg, String processAct, boolean processComplete){
    	setDBName(dBName);    
    	setTblName(tblName); 
    	setSQLQuery(SQLQuery);
    	setProcessResult(processResult);
    	setProcessMsg(processMsg);
    	setProcessAction(processAction);  
    	setProcessComplete(processComplete);
	}
	
	public DBProcess(){
	}
	
	public void resetVariable() {
    	setDBName("");    
    	setTblName(""); 
    	setSQLQuery("");
    	setProcessResult("");
    	setProcessMsg("");
    	setProcessAction("");
    	setProcessComplete(false);
	}
	
	public void setDBName(String dBName){
		this.dBName=dBName;
	}
	public void setTblName(String tblName){
		this.tblName=tblName;
	} 
	public void setSQLQuery(String SQLQuery){
		this.SQLQuery=SQLQuery;
	}
	public void	setProcessResult(String processResult){
		this.processResult=processResult;
	}
	public void setProcessMsg(String processMsg){
		this.processMsg=processMsg;
	}
	public void	setProcessAction(String processAction){
		this.processAction=processAction;
	}
	public void setProcessComplete(boolean processComplete){
		this.processComplete=processComplete;
	}

  	public String getDBName(){
    	return dBName;    
    }
    public String getTblName(){
    	return tblName;
    } 
    public String getSQLQuery(){
    	return SQLQuery;
    }
    public String getProcessResult(){
    	return processResult;
    }
    public String getProcessMsg(){
    	return processMsg;
    }
    public String getProcessAction(){
    	return processAction;  		
    }
    public boolean isProcessComplete(){
    	return processComplete;
    }

}
