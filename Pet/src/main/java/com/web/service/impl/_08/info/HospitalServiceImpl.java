package com.web.service.impl._08.info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._08.info.HospitalDAO;
import com.web.model._08.info.HospitalBean;

@Service
@EnableTransactionManagement
public class HospitalServiceImpl implements HospitalService {
	
	@Autowired
	HospitalDAO hospitalDAO;
	
	@Transactional
	@Override
	public List<HospitalBean> qryAllHospital() {
		return hospitalDAO.qryAllHospital();
	}
	@Transactional
	@Override
	public HospitalBean qryHospitalById(Integer hosId) {
		return hospitalDAO.qryHospitalById(hosId);
	}
	@Transactional
	@Override
	public List<HospitalBean> qryHosByName(String name) {
		return hospitalDAO.qryHosByName(name);
	}
	@Transactional
	@Override
	public void insertHospital(HospitalBean hosBean) {
		hospitalDAO.insertHospital(hosBean);
	}
	@Transactional
	@Override
	public void updateHospital(HospitalBean hosBean, Integer hosId) {
		hospitalDAO.updateHospital(hosBean, hosId);
	}
	@Transactional
	@Override
	public void deleteHospital(HospitalBean hosBean) {
		hospitalDAO.deleteHospital(hosBean);
	}

}
