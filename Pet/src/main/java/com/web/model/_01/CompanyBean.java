package com.web.model._01;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name = "company")
public class CompanyBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String company_id;
	private String company_name;
	private String company_password;
	private String company_tel;
	private String company_add;
	private String company_email;
	private String contact_name;
	private int status;
	private String checkPassword;
	@Transient
	public String getCheckPassword() {
		return checkPassword;
	}
	public void setCheckPassword(String checkPassword) {
		this.checkPassword = checkPassword;
	}
	@Id
	@Column(name = "id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "company_id")
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	@Column(name = "company_name")
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	@Column(name = "company_password")
	public String getCompany_password() {
		return company_password;
	}
	public void setCompany_password(String company_password) {
		this.company_password = company_password;
	}
	@Column(name = "company_tel")
	public String getCompany_tel() {
		return company_tel;
	}
	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}
	@Column(name = "company_add")
	public String getCompany_add() {
		return company_add;
	}
	public void setCompany_add(String company_add) {
		this.company_add = company_add;
	}
	@Column(name = "company_email")
	public String getCompany_email() {
		return company_email;
	}
	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}
	@Column(name = "contact_name")
	public String getContact_name() {
		return contact_name;
	}
	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}
	@Column(name = "status")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	

}
