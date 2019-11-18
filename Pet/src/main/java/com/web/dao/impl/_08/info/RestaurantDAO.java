package com.web.dao.impl._08.info;

import java.util.List;

import com.web.model._08.info.RestaurantBean;

public interface RestaurantDAO {
	public List<RestaurantBean> qryAllRestaurant();
	public RestaurantBean qryRestaurantById(Integer resId);
	public List<RestaurantBean> qryResByName(String name);
	public void insertRestaurant(RestaurantBean resBean);
	public void updateRestaurant(RestaurantBean resBean, Integer resId);
	public void deleteRestaurant(RestaurantBean resBean);
}
