package com.web.model._08.info;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "hospitalBean")
@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name = "hospital")
public class HospitalBean implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@XmlElement(name = "hospital_id")
	private Integer hospital_id;
	@XmlElement(name = "hospital_name")
	private String hospital_name;
	@XmlElement(name = "hospital_address")
	private String hospital_address;
	@XmlElement(name = "hospital_tel")
	private String hospital_tel;
	
	public HospitalBean() {
		super();
	}

	public HospitalBean(Integer hospital_id, String hospital_name, String hospital_address, String hospital_tel) {
		super();
		this.hospital_id = hospital_id;
		this.hospital_name = hospital_name;
		this.hospital_address = hospital_address;
		this.hospital_tel = hospital_tel;
	}

	@Column(name = "hospital_id")
	public Integer getHospital_id() {
		return hospital_id;
	}

	public void setHospital_id(Integer hospital_id) {
		this.hospital_id = hospital_id;
	}
	@Column(name = "hospital_name")
	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}
	@Column(name = "hospital_address")
	public String getHospital_address() {
		return hospital_address;
	}

	public void setHospital_address(String hospital_address) {
		this.hospital_address = hospital_address;
	}
	@Column(name = "hospital_tel")
	public String getHospital_tel() {
		return hospital_tel;
	}

	public void setHospital_tel(String hospital_tel) {
		this.hospital_tel = hospital_tel;
	}
	
	
	
	
	
	

}
