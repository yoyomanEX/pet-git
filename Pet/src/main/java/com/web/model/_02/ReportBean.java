package com.web.model._02;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="report")  //檢舉
public class ReportBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "report_no")
	private Integer no;	
	private String content;
	private Date postTime;
	private String memberId;
	private Integer article_no;
	
//	@Transient
//	private String rnoString;
//	@Transient
//	private String postTimeString;
//	@Transient
//	private String authorString;
//	@Transient
//	private String articleString;
	
//	@ManyToOne
//	@JoinColumn(name = "fk_author_no")
//	private MemberBean author;//B, M2O
	
//	@ManyToOne
//	@JoinColumn(name="fK_ArticleBean_no") 
//    private ArticleBean article;
	
	
//	public ArticleBean getArticle() {
//		return article;
//	}
//	
//	public void setArticle(ArticleBean article) {
//		this.article = article;
//	}

//	public MemberBean getAuthor() {
//		return author;
//	}
//	public void setAuthor(MemberBean author) {
//		this.author = author;
//	}
		
	public Integer getNo() { 
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPostTime() {
		System.out.println("getpostTime");
		return postTime;
	}
	public void setPostTime(Date postTime) {
		System.out.println("setpostTime");
		this.postTime = postTime;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Integer getArticle_no() {
		return article_no;
	}
	public void setArticle_no(Integer article_no) {
		this.article_no = article_no;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReportBean [no=");
		builder.append(no);
		builder.append(", content=");
		builder.append(content);
		builder.append(", postTime=");
		builder.append(postTime);
		builder.append(", memberId=");
		builder.append(memberId);
		builder.append(", article_no=");
		builder.append(article_no);
		builder.append("]");
		return builder.toString();
	}
	
	
}
