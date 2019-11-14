package com.web.model._03;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="friend")
public class FriendBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String mid1;
	private String mid2;
	private String status;
	

	public Integer getId() {
		return id;
	}


	public String getMid1() {
		return mid1;
	}

	public void setMid1(String mid1) {
		this.mid1 = mid1;
	}

	public String getMid2() {
		return mid2;
	}

	public void setMid2(String mid2) {
		this.mid2 = mid2;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
