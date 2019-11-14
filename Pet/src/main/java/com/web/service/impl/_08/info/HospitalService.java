package com.web.service.impl._08.info;

import java.util.List;

import com.web.model._08.info.HospitalBean;

public interface HospitalService {
	public List<HospitalBean> qryAllHospital();
	public HospitalBean qryHospitalById(Integer hosId);
	public List<HospitalBean> qryHosByName(String name);
	public void insertHospital(HospitalBean hosBean);
	public void updateHospital(HospitalBean hosBean, Integer hosId);
	public void deleteHospital(HospitalBean hosBean);
}
