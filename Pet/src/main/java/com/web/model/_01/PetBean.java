package com.web.model._01;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "pet")
public class PetBean {
	@Id
	private Integer pet_id;
	private String member_id;
	private String pet_name;
	private Integer pet_age;
	private String petImage;
	
	@Column(name = "pet_id")
	public Integer getPet_id() {
		return pet_id;
	}
	public void setPet_id(Integer pet_id) {
		this.pet_id = pet_id;
	}
	@Column(name = "member_id")
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Column(name = "pet_name")
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	@Column(name = "pet_age")
	public Integer getPet_age() {
		return pet_age;
	}
	public void setPet_age(Integer pet_age) {
		this.pet_age = pet_age;
	}
	@Column(name = "petImage")
	public String getPetImage() {
		return petImage;
	}
	public void setPetImage(String petImage) {
		this.petImage = petImage;
	}
	
	
}
