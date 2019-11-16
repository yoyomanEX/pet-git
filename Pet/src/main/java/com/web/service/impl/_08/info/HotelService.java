package com.web.service.impl._08.info;

import java.util.List;

import com.web.model._08.info.HotelBean;

public interface HotelService {
	public List<HotelBean> qryAllHotel();
	public HotelBean qryHotelById(Integer hotId) ;
	public List<HotelBean> qryHotelByName(String name);
	public void insertHotel(HotelBean hotBean);
	public void updateHotel(HotelBean hotBean, Integer hotId);
	public void deleteHotel(HotelBean hotBean);
}
