package com.web.dao.impl._07;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._01.AdminBean;


@Repository(value = "AdminDaoImpl")
public class AdminDaoImpl implements AdminDao {
	// 建立連線
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public AdminDaoImpl() {
		super();
	}

	@Override
	public AdminBean checkAdminIdPassword(String userId, String password) {
		AdminBean mb = null;	
		Session session = factory.getCurrentSession();
		String hql = "FROM AdminBean a WHERE a.admin_id = :mid and a.admin_password = :pswd";
		try {
			mb = (AdminBean) session.createQuery(hql)
					.setParameter("mid", userId)
					.setParameter("pswd", password)
					.uniqueResult();
		} catch (NoResultException ex) {
			mb = null;
		}
		return mb;
	}

}
