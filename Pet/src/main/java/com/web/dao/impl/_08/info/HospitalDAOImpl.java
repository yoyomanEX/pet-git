package com.web.dao.impl._08.info;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._08.info.HospitalBean;

@Repository
public class HospitalDAOImpl implements HospitalDAO {
	
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

//	private Session getSession() {
//		return factory.getCurrentSession();
//	}
	
	@Override
	public List<HospitalBean> qryAllHospital() {
		Session session = factory.getCurrentSession();
		String hql = "FROM HospitalBean";
		List<HospitalBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public HospitalBean qryHospitalById(Integer hosId) {
		Session session = factory.getCurrentSession();
		HospitalBean hosBean = session.get(HospitalBean.class, hosId);
		return hosBean;
	}

	@Override
	public List<HospitalBean> qryHosByName(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM HospitalBean WHERE hospital_name=:name";
		HospitalBean hosBean = null;
		List<HospitalBean> list = session.createQuery(hql).setParameter("name", name).getResultList();
		if (!list.isEmpty()) 
			hosBean = list.get(0);
		return list;
		
	}

	@Override
	public void insertHospital(HospitalBean hosBean) {
		Session session = factory.getCurrentSession();
		session.save(hosBean);

	}

	@Override
	public void updateHospital(HospitalBean hosBean, Integer hosId) {
		Session session = factory.getCurrentSession();
		HospitalBean hosUp = session.get(HospitalBean.class, hosId);
		if(hosUp !=null) {
			hosUp.setHospital_name(hosBean.getHospital_name());
			hosUp.setHospital_address(hosBean.getHospital_address());
			hosUp.setHospital_tel(hosBean.getHospital_tel());
		}
//		session.update(hosBean);

	}
	@Override
	public void deleteHospital(HospitalBean hosBean) {
		Session session = factory.getCurrentSession();
		session.delete(hosBean);

	}
	

}
