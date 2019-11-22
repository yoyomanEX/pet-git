package com.web.dao.impl._03;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._03.NoticeBean;
@Repository
public class NoticeDaoImpl implements NoticeDao {
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public List<NoticeBean> getByUserId(String userid) {
		String hql="FROM NoticeBean WHERE userid=:userid";
		List<NoticeBean>list=new ArrayList<>();
		Session session = factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("userid", userid).getResultList();
		return list;
	}

	@Override
	public void addFriendNotice(NoticeBean Noticebean) {
		Session session = factory.getCurrentSession();		
		session.save(Noticebean);
	}

	@Override
	public void addMessageNotice(NoticeBean Noticebean) {
		Session session = factory.getCurrentSession();		
		session.save(Noticebean);
	}

	@Override
	public void deleteMeStatusByUser(String userid,Integer articleid) {
		String hql="DELETE NoticeBean WHERE userid=:userid and messagestatus='Y' and articleid=:articleid";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("articleid", articleid).setParameter("userid", userid).executeUpdate();
	}

	@Override
	public void deleteFrStarusByUser(String userid) {
		String hql="DELETE NoticeBean WHERE userid=:userid and friendstatus='Y'";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("userid", userid).executeUpdate();
		
	}



	@Override
	public List<NoticeBean> findStatusByUser(String userid) {
		String hql="FROM NoticeBean WHERE userid=:userid and (friendstatus='Y' or messagestatus='Y')";
		List<NoticeBean>list=new ArrayList<>();
		Session session = factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("userid", userid).getResultList();
		return list;
	}

}
