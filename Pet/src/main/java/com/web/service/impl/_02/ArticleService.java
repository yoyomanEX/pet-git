package com.web.service.impl._02;

import java.util.List;

import com.web.model._02.ArticleBean;
import com.web.model._02.LikeCountBean;
import com.web.model._02.ReplyBean;
import com.web.model._02.ReportBean;

public interface ArticleService {

    public void addArticle(ArticleBean article);
	
	public void editArticle(ArticleBean article,int s);
	
	public void delete(ArticleBean no);
	
	public ArticleBean getArticleById(int no);
	
	public List<ArticleBean> getAll();
	
	public List<ArticleBean> getfindBy(String title);  //模糊查詢
	
	public List<ArticleBean> getArticlesByMemberNo(String memberNo) ;
	
//	-------------------
	
	
    public void addReply(ReplyBean reply);
	
	public void editReply(ReplyBean reply);
	
	public List<ReplyBean>  getAllReplys();
	
	public List<ReplyBean>  getReplysByArticle(int articleno);
	
//	public ReplyBean getReplyById(int reply_no);
	
//	public ReplyBean getReplyByArticleId(int articleno);
	
	public void addReport(ReportBean rb);
	
	public void addCt(LikeCountBean likecount);
	
	public void updateCt(LikeCountBean likecount);
	
	public LikeCountBean getLikeNo(String memberNo, int articleno);
	
	public String getLikeByMemberAndArticle(String memberNo,int articleno);
	
}
