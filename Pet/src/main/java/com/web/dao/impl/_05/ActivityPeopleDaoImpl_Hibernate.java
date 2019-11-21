package com.web.dao.impl._05;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._05.ActivityPeopleBean;


@Repository
public class ActivityPeopleDaoImpl_Hibernate implements ActivityPeopleDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	@Override
	public int saveActivityPeople(ActivityPeopleBean apb) {
		int n = 0;
		getSession().save(apb);
		n++;
		return n;
	}

	@Override
	public int deleteActivityPeople(ActivityPeopleBean apb) {
		int n = 0;
		getSession().delete(apb);
		n++;
		return n;
	}

	@Override
	public List<ActivityPeopleBean> queryMemberActivity(String id) {
		String hql = "FROM ActivityPeopleBean a WHERE a.member_id = :mid";
		List<ActivityPeopleBean> list= getSession().createQuery(hql).setParameter("mid", id).getResultList();
		return list;
	}

	@Override
	public List<ActivityPeopleBean> queryActivityPeople(Integer id) {
		String hql = "FROM ActivityPeopleBean a WHERE a.activity_id = :aid";
		List<ActivityPeopleBean> list= getSession().createQuery(hql).setParameter("aid", id).getResultList();
		return list;
	}

}
