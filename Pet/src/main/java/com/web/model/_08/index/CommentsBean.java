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

@XmlRootElement(name = "commentsBean")
@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name = "comments")
public class CommentsBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@XmlElement(name = "comments_id")
	private int comments_id;
	@XmlElement(name = "content_id")
	private String content_id;
	@XmlElement(name = "comments_sub")
	private String comments_sub;
	@XmlElement(name = "member_id")
	private String member_id;
	@XmlElement(name = "name")
	private String name;

	public CommentsBean() {
		super();
	}

	public CommentsBean(int comments_id, String content_id, String comments_sub, String member_id, String name) {
		super();
		this.comments_id = comments_id;
		this.content_id = content_id;
		this.comments_sub = comments_sub;
		this.member_id = member_id;
		this.name = name;
	}
	@Column(name = "comments_id")
	public int getComments_id() {
		return comments_id;
	}

	public void setComments_id(int comments_id) {
		this.comments_id = comments_id;
	}
	@Column(name = "content_id")
	public String getContent_id() {
		return content_id;
	}

	public void setContent_id(String content_id) {
		this.content_id = content_id;
	}
	@Column(name = "comments_sub")
	public String getComments_sub() {
		return comments_sub;
	}
	
	public void setComments_sub(String comments_sub) {
		this.comments_sub = comments_sub;
	}
	@Column(name = "member_id")
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
