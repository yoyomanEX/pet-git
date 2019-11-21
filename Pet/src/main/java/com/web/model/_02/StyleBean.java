package com.web.model._02;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="style")
public class StyleBean {
	
	@Id
	@Column(name = "style_no")
	private boolean no;
	private String memberId;
	
	
	public boolean getNo() {
		return no;
	}
	public void setNo(boolean no) {
		this.no = no;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

}
