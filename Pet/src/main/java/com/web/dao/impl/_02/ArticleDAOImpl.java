package com.web.dao.impl._02;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.NonUniqueResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._01.MemberBean;
import com.web.model._02.ArticleBean;
import com.web.model._02.LikeCountBean;
import com.web.model._02.ReplyBean;
import com.web.model._02.ReportBean;
import com.web.model._02.StyleBean;
import com.web.model._07.MemberOrderBean;

@Repository
public class ArticleDAOImpl implements ArtDAO {

//	Connection conn;
//	private SessionFactory sessionFactory;
//
//	public ArticleDAOImpl(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}
//
//	public Session getSession() {
//		return sessionFactory.getCurrentSession();
//	}
	
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	
	@Override
	public void addArticle(ArticleBean article){
//		getSession().save(article);
		
		Session session = factory.getCurrentSession();
	    session.save(article);

	}

	@Override
	public void editArticle(ArticleBean article,int s){
		Session session = factory.getCurrentSession();
		ArticleBean bean = session.get(ArticleBean.class, s);
//		ArticleBean bean = getSession().get(ArticleBean.class, s);
		bean.setTitle(article.getTitle());
		bean.setContent(article.getContent());
		bean.setPostTime(article.getPostTime());
		bean.setReport(article.getReport());
		bean.setLikeCount(article.getLikeCount());
		bean.setReport(article.getReport());
		bean.setAvailable(article.getAvailable());
		bean.setCoverImage(article.getCoverImage());
		bean.setCategories(article.getCategories());

	}

	@Override
	public void delete(ArticleBean no){
		Session session = factory.getCurrentSession();
//		getSession().delete(no);
		session.delete(no);
	}

	@Override
	public ArticleBean getArticleById(int no) {
//		Session session = factory.getCurrentSession();
//		Query query = session.createQuery("from ArticleBean where article_no=" + art.getNo());
//		Query query = getSession().createQuery("from ArticleBean where article_no=" + art.getArticle_no());
//		List<ArticleBean> list = (List<ArticleBean>) query.list();
//		for (ArticleBean b1 : list) {
//			art.setNo(b1.getNo());
//			art.setTitle(b1.getTitle());
//			art.setContent(b1.getContent());
//			art.setPostTime(b1.getPostTime());
//			art.setArticleImage(b1.getArticleImage());
//			art.setLikeCount(b1.getLikeCount());
//		}
		
		Session session = factory.getCurrentSession();
		ArticleBean ab = session.get(ArticleBean.class, no);
		return ab;
	}

	@Override
	public List<ArticleBean> getAll(){
//		Session session = factory.getCurrentSession();
//		Query query = session.createQuery("from ArticleBean");
//		Query query = getSession().createQuery("from ArticleBean");
//		List<ArticleBean> list = (List<ArticleBean>)query.list();
//		return list;
		
		  String query = "FROM ArticleBean order by postTime DESC";
		  Session session = null;
		  List<ArticleBean> list = new ArrayList<>();
		  session = factory.getCurrentSession();
		  list = session.createQuery(query).getResultList();  //多筆，單筆 getSingleResult()
		  
		  return list;
	}

	@Override
	public List<ArticleBean> getfindBy(String title){ // 模糊查詢
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from ArticleBean where title like '%"+ title +"%'");
		
		List<ArticleBean> lists = (List<ArticleBean>) query.list();
		
		return query.list();		
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getArticlesByMemberNo(String memberNo) {      
		Session session = null;
		session = factory.getCurrentSession();
	    String hql = "FROM ArticleBean bb WHERE bb.memberId = : memberId order by postTime DESC";   
	    List<ArticleBean> list = new ArrayList<>();  
	    list = session.createQuery(hql).setParameter("memberId", memberNo).list();
	    return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getArticlesByMemberNo2(String memberNo) {      
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM ArticleBean bb WHERE bb.memberId = : memberId order by postTime DESC");
		query.setFirstResult(0);
	    query.setMaxResults(5);
	    List list = query.setParameter("memberId", memberNo).list();
	    return query.list();
	    
//		Session session = null;
//		session = factory.getCurrentSession();
//	    String hql = "FROM ArticleBean bb WHERE bb.memberId = : memberId order by postTime DESC";   
//	    List<ArticleBean> list = new ArrayList<>();  
//	    list = session.createQuery(hql).setParameter("memberId", memberNo).list();
//	    return list;
	}
	

	@Override
	public void addReply(ReplyBean reply) {
		Session session = factory.getCurrentSession();
	    session.save(reply);

	}


	@Override
	public void editReply(ReplyBean reply) {
		Session session = factory.getCurrentSession();
	    session.save(reply);
		
	}
	
	@Override
	public void deleteReply(ReplyBean replyno){
		Session session = factory.getCurrentSession();
//		getSession().delete(no);
		session.delete(replyno);
	}


	@Override
	public List<ReplyBean> getAllReplys() {
		String hql = "FROM ReplyBean";
		  Session session = null;
		  List<ReplyBean> list = new ArrayList<>();
		  session = factory.getCurrentSession();
		  list = session.createQuery(hql).getResultList();
		  return list;
	}


	@Override
	public List<ReplyBean> getReplysByArticle(int articleno) {     
		String hql = "FROM ReplyBean rb WHERE rb.article_no = : article_no";
	    Session session = null;
	    List<ReplyBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).setParameter("article_no", articleno).list();
	    return list;
	    
	}


	@Override
	public ReplyBean getReplyById(int no) {
		Session session = factory.getCurrentSession();
		ReplyBean rb = session.get(ReplyBean.class, no);
		return rb;
	}


//	@Override
//	public ReplyBean getReplyByArticleId(int articleno) {
//		String hql = "FROM ReplyBean rp WHERE rp.article.no = :article";
//		ReplyBean bean = (ReplyBean) factory.getCurrentSession().createQuery(hql).setParameter("article", articleno).uniqueResult();
//		return bean;
//	}


	@Override
	public void addReport(ReportBean report) {
		Session session = factory.getCurrentSession();
	    session.save(report);
		
	}
	
	@Override
	public ReportBean getReportByArticle(int articleno) {     
		String hql = "FROM ReportBean rb WHERE rb.article_no = : article_no";
	    Session session = null;
	    session = factory.getCurrentSession();
	    ReportBean list = (ReportBean)session.createQuery(hql).setParameter("article_no", articleno).uniqueResult();
	    return list;
	    
	}
	

	@Override
	public void addCt(LikeCountBean likecount) {
		Session session = factory.getCurrentSession();
		session.save(likecount);	
	}


	@Override
	public void updateCt(LikeCountBean likecount) {
		Session session = factory.getCurrentSession();
		session.update(likecount);	
	}
	
	@Override
	public String getLikeByMemberAndArticle(String memberNo, int articleno) {
		String hql = "FROM LikeCountBean lb WHERE lb.memberId = :memberId and lb.article_no = :article_no";
		LikeCountBean likecount = (LikeCountBean) factory.getCurrentSession().createQuery(hql).setParameter("memberId", memberNo).setParameter("article_no", articleno).uniqueResult();
		if(likecount == null || likecount.getLikecount() == null) {
			return "null";
		}
		return String.valueOf(likecount.getLikecount());

	}


	@Override
	public LikeCountBean getLikeNo(String memberNo, int articleno) {
		String hql = "FROM LikeCountBean lb WHERE lb.memberId = :memberId and lb.article_no = :article_no";
		LikeCountBean likecount = (LikeCountBean) factory.getCurrentSession().createQuery(hql).setParameter("memberId", memberNo).setParameter("article_no", articleno).uniqueResult();
		return likecount;
	}


	@Override
	public List<ArticleBean> getArticleByLike() {
	    Session session = factory.getCurrentSession();
	    Query query = session.createQuery("from ArticleBean order by likeCount DESC");
	    query.setFirstResult(0);
	    query.setMaxResults(5);
	    query.list();
	    return (ArrayList<ArticleBean>) query.list();
	}
	
	@Override
	public List<ArticleBean> getArticlelikeByMember(String memberNo) {
	    Session session = factory.getCurrentSession();
	    Query query = session.createQuery("from ArticleBean lb WHERE lb.memberId = :memberId order by likeCount DESC");
	    query.setFirstResult(0);
	    query.setMaxResults(5);
	    List list = query.setParameter("memberId", memberNo).list();
	    return query.list();
	}
	
	@Override
	public List<ArticleBean> getArticleByDate(String memberNo) {
	    Session session = factory.getCurrentSession();
	    Query query = session.createQuery("from ArticleBean lb WHERE lb.memberId = :memberId order by postTime ASC");
	    query.setFirstResult(0);
	    query.setMaxResults(5);
	    List list = query.setParameter("memberId", memberNo).list();
	    return query.list();

	   
	}
	
	//依日期搜尋文章
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ArticleBean> queryArticleByDate(String p1,String d1,String d2) {
		Session session = factory.getCurrentSession();
		ArrayList<ArticleBean> query = (ArrayList<ArticleBean>) session.createQuery
				("from ArticleBean ab WHERE ab.memberId = :memberId and ab.postTime > :postTime1 and ab.postTime < :postTime2")
				.setParameter("memberId", p1).setParameter("postTime1", d1).setParameter("postTime2", d2).getResultList();
		
		System.out.println("queryquery=" + query);
		return query;
	
	}
	
	//文章分類搜尋
//	@SuppressWarnings("unchecked")
//	@Override
//	public ArrayList<ArticleBean> queryByCategories() { 
//		Session session = factory.getCurrentSession();
//		ArrayList<ArticleBean> query = (ArrayList<ArticleBean>) session.createQuery
//				("FROM ArticleBean ab WHERE ab.categories = '1'").getResultList();
//	    return query;   
//	}
//	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ArticleBean> queryArticleByCategories1(String p1) { 
		Session session = factory.getCurrentSession();
		ArrayList<ArticleBean> query = (ArrayList<ArticleBean>) session.createQuery
				("FROM ArticleBean ab WHERE ab.memberId = :memberId and ab.categories = '1'")
				.setParameter("memberId", p1).getResultList();
	    return query;   
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ArticleBean> queryArticleByCategories2(String p1) { 
		Session session = factory.getCurrentSession();
		ArrayList<ArticleBean> query = (ArrayList<ArticleBean>) session.createQuery
				("FROM ArticleBean ab WHERE ab.memberId = :memberId and ab.categories = '2'")
				.setParameter("memberId", p1).getResultList();
	    return query;   
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ArticleBean> queryArticleByCategories3(String p1) { 
		Session session = factory.getCurrentSession();
		ArrayList<ArticleBean> query = (ArrayList<ArticleBean>) session.createQuery
				("FROM ArticleBean ab WHERE ab.memberId = :memberId and ab.categories = '3'")
				.setParameter("memberId", p1).getResultList();
	    return query;   
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ArticleBean> queryArticleByCategories4(String p1) { 
		Session session = factory.getCurrentSession();
		ArrayList<ArticleBean> query = (ArrayList<ArticleBean>) session.createQuery
				("FROM ArticleBean ab WHERE ab.memberId = :memberId and ab.categories = '4'")
				.setParameter("memberId", p1).getResultList();
	    return query;   
	}


	@Override
	public void addStyle(StyleBean sb) {
		Session session = factory.getCurrentSession();
	    session.save(sb);
	}


	@Override
	public void editStyle(StyleBean sb) {
		Session session = factory.getCurrentSession();
		session.update(sb);
		
	}
	
	
	
}
