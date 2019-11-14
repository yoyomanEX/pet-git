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

@XmlRootElement(name = "hotelBean")
@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name = "hotel")
public class HotelBean implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@XmlElement(name = "hotel_id")
	private int hotel_id;
	@XmlElement(name = "hotel_name")
	private String hotel_name;
	@XmlElement(name = "hotel_address")
	private String hotel_address;
	@XmlElement(name = "hotel_tel")
	private String hotel_tel;
	
	public HotelBean() {
		super();
	}
	public HotelBean(int hotel_id, String hotel_name, String hotel_address, String hotel_tel) {
		super();
		this.hotel_id = hotel_id;
		this.hotel_name = hotel_name;
		this.hotel_address = hotel_address;
		this.hotel_tel = hotel_tel;
	}
	
	@Column(name = "hotel_id")
	public int getHotel_id() {
		return hotel_id;
	}
	public void setHotel_id(int hotel_id) {
		this.hotel_id = hotel_id;
	}
	@Column(name = "hotel_name")
	public String getHotel_name() {
		return hotel_name;
	}
	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}
	@Column(name = "hotel_address")
	public String getHotel_address() {
		return hotel_address;
	}
	public void setHotel_address(String hotel_address) {
		this.hotel_address = hotel_address;
	}
	@Column(name = "hotel_tel")
	public String getHotel_tel() {
		return hotel_tel;
	}
	public void setHotel_tel(String hotel_tel) {
		this.hotel_tel = hotel_tel;
	}
	
	
	
	
	
	
	
	

}
