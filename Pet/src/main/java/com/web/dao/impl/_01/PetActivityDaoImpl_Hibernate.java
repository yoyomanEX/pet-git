package com.web.dao.impl._01;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._01.ActivityPeopleBean;
import com.web.model._01.AdminBean;
import com.web.model._01.PetActivityBean;
@Repository
public class PetActivityDaoImpl_Hibernate implements PetActivityDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}
	

	@Override
	public int savePetActivity(PetActivityBean pab) {
		int n = 0;
		getSession().save(pab);
		n++;
		return n;
	}

	@Override
	public List<PetActivityBean> queryAdminPetActivity(AdminBean ab) {
		String id = ab.getAdmin_Id();
		List<PetActivityBean> list1=null;
		String hql = "FROM PetActivityBean p WHERE p.admin_Id = :mid";
		try {
			list1=getSession().createQuery(hql).setParameter("mid", id).getResultList();
		} catch (NoResultException ex) {
			list1 = null;
		}
		return list1;
	}

	@Override
	public List<PetActivityBean> queryAllPetActivity() {
		List<PetActivityBean> list1=null;
		String hql = "FROM PetActivityBean";
		try {
			list1=getSession().createQuery(hql).getResultList();
		} catch (NoResultException ex) {
			list1 = null;
		}
		return list1;
	}

	@Override
	public int deletePetActivity(PetActivityBean pab) {
		int n = 0;
		getSession().delete(pab);
		n++;
		return n;
	}

	@Override
	public int updataActivity(PetActivityBean pab) {
		int n = 0;
		getSession().update(pab);
		n++;
		return n;
	}

	@Override
	public List<PetActivityBean> queryMemberPetActivity(List<ActivityPeopleBean> list) {
		List<PetActivityBean> list1=null;
		for(ActivityPeopleBean activityPeopleBean:list) {
			PetActivityBean pab=null;
			Integer id = activityPeopleBean.getActivity_id();
			String hql = "FROM PetActivityBean p WHERE p.activity_id = :aid";
			pab=(PetActivityBean) getSession().createQuery(hql).setParameter("aid", id).uniqueResult();
			list1.add(pab);
		}
		return list1;
	}

}
