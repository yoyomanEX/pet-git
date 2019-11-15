package com.web.model._02;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.model._01.MemberBean;


@Entity
@Table(name = "article")
public class ArticleBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	@Transient
	private MultipartFile articleImage;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "article_no")
	private Integer no;
	private String title;
	private String content;
	private Integer likeCount;
	private String postTime;
	private String memberId;
	private Boolean report;
	private Boolean available;
	private Blob coverImage;	
	private String fileName;
	
	
//	@Transient
//	private String noString;
//	@Transient
//	private String postTimeString;
//	@Transient
//	private String likeCountString;
//	@Transient
//	private String authorString;
	
	
//	@OneToMany(mappedBy = "article",fetch = FetchType.EAGER)
//	private Set<ReplyBean> replys = new HashMap();
//			
//	@ManyToOne
//	@JoinColumn(name = "fk_author_id")    //@JoinColumn外鍵的名字，外鍵在多方
//	private MemberBean author;  //B, M2O
	
	
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
//	public MemberBean getAuthor() {
//		return author;
//	}
//	public void setAuthor(MemberBean author) {
//		this.author = author;
//	}
//	
//	
//	public Set<ReplyBean> getReplys() {
//		return replys;
//	}
//	public void setReplys(Set<ReplyBean> replys) {
//		this.replys = replys;
//	}
	
	
	public Boolean getReport() {
		return report;
	}
	public void setReport(Boolean report) {
		this.report = report;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
	
	public MultipartFile getArticleImage() {
		return articleImage;
	}
	public void setArticleImage(MultipartFile articleImage) {
		this.articleImage = articleImage;
	}
	
	
	//有toString會列印內容， 沒toString只會印出路徑位置 ->方便抓bug
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ArticleBean [no=");
		builder.append(no);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", likeCount=");
		builder.append(likeCount);
		builder.append(", postTime=");
		builder.append(postTime);
		builder.append("]");
		return builder.toString();
	}
	public Blob getCoverImage() {
		return coverImage;
	}
	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
