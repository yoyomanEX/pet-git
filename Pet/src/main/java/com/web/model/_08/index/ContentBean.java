package com.web.model._08.index;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "content")
public class ContentBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int content_id;
	private String content_title;
	private String content_sub;
	private Blob content_img;
	@Transient
	private MultipartFile contentImg;
	private String content_fileName;
	private String content_loc;
	private String content_tag;
	
	public ContentBean() {}
	
	public ContentBean(int content_id, String content_title, String content_sub, Blob content_img,
			String content_fileName, String content_loc, String content_tag) {
		super();
		this.content_id = content_id;
		this.content_title = content_title;
		this.content_sub = content_sub;
		this.content_img = content_img;
		this.content_fileName = content_fileName;
		this.content_loc = content_loc;
		this.content_tag = content_tag;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "content_id")
	public int getContent_id() {
		return content_id;
	}

	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}
	@Column(name = "content_title")
	public String getContent_title() {
		return content_title;
	}

	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}
	@Column(name = "content_sub")
	public String getContent_sub() {
		return content_sub;
	}

	public void setContent_sub(String content_sub) {
		this.content_sub = content_sub;
	}
	@Column(name = "content_img")
	public Blob getContent_img() {
		return content_img;
	}

	public void setContent_img(Blob content_img) {
		this.content_img = content_img;
	}
	@Column(name = "content_loc")
	public String getContent_loc() {
		return content_loc;
	}

	public void setContent_loc(String content_loc) {
		this.content_loc = content_loc;
	}
	@Column(name = "content_tag")
	public String getContent_tag() {
		return content_tag;
	}

	public void setContent_tag(String content_tag) {
		this.content_tag = content_tag;
	}
	@Transient
	public MultipartFile getContentImg() {
		return contentImg;
	}
	public void setContentImg(MultipartFile contentImg) {
		this.contentImg = contentImg;
	}
	@Column(name = "content_fileName")
	public String getContent_fileName() {
		return content_fileName;
	}

	public void setContent_fileName(String content_fileName) {
		this.content_fileName = content_fileName;
	}
	
	
	
	
	
	
	

}
