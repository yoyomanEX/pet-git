package com.web.model._08.index;

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

@XmlRootElement(name = "markBean")
@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name = "mark")
public class MarkBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@XmlElement(name = "mark_id")
	private int mark_id;
	@XmlElement(name = "content_id")
	private int content_id;
	@XmlElement(name = "member_id")
	private String member_id;
	
	public MarkBean() {
		super();
	}
	
	public MarkBean(int mark_id, int content_id, String member_id) {
		super();
		this.mark_id = mark_id;
		this.content_id = content_id;
		this.member_id = member_id;
	}
	@Column(name = "mark_id")
	public int getMark_id() {
		return mark_id;
	}

	public void setMark_id(int mark_id) {
		this.mark_id = mark_id;
	}
	@Column(name = "content_id")
	public int getContent_id() {
		return content_id;
	}

	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}
	@Column(name = "member_id")
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	
	
	
}

