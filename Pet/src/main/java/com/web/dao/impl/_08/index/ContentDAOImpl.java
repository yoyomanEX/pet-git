package com.web.dao.impl._08.index;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._08.index.AnnouncementBean;
import com.web.model._08.index.ContentBean;

@Repository
public class ContentDAOImpl implements ContentDAO {
	
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	public List<ContentBean> qryAllContent() {
		String hql = "FROM ContentBean";
	    Session session = null;
	    List<ContentBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).getResultList();
	    return list;
	}

	@Override
	public ContentBean qryContentById(Integer content_id) {
		Session session = factory.getCurrentSession();
		ContentBean cont = session.get(ContentBean.class, content_id);
		return cont;
	}

	@Override
	public List<ContentBean> qryContentByTitle(String title) {
		String hql = "FROM ContentBean c WHERE c.content_title = :title";
	    List<ContentBean> list = new ArrayList<>();
	    Session session = factory.getCurrentSession();
	    list = session.createQuery(hql).setParameter("title", title).getResultList();
	    return list;
	}

	@Override
	public void insertContent(ContentBean contBean) {
		Session session = factory.getCurrentSession();
	    session.save(contBean);

	}

	@Override
	public void updateContent(Integer contId, ContentBean contBean) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE ContentBean c = :contBean WHERE content_id = :contId";
		int n = session.createQuery(hql)
				.setParameter("contId", contId)
				.setParameter("contBean", contBean)
				.executeUpdate();
	}

	@Override
	public void deleteContent(ContentBean contBean) {
		// TODO Auto-generated method stub

	}

}
