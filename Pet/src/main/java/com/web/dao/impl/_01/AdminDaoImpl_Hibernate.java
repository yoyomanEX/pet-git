package com.web.dao.impl._01;

import java.sql.Connection;

import javax.persistence.NoResultException;

import org.hibernate.NonUniqueResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._01.AdminBean;


@Repository
public class AdminDaoImpl_Hibernate implements AdminDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	public AdminDaoImpl_Hibernate() {
		// this.factory = HibernateUtils.getSessionFactory();
	}

	@Override
	public int saveAdmin(AdminBean ad) {
		int n = 0;
		getSession().save(ad);
		n++;
		return n;
	}

	@Override
	public AdminBean checkIDPassword(String userId, String password) {
		System.out.println("1");
		AdminBean ad = null;
		String hql = "FROM AdminBean a WHERE a.admin_Id = :aid and a.password = :pswd";
		System.out.println("hql:"+hql);
		try {
			System.out.println("2");
			ad = (AdminBean) getSession().createQuery(hql).setParameter("aid", userId).setParameter("pswd", password)
					.uniqueResult();
			System.out.println("3");
			System.out.println("ad"+ad);
		} catch (NoResultException ex) {
			ad = null;
		}
		return ad;
	}

	@Override
	public boolean idExists(String id) {
		boolean exist = false;
		String hql = "FROM AdminBean a WHERE a.admin_Id = :aid";
		try {
			AdminBean ad = (AdminBean) getSession().createQuery(hql).setParameter("aid", id).uniqueResult();
			if (ad != null) {
				exist = true;
			}
		} catch (NoResultException ex) {
			exist = false;
		} catch (NonUniqueResultException ex) {
			exist = true;
		}
		return exist;
	}

	@Override
	public AdminBean queryAdmin(String id) {
		AdminBean ad = null;
		String hql = "FROM AdminBean a WHERE a.admin_Id = :aid";
		try {
			ad = (AdminBean) getSession().createQuery(hql).setParameter("aid", id).uniqueResult();
		} catch (NoResultException ex) {
			ad = null;
		}
		return ad;
	}

	@Override
	public void setConnection(Connection con) {
		throw new RuntimeException("不支援setConnection(Connection con)方法...");
		
	}

	@Override
	public int deleteAdmin(AdminBean ad) {
		int n = 0;
		getSession().delete(ad);
		n++;
		return n;
	}

	@Override
	public int updataAdmin(AdminBean ad) {
		int n = 0;
		getSession().update(ad);
		n++;
		return n;
	}

	
}
