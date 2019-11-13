package com.web.model._06;

import org.springframework.stereotype.Service;

public class PetBean implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private int userID;
	private String userName;
	private int userPassword;
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(int userPassword) {
		this.userPassword = userPassword;
	}
	@Override
	public String toString() {
		return "PetBean [userName=" + userName + ", userPassword=" + userPassword + "]";
	}
	
	
}
