package com.web.service.impl._08.info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._08.info.HotelDAO;
import com.web.model._08.info.HotelBean;

@Service
@EnableTransactionManagement
public class HotelServiceImpl implements HotelService {
	
	@Autowired
	HotelDAO hotelDAO;
	
	@Transactional
	@Override
	public List<HotelBean> qryAllHotel() {
		return hotelDAO.qryAllHotel();
	}
	
	@Transactional
	@Override
	public HotelBean qryHotelById(Integer hotId) {
		return hotelDAO.qryHotelById(hotId);
	}
	@Transactional
	@Override
	public List<HotelBean> qryHotelByName(String name) {
		return hotelDAO.qryHotelByName(name);
	}
	@Transactional
	@Override
	public void insertHotel(HotelBean hotBean) {
		hotelDAO.insertHotel(hotBean);

	}
	@Transactional
	@Override
	public void updateHotel(HotelBean hotBean, Integer hotId) {
		hotelDAO.updateHotel(hotBean, hotId);

	}
	@Transactional
	@Override
	public void deleteHotel(HotelBean hotBean) {
		hotelDAO.deleteHotel(hotBean);
	}

}
