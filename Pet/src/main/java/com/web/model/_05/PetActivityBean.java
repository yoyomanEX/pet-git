package com.web.model._05;

import java.sql.Blob;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.model._01.MemberBean;

@Entity
@Table(name = "petActivity")
public class PetActivityBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer activity_id;
	private String activity_title;
	private String activity_content;
//	private String admin_Id;
	private Integer number_limit;
	private Integer current_number;
//	private Date save_date;
	private String start_date;
	private String end_date;
	private String  filename;


	@JsonIgnore
	private Blob activity_image;
	@JsonIgnore
	@Transient
	private MultipartFile aimage;
	@ManyToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JoinTable(name = "activitypeople",joinColumns = {
	@JoinColumn(name="activity_id")},inverseJoinColumns = {@JoinColumn(name="member_Id")})
	private Set<MemberBean> members=new HashSet<MemberBean>();


	public Integer getActivity_id() {
		return activity_id;
	}

	public void setActivity_id(Integer activity_id) {
		this.activity_id = activity_id;
	}


	public String getActivity_title() {
		return activity_title;
	}

	public void setActivity_title(String activity_title) {
		this.activity_title = activity_title;
	}


	public String getActivity_content() {
		return activity_content;
	}

	public void setActivity_content(String activity_content) {
		this.activity_content = activity_content;
	}

//	@Column(name = "admin_Id")
//	public String getAdmin_Id() {
//		return admin_Id;
//	}
//
//	public void setAdmin_Id(String admin_Id) {
//		this.admin_Id = admin_Id;
//	}


	public Integer getNumber_limit() {
		return number_limit;
	}

	public void setNumber_limit(Integer number_limit) {
		this.number_limit = number_limit;
	}


	public Integer getCurrent_number() {
		return current_number;
	}

	public void setCurrent_number(Integer current_number) {
		this.current_number = current_number;
	}

//	@Column(name = "save_at_y")
//	public Date getSave_at_y() {
//		return save_date;
//	}
//
//	public void setSave_at_y(Date save_at_y) {
//		this.save_date = save_at_y;
//	}


	public String getFileName() {
		return filename;
	}

	public void setFileName(String filename) {
		this.filename = filename;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public Blob getActivity_image() {
		return activity_image;
	}

	public void setActivity_image(Blob activity_image) {
		this.activity_image = activity_image;
	}

	public MultipartFile getAimage() {
		return aimage;
	}

	public void setAimage(MultipartFile aimage) {
		this.aimage = aimage;
	}

	public Set<MemberBean> getMembers() {
		return members;
	}

	public void setMembers(Set<MemberBean> members) {
		this.members = members;
	}

	
	

}
