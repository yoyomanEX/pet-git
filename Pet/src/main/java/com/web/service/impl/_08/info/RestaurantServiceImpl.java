package com.web.service.impl._08.info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._08.info.RestaurantDAO;
import com.web.model._08.info.RestaurantBean;

@Service
@EnableTransactionManagement
public class RestaurantServiceImpl implements RestaurantService {
	
	@Autowired
	RestaurantDAO restaurantDAO;
	@Transactional
	@Override
	public List<RestaurantBean> qryAllRestaurant() {
		return restaurantDAO.qryAllRestaurant();
	}
	@Transactional
	@Override
	public RestaurantBean qryRestaurantById(Integer resId) {
		return restaurantDAO.qryRestaurantById(resId);
	}
	@Transactional
	@Override
	public List<RestaurantBean> qryResByName(String name) {
		return restaurantDAO.qryResByName(name);
	}
	@Transactional
	@Override
	public void insertRestaurant(RestaurantBean resBean) {
		restaurantDAO.insertRestaurant(resBean);

	}
	@Transactional
	@Override
	public void updateRestaurant(RestaurantBean resBean, Integer resId) {
		restaurantDAO.updateRestaurant(resBean, resId);

	}
	@Transactional
	@Override
	public void deleteRestaurant(RestaurantBean resBean) {
		restaurantDAO.deleteRestaurant(resBean);

	}

}
