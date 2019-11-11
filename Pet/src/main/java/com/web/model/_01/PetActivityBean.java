package com.web.model._01;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "petActivity")
public class PetActivityBean {
	@Id
	private Integer activity_id;
	private String activity_title;
	private String activity_content;
	private String activityImage;
	private String admin_Id;
	private Integer number_limit;
	private Integer current_number;
	private Date save_at_y;
	private Date save_at_h;
	private Date start_at_y;
	private Date start_at_h;
	private Date end_at_y;
	private Date end_at_h;
	
	@Column(name = "activity_id")
	public Integer getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(Integer activity_id) {
		this.activity_id = activity_id;
	}
	@Column(name = "activity_title")
	public String getActivity_title() {
		return activity_title;
	}
	public void setActivity_title(String activity_title) {
		this.activity_title = activity_title;
	}
	@Column(name = "activity_content")
	public String getActivity_content() {
		return activity_content;
	}
	public void setActivity_content(String activity_content) {
		this.activity_content = activity_content;
	}
	@Column(name = "activityImage")
	public String getActivityImage() {
		return activityImage;
	}
	public void setActivityImage(String activityImage) {
		this.activityImage = activityImage;
	}
	@Column(name = "admin_Id")
	public String getAdmin_Id() {
		return admin_Id;
	}
	public void setAdmin_Id(String admin_Id) {
		this.admin_Id = admin_Id;
	}
	@Column(name = "number_limit")
	public Integer getNumber_limit() {
		return number_limit;
	}
	public void setNumber_limit(Integer number_limit) {
		this.number_limit = number_limit;
	}
	@Column(name = "current_number")
	public Integer getCurrent_number() {
		return current_number;
	}
	public void setCurrent_number(Integer current_number) {
		this.current_number = current_number;
	}
	@Column(name = "save_at_y")
	public Date getSave_at_y() {
		return save_at_y;
	}
	public void setSave_at_y(Date save_at_y) {
		this.save_at_y = save_at_y;
	}
	@Column(name = "save_at_h")
	public Date getSave_at_h() {
		return save_at_h;
	}
	public void setSave_at_h(Date save_at_h) {
		this.save_at_h = save_at_h;
	}
	@Column(name = "start_at_y")
	public Date getStart_at_y() {
		return start_at_y;
	}
	public void setStart_at_y(Date start_at_y) {
		this.start_at_y = start_at_y;
	}
	@Column(name = "start_at_h")
	public Date getStart_at_h() {
		return start_at_h;
	}
	public void setStart_at_h(Date start_at_h) {
		this.start_at_h = start_at_h;
	}
	@Column(name = "end_at_y")
	public Date getEnd_at_y() {
		return end_at_y;
	}
	public void setEnd_at_y(Date end_at_y) {
		this.end_at_y = end_at_y;
	}
	@Column(name = "end_at_h")
	public Date getEnd_at_h() {
		return end_at_h;
	}
	public void setEnd_at_h(Date end_at_h) {
		this.end_at_h = end_at_h;
	}
	
	
	
}
