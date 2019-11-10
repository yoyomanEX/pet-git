package com.web.dao.impl._07;

import java.util.ArrayList;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.web.model._01.CompanyBean;



@Repository(value = "CompanyDaoImpl")
public class CompanyDaoImpl implements CompanyDao {
	// 建立連線
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public CompanyDaoImpl() {
		super();
	}
	// 核對廠商登入資料
		@Override
		public CompanyBean checkCompanyIdPassword(String userId, String password) {
			CompanyBean mb = null;
			Session session = factory.getCurrentSession();
			String hql = "FROM CompanyBean a WHERE a.company_id = :mid and a.company_password = :pswd and a.status = :pst";
			try {
				mb = (CompanyBean) session.createQuery(hql)
						.setParameter("mid", userId)
						.setParameter("pswd", password)
						.setParameter("pst", 1)
						.uniqueResult();
			} catch (NoResultException ex) {
				mb = null;
			}
			return mb;
		}
		
	// 廠商申請
	@Override
	public void addCompany(CompanyBean p1) {
		Session session = factory.getCurrentSession();
		session.save(p1);
	}

	// 廠商資料修改
	@Override
	public void updateCompany(CompanyBean p1, String s1) {
		Session session = factory.getCurrentSession();
		CompanyBean result = session.get(CompanyBean.class, s1);
		if (result != null) {
			result.setCompany_id(p1.getCompany_id());
			result.setCompany_name(p1.getCompany_name());
			result.setCompany_password(p1.getCompany_password());
			result.setCompany_email(p1.getCompany_email());
			result.setCompany_tel(p1.getCompany_tel());
			result.setCompany_add(p1.getCompany_add());
			result.setContact_name(p1.getContact_name());
		}
	}

	//刪除廠商資料
	@Override
	public void deleteCompany(CompanyBean p1) {
		Session session = factory.getCurrentSession();
		session.delete(p1);

	}

	//依公司編號查詢
	@Override
	public void querybyCompanyId(CompanyBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session
				.createQuery("from CompanyBean where company_id=" + p1.getCompany_id() + "order by id ASC");
		ArrayList<CompanyBean> list = (ArrayList<CompanyBean>) query.list();
		for (CompanyBean b1 : list) {
			p1.setId(b1.getId());
			p1.setCompany_id(b1.getCompany_id());
			p1.setCompany_name(b1.getCompany_name());
			p1.setCompany_password(b1.getCompany_password());
			p1.setCompany_email(b1.getCompany_email());
			p1.setCompany_tel(b1.getCompany_tel());
			p1.setCompany_add(b1.getCompany_add());
			p1.setContact_name(b1.getContact_name());
		}
	}
	//廠商統編模糊查詢
	@Override
	public ArrayList<CompanyBean> fuzzyQueryByCompanyId(CompanyBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session
				.createQuery("from CompanyBean where company_id like '%" + p1.getCompany_id() + "%' order by id ASC");
		return (ArrayList<CompanyBean>) query.list();
	}

	// 廠商名稱模糊查詢
	@Override
	public ArrayList<CompanyBean> fuzzyQueryByCompanyName(CompanyBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(
				"from CompanyBean where company_name like '%" + p1.getCompany_name() + "%' order by id ASC");
		return (ArrayList<CompanyBean>) query.list();

	}
	// (管理員用)撈出正申請中的廠商 status=0
		@Override
		public ArrayList<CompanyBean> reviewCompany() {
			Session session = factory.getCurrentSession();
			Query query = session.createQuery("from CompanyBean where status=0 order by id ASC");
			return (ArrayList<CompanyBean>) query.list();
		}

	// (管理員用)撈出已通過審核的廠商 status=1
	@Override
	public ArrayList<CompanyBean> queryAllCompany() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from CompanyBean where status=1 order by id ASC");
		return (ArrayList<CompanyBean>) query.list();
	}

	
	// (管理員用)撈出下架的廠商 status=2
		@Override
		public ArrayList<CompanyBean> obtainedCompany() {
			Session session = factory.getCurrentSession();
			Query query = session.createQuery("from CompanyBean where status=2 order by id ASC");
			return (ArrayList<CompanyBean>) query.list();
		}
	

	// 拒絕廠商申請(狀態改9)
	@Override
	public void rejectByCompanyId(CompanyBean p1) {
		Session session = factory.getCurrentSession();
		String hql = "update CompanyBean a set a.status=9 WHERE a.company_id ="+p1.getCompany_id();
		Query query = session.createQuery(hql);
		query.executeUpdate();
	}
	// 接受廠商申請/廠商重新上架(狀態為上架:1)
		@Override
		public void acceptByCompanyId(CompanyBean p1) {
			Session session = factory.getCurrentSession();
			String hql = "update CompanyBean a set a.status=1 WHERE a.company_id ="+p1.getCompany_id();
			Query query = session.createQuery(hql);
			query.executeUpdate();
	}
	//下架廠商(狀態下架:2)
	@Override
	public void obtainedByCompanyId(CompanyBean p1) {
		Session session = factory.getCurrentSession();
		String hql = "update CompanyBean a set a.status=2 WHERE a.company_id ="+p1.getCompany_id();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		
	}

}
