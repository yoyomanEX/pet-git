package com.web.dao.impl._02;

import java.util.ArrayList;
import java.util.List;

import com.web.model._02.ArticleBean;
import com.web.model._02.LikeCountBean;
import com.web.model._02.ReplyBean;
import com.web.model._02.ReportBean;
import com.web.model._02.StyleBean;
import com.web.model._03.MyBlogBean;

public interface ArtDAO {
	

	
	public void addArticle(ArticleBean article);
	
	public void editArticle(ArticleBean article,int s);
	
	public void delete(ArticleBean no);
	
	public ArticleBean getArticleById(int no);
	
	public List<ArticleBean> getAll();
	
	public List<ArticleBean> getfindBy(String title);  //模糊查詢
	
	public List<ArticleBean> getArticlesByMemberNo(String memberNo) ;    // 只看的到會員自己的文章
	
	public List<ArticleBean> getArticlesByMemberNo2(String memberNo);
	
//	-------------------
	
	
	//留言
	public void addReply(ReplyBean reply);
	
	public void editReply(ReplyBean reply);
	
	public void deleteReply(ReplyBean replyno);
	
	public void DeletComm(ReplyBean replyno);
	
	public ReplyBean getReplyById(int no);
	
	public List<ReplyBean>  getAllReplys();
	
	public List<ReplyBean>  getReplysByArticle(int articleno);   //根據不同文章留言
	
//	public ReplyBean getReplyByArticleId(int articleno);
	
	//檢舉
	public void addReport(ReportBean rb);
	
	public ReportBean getReportByArticle(int articleno);
	
	//按讚
	public void addCt(LikeCountBean likecount);
	
	public void updateCt(LikeCountBean likecount);
	
	public LikeCountBean getLikeNo(String memberNo, int articleno);
	
	public String getLikeByMemberAndArticle(String memberNo,int articleno);
	
	public List<ArticleBean> getArticleByLike();
	
	//以按讚數排序
	public List<ArticleBean> getArticlelikeByMember(String memberNo);
	
	//以日期排序
	public List<ArticleBean> getArticleByDate(String memberNo);
	
	//ajax日期搜尋
	public ArrayList<ArticleBean> queryArticleByDate(String p1,String d1,String d2);
	
	//以文章分類搜尋
	public ArrayList<ArticleBean> queryArticleByCategories1(String p1);
	
	public ArrayList<ArticleBean> queryArticleByCategories2(String p1); 
	
	public ArrayList<ArticleBean> queryArticleByCategories3(String p1);
	
	public ArrayList<ArticleBean> queryArticleByCategories4(String p1); 
	
	//搜尋全部分類
//	public ArrayList<ArticleBean> queryByCategories();
	
	public void addStyle(StyleBean sb);
	
	public void editStyle(StyleBean sb);
	


}
