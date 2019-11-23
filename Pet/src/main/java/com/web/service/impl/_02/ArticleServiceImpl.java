package com.web.service.impl._02;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._02.ArtDAO;
import com.web.model._02.ArticleBean;
import com.web.model._02.LikeCountBean;
import com.web.model._02.ReplyBean;
import com.web.model._02.ReportBean;
import com.web.model._02.StyleBean;
import com.web.model._03.MyBlogBean;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	ArtDAO dao;
	@Autowired
	public void setDao(ArtDAO dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public void addArticle(ArticleBean article) {
		dao.addArticle(article);
	}

	@Transactional
	@Override
	public void editArticle(ArticleBean article, int s) {
		if( article !=null) {
			dao.editArticle(article, s);		
		}else {
			System.out.println("insert null");
		}
	}

	@Transactional
	@Override
	public void delete(ArticleBean no) {
		dao.delete(no);
	}

	@Transactional
	@Override
	public ArticleBean getArticleById(int no) {
		return dao.getArticleById(no);
	}

	@Transactional
	@Override
	public List<ArticleBean> getAll() {
		return dao.getAll();
	}

	@Transactional
	@Override
	public List<ArticleBean> getfindBy(String title) {
		return dao.getfindBy(title);
	}

	@Transactional
	@Override
	public void addReply(ReplyBean reply) {
		dao.addReply(reply);
		
	}

	@Transactional
	@Override
	public void editReply(ReplyBean reply) {
		if( reply !=null) {
			System.out.println("art insert not null");
			dao.editReply(reply);
			
		}else {
			System.out.println("insert null");
		}
	}
	
	@Transactional
	@Override
	public ReplyBean getReplyById(int no) {
		return dao.getReplyById(no);
	}

	@Transactional
	@Override
	public List<ReplyBean> getAllReplys() {
		return dao.getAllReplys();
	}

	@Transactional
	@Override
	public List<ReplyBean> getReplysByArticle(int articleno) {
		return dao.getReplysByArticle(articleno);
	}


//	@Transactional
//	@Override
//	public ReplyBean getReplyByArticleId(int articleno) {
//		return dao.getReplyByArticleId(articleno);
//	}

	@Transactional
	@Override
	public void addReport(ReportBean rb) {
		dao.addReport(rb);
		
	}
	
	@Transactional
	@Override
	public List<ArticleBean> getArticlesByMemberNo2(String memberNo)  {
		return dao.getArticlesByMemberNo2(memberNo);
	}

	@Transactional
	@Override
	public List<ArticleBean> getArticlesByMemberNo(String memberNo)  {
		return dao.getArticlesByMemberNo(memberNo);
	}

	@Transactional
	@Override
	public void addCt(LikeCountBean likecount) {
		dao.addCt(likecount);
		
	}

	@Transactional
	@Override
	public void updateCt(LikeCountBean likecount) {
		dao.updateCt(likecount);
		
	}

	@Transactional
	@Override
	public LikeCountBean getLikeNo(String memberNo, int articleno) {
		return dao.getLikeNo(memberNo, articleno);
	}

	@Transactional
	@Override
	public String getLikeByMemberAndArticle(String memberNo, int articleno) {
		return dao.getLikeByMemberAndArticle(memberNo, articleno);
	}

	@Transactional
	@Override
	public ReportBean getReportByArticle(int articleno) {
		return dao.getReportByArticle(articleno);
	}

	@Transactional
	@Override
	public List<ArticleBean> getArticleByLike() {
		return dao.getArticleByLike();
	}

	@Transactional
	@Override
	public ArrayList<ArticleBean> queryArticleByDate(String p1,String d1,String d2){
		return dao.queryArticleByDate(p1, d1, d2);
	}

	@Transactional
	@Override
	public List<ArticleBean> getArticleByDate(String memberNo) {
		return dao.getArticleByDate(memberNo);
	}

	@Transactional
	@Override
	public List<ArticleBean> getArticlelikeByMember(String memberNo) {
		return dao.getArticlelikeByMember(memberNo);
	}

	@Transactional
	@Override
	public void deleteReply(ReplyBean replyno) {
		dao.deleteReply(replyno);
		
	}

	@Transactional
	@Override
	public ArrayList<ArticleBean> queryArticleByCategories1(String p1) {
		return dao.queryArticleByCategories1(p1);
	}

	@Transactional
	@Override
	public ArrayList<ArticleBean> queryArticleByCategories2(String p1) {
		return dao.queryArticleByCategories2(p1);
	}

	@Transactional
	@Override
	public ArrayList<ArticleBean> queryArticleByCategories3(String p1) {
		return dao.queryArticleByCategories3(p1);
	}

	@Transactional
	@Override
	public ArrayList<ArticleBean> queryArticleByCategories4(String p1) {
		return dao.queryArticleByCategories4(p1);
	}

	@Transactional
	@Override
	public void addStyle(StyleBean sb) {
		dao.addStyle(sb);
	}

	@Transactional
	@Override
	public void editStyle(StyleBean sb) {
		dao.editStyle(sb);	
	}

	@Transactional
	@Override
	public void DeletComm(ReplyBean replyno) {
		dao.DeletComm(replyno);
		
	}



//	@Transactional
//	@Override
//	public ArrayList<ArticleBean> queryByCategories() {
//		return dao.queryByCategories();
//	}
	
	
	
	

	
}

