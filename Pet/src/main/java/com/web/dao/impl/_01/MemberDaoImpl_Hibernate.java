package com.web.dao.impl._01;

import java.sql.Connection;

import javax.persistence.NoResultException;

import org.hibernate.NonUniqueResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._01.MemberBean;

// 本類別使用為標準的JDBC技術來存取資料庫。
@Repository
public class MemberDaoImpl_Hibernate implements MemberDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	public MemberDaoImpl_Hibernate() {
		// this.factory = HibernateUtils.getSessionFactory();
	}

	// 儲存MemberBean物件，將參數mb新增到Member表格內。
	@Override
	public int saveMember(MemberBean mb) {
		int n = 0;
		getSession().save(mb);
		n++;
		return n;
	}

	// 判斷參數id(會員帳號)是否已經被現有客戶使用，如果是，傳回true，表示此id不能使用，
	// 否則傳回false，表示此id可使用。
	@Override
	public boolean idExists(String id) {
		boolean exist = false;
		String hql = "FROM MemberBean m WHERE m.memberId = :mid";
		try {
			MemberBean mb = (MemberBean) getSession().createQuery(hql).setParameter("mid", id).uniqueResult();
			if (mb != null) {
				exist = true;
			}
		} catch (NoResultException ex) {
			exist = false;
		} catch (NonUniqueResultException ex) {
			exist = true;
		}
		return exist;
	}

	// 由參數 id (會員帳號) 到Member表格中 取得某個會員的所有資料，傳回值為一個MemberBean物件，
	// 如果找不到對應的會員資料，傳回值為null。
	@Override
	public MemberBean queryMember(String id) {
		MemberBean mb = null;
		String hql = "FROM MemberBean m WHERE m.memberId = :mid";
		try {
			mb = (MemberBean) getSession().createQuery(hql).setParameter("mid", id).uniqueResult();
		} catch (NoResultException ex) {
			mb = null;
		}
		return mb;
	}

	// 檢查使用者在登入時輸入的帳號與密碼是否正確。如果正確，傳回該帳號所對應的MemberBean物件，
	// 否則傳回 null。
	@Override
	public MemberBean checkIDPassword(String userId, String password) {
		System.out.println("1");
		MemberBean mb = null;
		String hql = "FROM MemberBean m WHERE m.member_Id = :mid and m.password = :pswd";
		System.out.println("hql:"+hql);
		try {
			System.out.println("2");
			mb = (MemberBean) getSession().createQuery(hql).setParameter("mid", userId).setParameter("pswd", password)
					.uniqueResult();
			System.out.println("3");
			System.out.println("mb:"+mb);
		} catch (NoResultException ex) {
			mb = null;
		}
		return mb;
	}

	@Override
	public void setConnection(Connection conn) {
		throw new RuntimeException("不支援setConnection(Connection con)方法...");
	}
}
