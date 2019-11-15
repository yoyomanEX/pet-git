package com.web.dao.impl._08.info;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._08.info.RestaurantBean;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO {

	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	public List<RestaurantBean> qryAllRestaurant() {
		Session session = factory.getCurrentSession();
		String hql = "FROM RestaurantBean";
		List<RestaurantBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public RestaurantBean qryRestaurantById(Integer resId) {
		Session session = factory.getCurrentSession();
		RestaurantBean resBean = session.get(RestaurantBean.class, resId);
		return resBean;
	}

	@Override
	public List<RestaurantBean> qryResByName(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM RestaurantBean WHERE restaurant_name =:name";
		RestaurantBean resBean = null;
		List<RestaurantBean> list = session.createQuery(hql).setParameter("name", name).getResultList();
		if (!list.isEmpty()) 
			resBean = list.get(0);
		return list;
	}

	@Override
	public void insertRestaurant(RestaurantBean resBean) {
		Session session = factory.getCurrentSession();
		session.save(resBean);

	}

	@Override
	public void updateRestaurant(RestaurantBean resBean, Integer resId) {
		Session session = factory.getCurrentSession();
		RestaurantBean resUp = session.get(RestaurantBean.class, resId);
		if(resUp !=null) {
			resUp.setRestaurant_name(resBean.getRestaurant_name());
			resUp.setRestaurant_address(resBean.getRestaurant_address());
			resUp.setRestaurant_tel(resBean.getRestaurant_tel());
		}
//		session.update(resBean);
	}

	@Override
	public void deleteRestaurant(RestaurantBean resBean) {
		Session session = factory.getCurrentSession();
		session.delete(resBean);

	}

}
