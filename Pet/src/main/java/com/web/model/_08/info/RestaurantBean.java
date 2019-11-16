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

@XmlRootElement(name = "restaurantBean")
@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name = "restaurant")
public class RestaurantBean implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@XmlElement(name = "restaurant_id")
	private int restaurant_id;
	@XmlElement(name = "restaurant_name")
	private String restaurant_name;
	@XmlElement(name = "restaurant_address")
	private String restaurant_address;
	@XmlElement(name = "restaurant_tel")
	private String restaurant_tel;
	
	public RestaurantBean() {
		super();
	}
	
	public RestaurantBean(int restaurant_id, String restaurant_name, String restaurant_address, String restaurant_tel) {
		super();
		this.restaurant_id = restaurant_id;
		this.restaurant_name = restaurant_name;
		this.restaurant_address = restaurant_address;
		this.restaurant_tel = restaurant_tel;
	}
	
	@Column(name = "restaurant_id")
	public int getRestaurant_id() {
		return restaurant_id;
	}

	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}
	@Column(name = "restaurant_name")
	public String getRestaurant_name() {
		return restaurant_name;
	}

	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}
	@Column(name = "restaurant_address")
	public String getRestaurant_address() {
		return restaurant_address;
	}

	public void setRestaurant_address(String restaurant_address) {
		this.restaurant_address = restaurant_address;
	}
	@Column(name = "restaurant_tel")
	public String getRestaurant_tel() {
		return restaurant_tel;
	}

	public void setRestaurant_tel(String restaurant_tel) {
		this.restaurant_tel = restaurant_tel;
	}
	
	
	
	
	
	

}
