package com.web.model._03;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.web.model._01.MemberBean;
import com.web.model._02.ArticleBean;
@Entity
@Table(name="notice")
public class NoticeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String userid;
	private String otherid;
	private String friendstatus;
	private Integer articleid;
	private String messagestatus;
	@ManyToOne
	@JoinColumn(name="articleid",insertable = false,updatable = false)
	private ArticleBean Articlebean;

	
	public ArticleBean getArticlebean() {
		return Articlebean;
	}
	public void setArticlebean(ArticleBean articlebean) {
		Articlebean = articlebean;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOtherid() {
		return otherid;
	}
	public void setOtherid(String otherid) {
		this.otherid = otherid;
	}
	public String getFriendstatus() {
		return friendstatus;
	}
	public void setFriendstatus(String friendstatus) {
		this.friendstatus = friendstatus;
	}
	public Integer getArticleid() {
		return articleid;
	}
	public void setArticleid(Integer articleid) {
		this.articleid = articleid;
	}
	public String getMessagestatus() {
		return messagestatus;
	}
	public void setMessagestatus(String messagestatus) {
		this.messagestatus = messagestatus;
	}
	
	

}
