package com.web.dao.impl._08.info;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._08.info.HotelBean;

@Repository
public class HotelDAOImpl implements HotelDAO {
	
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	public List<HotelBean> qryAllHotel() {
		Session session = factory.getCurrentSession();
		String hql = "FROM HotelBean";
		List<HotelBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public HotelBean qryHotelById(Integer hotId) {
		Session session = factory.getCurrentSession();
		HotelBean hotel = session.get(HotelBean.class, hotId);
		return hotel;
	}

	@Override
	public List<HotelBean> qryHotelByName(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM HotelBean WHERE hotel_name =:name";
		HotelBean hotel = null;
		List<HotelBean> list = session.createQuery(hql).setParameter("name", name).getResultList();
		if (!list.isEmpty()) 
			hotel = list.get(0);
		return list;
	}

	@Override
	public void insertHotel(HotelBean hotBean) {
		Session session = factory.getCurrentSession();
		session.save(hotBean);

	}

	@Override
	public void updateHotel(HotelBean hotBean, Integer hotId) {
		Session session = factory.getCurrentSession();
		HotelBean hotUp = session.get(HotelBean.class, hotId);
		if(hotUp !=null) {
			hotUp.setHotel_name(hotBean.getHotel_name());
			hotUp.setHotel_address(hotBean.getHotel_address());
			hotUp.setHotel_tel(hotBean.getHotel_tel());
		}
//		session.update(hotBean);

	}
	

	@Override
	public void deleteHotel(HotelBean hotBean) {
		Session session = factory.getCurrentSession();
		session.delete(hotBean);

	}

}
