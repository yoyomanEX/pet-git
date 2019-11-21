package com.web.model._01;


import java.io.Serializable;
import java.sql.Blob;
import java.sql.Clob;

import java.sql.Timestamp;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

@XmlRootElement(name="memberBean")
@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name = "member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@XmlElement(name = "member_Id")
	private String member_Id;
	@XmlElement(name = "name")
	private String name;
	@XmlElement(name = "password")
	private String password;
	@XmlElement(name = "address")
	private String address;
	@XmlElement(name = "email")
	private String email;
	@XmlElement(name = "tel")
	private int tel;
	@XmlElement(name = "memberImage")
	private Blob memberImage;
	@XmlElement(name = "fileName")
	private String fileName;
	@XmlElement(name = "memberPet")
	private int memberPet;
	private MultipartFile  filImage;
	private String checkPassword;
	
	@Transient
	@XmlTransient
	public MultipartFile getFilImage() {
		return filImage;
	}
	public void setFilImage(MultipartFile filImage) {
		this.filImage = filImage;
	}
	@Transient
	@XmlTransient
	public String getCheckPassword() {
		return checkPassword;
	}
	public void setCheckPassword(String checkPassword) {
		this.checkPassword = checkPassword;
	}
	
	@Id
	@Column(name = "member_Id")
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
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
	
	@Column(name = "address")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name = "email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name = "tel")
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	
	@Column(name = "memberImage")
	public Blob getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(Blob memberImage) {
		this.memberImage = memberImage;
	}
	
	@Column(name = "fileName")
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "memberPet")
	public int getMemberPet() {
		return memberPet;
	}
	public void setMemberPet(int memberPet) {
		this.memberPet = memberPet;
	}


		
}
