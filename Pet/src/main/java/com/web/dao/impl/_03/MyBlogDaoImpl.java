package com.web.dao.impl._03;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._03.MyBlogBean;
@Repository
public class MyBlogDaoImpl implements MyBlogDao {

	public MyBlogDaoImpl() {
		
	}
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public void comehome(MyBlogBean Mybolgbean) {
		Session session = factory.getCurrentSession();		
		session.save(Mybolgbean);
		
	}

	@Override
	public List<String> getByUser(String userid) {
		String hql="SELECT DISTINCT mbb.otherid FROM MyBlogBean mbb WHERE mbb.userid=:userid";
		List<String>list=new ArrayList();
		Session session = factory.getCurrentSession();
		 list= session.createQuery(hql).setParameter("userid", userid).getResultList();

		return list;
	}

}
