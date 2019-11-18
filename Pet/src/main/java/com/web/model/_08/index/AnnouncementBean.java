package com.web.model._08.index;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "announcement")
public class AnnouncementBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int announce_id;
	private String announce_title;
	private String announce_sub;
	private Blob announce_img;
	
	public AnnouncementBean() {}
	
	public AnnouncementBean(int announce_id, String announce_title, String announce_sub, Blob announce_img) {
		super();
		this.announce_id = announce_id;
		this.announce_title = announce_title;
		this.announce_sub = announce_sub;
		this.announce_img = announce_img;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "announce_id")
	public int getAnnounce_id() {
		return announce_id;
	}

	public void setAnnounce_id(int announce_id) {
		this.announce_id = announce_id;
	}
	@Column(name = "announce_title")
	public String getAnnounce_title() {
		return announce_title;
	}

	public void setAnnounce_title(String announce_title) {
		this.announce_title = announce_title;
	}
	@Column(name = "announce_sub")
	public String getAnnounce_sub() {
		return announce_sub;
	}

	public void setAnnounce_sub(String announce_sub) {
		this.announce_sub = announce_sub;
	}
	@Column(name = "announce_img")
	public Blob getAnnounce_img() {
		return announce_img;
	}

	public void setAnnounce_img(Blob announce_img) {
		this.announce_img = announce_img;
	}
	
	
	
	


}
