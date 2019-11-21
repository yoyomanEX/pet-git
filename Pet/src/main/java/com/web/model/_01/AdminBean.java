package com.web.model._01;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

//@XmlRootElement(name="memberBean")
//@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name = "admin")
public class AdminBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//@XmlElement(name = "member_Id")
	private String admin_Id;
	//@XmlElement(name = "name")
	private String name;
	//@XmlElement(name = "password")
	private String password;
	//@XmlElement(name = "memberImage")
	private String adminImage;
	//@XmlElement(name = "fileName")
	private String fileName;
	private String checkPassword;
	@Transient
	public String getCheckPassword() {
		return checkPassword;
	}
	public void setCheckPassword(String checkPassword) {
		this.checkPassword = checkPassword;
	}
	@Id
	@Column(name = "admin_Id")
	public String getAdmin_Id() {
		return admin_Id;
	}
	public void setAdmin_Id(String admin_Id) {
		this.admin_Id = admin_Id;
	}
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name = "adminImage")
	public String getAdminImage() {
		return adminImage;
	}
	public void setAdminImage(String adminImage) {
		this.adminImage = adminImage;
	}
	@Column(name = "fileName")
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
		
}
