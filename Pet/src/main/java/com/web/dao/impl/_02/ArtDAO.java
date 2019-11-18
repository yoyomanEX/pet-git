package com.web.dao.impl._02;

import java.util.List;

import com.web.model._02.ArticleBean;
import com.web.model._02.LikeCountBean;
import com.web.model._02.ReplyBean;
import com.web.model._02.ReportBean;

public interface ArtDAO {
	
//	public void getConn();
//	
//	public void closeConn();
	
	public void addArticle(ArticleBean article);
	
	public void editArticle(ArticleBean article,int s);
	
	public void delete(ArticleBean no);
	
	public ArticleBean getArticleById(int no);
	
	public List<ArticleBean> getAll();
	
	public List<ArticleBean> getfindBy(String title);  //模糊查詢
	
	public List<ArticleBean> getArticlesByMemberNo(String memberNo) ;    // 只看的到會員自己的文章
	
//	-------------------
	
	public void addReply(ReplyBean reply);
	
	public void editReply(ReplyBean reply);
	
	public ReplyBean getReplyById(int no);
	
	public List<ReplyBean>  getAllReplys();
	
	public List<ReplyBean>  getReplysByArticle(int articleno);   //根據不同文章留言
	
//	public ReplyBean getReplyById(int no);
	
//	public ReplyBean getReplyByArticleId(int articleno);
	
	public void addReport(ReportBean rb);
	
	public ReportBean getReportByArticle(int articleno);
	
	public void addCt(LikeCountBean likecount);
	
	public void updateCt(LikeCountBean likecount);
	
	public LikeCountBean getLikeNo(String memberNo, int articleno);
	
	public String getLikeByMemberAndArticle(String memberNo,int articleno);
	
	public List<ArticleBean> getArticleByLike();
	

}
