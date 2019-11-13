package com.web.dao.impl._01;

import java.sql.Connection;

import javax.persistence.NoResultException;

import org.hibernate.NonUniqueResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._01.CompanyBean;

@Repository
public class CompanyDaoImpl_Hibernate implements CompanyDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	public CompanyDaoImpl_Hibernate() {
		
	}

	@Override
	public int saveCompany(CompanyBean cb) {


		int n = 0;
		cb.setStatus(0);

		getSession().save(cb);
		n++;
		return n;
	}

	@Override
	public CompanyBean checkIDPassword(String userId, String password) {
		System.out.println("1");
		CompanyBean cb = null;
		String hql = "FROM CompanyBean c WHERE c.company_id = :cid and c.company_password = :pswd";

		System.out.println("hql:"+hql);
		try {
			System.out.println("2");
			cb = (CompanyBean) getSession().createQuery(hql).setParameter("cid", userId).setParameter("pswd", password)
					.uniqueResult();
			System.out.println("3");
			System.out.println("mb:"+cb);
		} catch (NoResultException ex) {
			cb = null;
		}
		return cb;
	}

	@Override
	public boolean idExists(String id) {
		boolean exist = false;
		String hql = "FROM CompanyBean c WHERE c.company_id = :cid";
		try {
			CompanyBean cb = (CompanyBean) getSession().createQuery(hql).setParameter("cid", id).uniqueResult();
			if (cb != null) {
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
	public CompanyBean queryCompany(String id) {
		CompanyBean cb = null;
		String hql = "FROM CompanyBean c WHERE c.company_id = :cid";
		try {
			cb = (CompanyBean) getSession().createQuery(hql).setParameter("cid", id).uniqueResult();
		} catch (NoResultException ex) {
			cb = null;
		}
		return cb;
	}

	@Override
	public void setConnection(Connection con) {
		throw new RuntimeException("不支援setConnection(Connection con)方法...");
		
	}

	@Override
	public int deleteCompany(CompanyBean cb) {
		int n = 0;
		getSession().delete(cb);
		n++;
		return n;
	}

	@Override
	public int updataCompany(CompanyBean cb) {
		int n = 0;
		getSession().update(cb);
		n++;
		return n;

	}

}
