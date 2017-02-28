package sjservlets;

/** A Java Bean use to keep the reserve record
 *  <P>
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ReserveRec {
	private int reserveRecNumber = 0;
	private String itemCallNumber = "";
	private String reserverID = "";
	private String reserverEmail = "";
	private String reserveDate = "";
	private String reserveCancelDate = "";
	private String reserveInformDate = "";
	private String reserveStatus = "";
	
	public ReserveRec(){
	}
	
	public ReserveRec(int reserveRecNumber, String itemCallNumber, String reserverID, String reserverEmail, 
			String reserveDate, String reserveCancelDate, String reserveInformDate, String reserveStatus) {
		setReserveRecNumber(reserveRecNumber);
		setItemCallNumber(itemCallNumber);
		setReserverID(reserverID);
		setReserverEmail(reserverEmail);
		setReserveDate(reserveDate);
		setReserveCancelDate(reserveCancelDate);
		setReserveInformDate(reserveInformDate);
		setReserveStatus(reserveStatus);
	}

	public void setPropertyFromRequestParameter(HttpServletRequest request, String itemCallNumber){
		//setBorrowRefNumber(Integer.parseInt(request.getParameter("borrowRefNumber")));
		setItemCallNumber(itemCallNumber);
		setReserverID(request.getParameter("reserverID"));
		setReserverEmail(request.getParameter("reserverEmail"));
		setReserveDate(request.getParameter("reserveDate")); 
		setReserveCancelDate(request.getParameter("reserveCancelDate"));
		setReserveInformDate(request.getParameter("reserveInformDate"));
		setReserveStatus(request.getParameter("reserveStatus"));
	}

	public void resetVariable() {		
		setReserveRecNumber(0);
		setItemCallNumber("");
		setReserverID("");
		setReserverEmail("");
		setReserveDate("");
		setReserveCancelDate("");
		setReserveInformDate("");
		setReserveStatus("");
  	}

	public void	setReserveRecNumber(int reserveRecNumber) {
		this.reserveRecNumber = reserveRecNumber;
	}

	public void setItemCallNumber(String itemCallNumber) {
		this.itemCallNumber = itemCallNumber;
	}
	public void setReserverID(String reserverID) {
		this.reserverID = reserverID;
	}
	public void setReserverEmail(String reserverEmail) {
		this.reserverEmail = reserverEmail;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	public void setReserveCancelDate(String reserveCancelDate) {
		this.reserveCancelDate = reserveCancelDate;
	}
	public void setReserveInformDate(String reserveInformDate) {
		this.reserveInformDate = reserveInformDate;
	}
	public void setReserveStatus(String reserveStatus) {
		this.reserveStatus = reserveStatus;
	}
  	
  	public int getReserveRecNumber() {
  		return reserveRecNumber;
  	}
  	public String getItemCallNumber() {
  		return itemCallNumber;
  	}
  	public String getReserverID() {
  		return reserverID;
  	}
  	public String getReserverEmail() {
  		return reserverEmail;
  	}
  	public String getReserveDate() {
  		return reserveDate;
  	}
  	public String getReserveCancelDate() {
  		return reserveCancelDate;
  	}
  	public String getReserveInformDate() {
  		return reserveInformDate;
  	}
  	public String getReserveStatus() {
  		return reserveStatus;
  	}
}
  
