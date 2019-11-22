package com.web.model._02;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

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

import com.web.model._01.MemberBean;


@Entity
@Table(name = "reply")
public class ReplyBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Transient
	private MultipartFile artreplyImage;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reply_no")
	private Integer no;
	private String content;
	private Date postTime;
	private String memberId;
	private Integer article_no;
	private String message;
	private Blob replyImage;
	
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
//	
//	@ManyToOne
//	@JoinColumn(name="fk_ArticleBean_no") 
//    private ArticleBean article;
	
	
//	public MemberBean getAuthor() {
//		return author;
//	}
//
//	public void setAuthor(MemberBean author) {
//		this.author = author;
//	}
//
//	public ArticleBean getArticle() {
//		return article;
//	}
//
//	public void setArticle(ArticleBean article) {
//		this.article = article;
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
		return postTime;
	}

	public void setPostTime(Date postTime) {
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
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}


	public Blob getReplyImage() {
		return replyImage;
	}

	public void setReplyImage(Blob replyImage) {
		this.replyImage = replyImage;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReplyBean [no=");
		builder.append(no);
		builder.append(", content=");
		builder.append(content);
		builder.append(", postTime=");
		builder.append(postTime);
		builder.append(", memberId=");
		builder.append(memberId);
		builder.append(", article_no=");
		builder.append(article_no);
		builder.append(", message=");
		builder.append(message);
		builder.append(", replyImage=");
		builder.append(replyImage);
		builder.append("]");
		return builder.toString();
	}

	public MultipartFile getArtreplyImage() {
		return artreplyImage;
	}

	public void setArtreplyImage(MultipartFile artreplyImage) {
		this.artreplyImage = artreplyImage;
	}


	

}
