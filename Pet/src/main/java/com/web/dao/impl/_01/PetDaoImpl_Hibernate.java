package com.web.dao.impl._01;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._01.MemberBean;
import com.web.model._01.PetBean;
@Repository
public class PetDaoImpl_Hibernate implements PetDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	@Override
	public int savePet(PetBean pb) {
		int n = 0;
		getSession().save(pb);
		n++;
		return n;
	}

	@Override
	public int deletePet(PetBean pb) {
		int n = 0;
		getSession().delete(pb);
		n++;
		return n;
	}

	@Override
	public List<PetBean> queryAllPet(MemberBean mb) {
		String id = mb.getMember_Id();
		List<PetBean> list1=null;
		String hql = "FROM PetBean p WHERE p.member_id = :mid";
		try {
			list1=getSession().createQuery(hql).setParameter("mid", id).getResultList();
		} catch (NoResultException ex) {
			list1 = null;
		}
		return list1;
	}

	@Override
	public int updataPet(PetBean pb) {
		int n = 0;
		getSession().update(pb);
		n++;
		return n;
	}

}
