package com.web.dao.impl._08.index;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._08.index.AnnouncementBean;
import com.web.model._08.info.HotelBean;

@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO {
	
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	public List<AnnouncementBean> qryAllAnnouncement() {
		String hql = "FROM AnnouncementBean";
	    Session session = null;
	    List<AnnouncementBean> list = new ArrayList<>();
	    session = factory.getCurrentSession();
	    list = session.createQuery(hql).getResultList();
	    return list;
	}

	@Override
	public AnnouncementBean qryAnnouncementById(Integer announce_id) {
		Session session = factory.getCurrentSession();
		AnnouncementBean ann = session.get(AnnouncementBean.class, announce_id);
		return ann;
	}

	@Override
	public List<AnnouncementBean> qryAnnounceByTitle(String title) {
		String hql = "FROM AnnouncementBean ann WHERE ann.announce_title = :title";
	    List<AnnouncementBean> list = new ArrayList<>();
	    Session session = factory.getCurrentSession();
	    list = session.createQuery(hql).setParameter("title", title).getResultList();
	    return list;
	}

	@Override
	public void insertAnnounce(AnnouncementBean annBean) {
		Session session = factory.getCurrentSession();
	    session.save(annBean);

	}

	@Override
	public void updateAnnounce(Integer annId, AnnouncementBean annBean) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE AnnouncementBean bb  = :annBean WHERE announce_id = :annId";
//		AnnouncementBean annUp = session.get(AnnouncementBean.class, annId);
//		if(annUp !=null) {
//			annUp.setAnnounce_title(annBean.getAnnounce_title());
//			annUp.setAnnounce_sub(annBean.getAnnounce_sub());
//		}
		int n = session.createQuery(hql)
				.setParameter("annId", annId)
				.setParameter("annBean", annBean)
				.executeUpdate();

	}

	@Override
	public void deleteAnnounce(AnnouncementBean annBean) {
		//
	}

}
