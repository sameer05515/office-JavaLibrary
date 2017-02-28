package sjservlets;

/** A Java Bean use to keep the user borrow record
 *  <P>
 *  &copy; 2002 Song Jing; may be freely used or adapted.
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BorrowRec {
	private int borrowRecNumber = 0;
	private String itemCallNumber = "";
	private String staffIDBorrow = "";
	private String staffIDReturn = "";
	private String borrowerID = "";
	private String borrowerEmail ="";
	private String borrowDate = "";
	private String dueDate = "";
	private String returnDate ="";
	private String borrowStatus = "";
	
	public BorrowRec(){
	}
	
	public BorrowRec(int borrowRecNumber, String itemCallNumber, String staffIDBorrow, String staffIDReturn, String borrowerID, 
			String borrowerEmail, String borrowDate, String dueDate, String returnDate, String borrowStatus) {
		setBorrowRecNumber(borrowRecNumber);
		setItemCallNumber(itemCallNumber);
		setStaffIDBorrow(staffIDBorrow);
		setStaffIDReturn(staffIDReturn);
		setBorrowerID(borrowerID);
		setBorrowerEmail(borrowerEmail);
		setBorrowDate(borrowDate);
		setDueDate(dueDate);
		setReturnDate(returnDate);
		setBorrowStatus(borrowStatus);
	}

	public void setPropertyFromRequestParameter(HttpServletRequest request, String itemCallNumber){
		//setBorrowRecNumber(Integer.parseInt(request.getParameter("borrowRecNumber")));
		setItemCallNumber(itemCallNumber);
		setStaffIDBorrow(request.getParameter("staffIDBorrow"));
		setStaffIDReturn(request.getParameter("staffIDReturn"));
		setBorrowerID(request.getParameter("borrowerID"));
		setBorrowerEmail(request.getParameter("borrowerEmail"));
		setBorrowDate(request.getParameter("borrowDate")); 
		setDueDate(request.getParameter("dueDate"));
		setReturnDate(request.getParameter("returnDate"));
		setBorrowStatus(request.getParameter("borrowStatus"));
	}

	public void resetVariable() {		
		setBorrowRecNumber(0);
		setItemCallNumber("");
		setStaffIDBorrow("");
		setStaffIDReturn("");
		setBorrowerID("");
		setBorrowerEmail("");
		setBorrowDate("");
		setDueDate("");
		setReturnDate("");
		setBorrowStatus("");
  	}

	public void	setBorrowRecNumber(int borrowRecNumber) {
		this.borrowRecNumber = borrowRecNumber;
	}

	public void setItemCallNumber(String itemCallNumber) {
		this.itemCallNumber = itemCallNumber;
	}
	public void setStaffIDBorrow(String staffIDBorrow) {
		this.staffIDBorrow = staffIDBorrow;
	}
	public void setStaffIDReturn(String staffIDReturn) {
		this.staffIDReturn = staffIDReturn;
	}
	public void setBorrowerID(String borrowerID) {
		this.borrowerID = borrowerID;
	}
	public void setBorrowerEmail(String borrowerEmail) {
		this.borrowerEmail = borrowerEmail;
	}
	public void setBorrowDate(String borrowDate) {
		this.borrowDate = borrowDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public void setBorrowStatus(String borrowStatus) {
		this.borrowStatus = borrowStatus;
	}
  	
  	public int getBorrowRecNumber() {
  		return borrowRecNumber;
  	}
  	public String getItemCallNumber() {
  		return itemCallNumber;
  	}
  	public String getStaffIDBorrow() {
  		return staffIDBorrow;
  	}
  	public String getStaffIDReturn() {
  		return staffIDReturn;
  	}
  	public String getBorrowerID() {
  		return borrowerID;
  	}
  	public String getBorrowerEmail() {
  		return borrowerEmail;
  	}
  	public String getBorrowDate() {
  		return borrowDate;
  	}
  	public String getDueDate() {
  		return dueDate;
  	}
  	public String getReturnDate() {
  		return returnDate;
  	}
  	public String getBorrowStatus() {
  		return borrowStatus;
  	}
}
  
