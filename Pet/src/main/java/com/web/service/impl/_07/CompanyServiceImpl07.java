package com.web.service.impl._07;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._07.CompanyDaoImpl;
import com.web.model._01.CompanyBean;

@Service
public class CompanyServiceImpl07 implements CompanyService07 {
	@Autowired
	CompanyDaoImpl eDao;

	@Override
	@Transactional
	public ArrayList<CompanyBean> queryAllCompany() {
		return eDao.queryAllCompany();

	}

	@Override
	@Transactional
	public CompanyBean checkCompanyIdPassword(String userId, String password) {
		return eDao.checkCompanyIdPassword(userId, password);

	}

	@Override
	@Transactional
	public void addCompany(CompanyBean p1) {
		eDao.addCompany(p1);
	}

	@Override
	@Transactional
	public ArrayList<CompanyBean> reviewCompany() {
		return eDao.reviewCompany();
	}

	@Override
	@Transactional
	public void rejectByCompanyId(CompanyBean p1) {
		eDao.rejectByCompanyId(p1);
	}

	@Override
	@Transactional
	public void acceptByCompanyId(CompanyBean p1) {
		eDao.acceptByCompanyId(p1);
	}

	@Override
	@Transactional
	public ArrayList<CompanyBean> obtainedCompany() {
		return eDao.obtainedCompany();

	}

	@Override
	@Transactional
	public void obtainedByCompanyId(CompanyBean p1) {
		eDao.obtainedByCompanyId(p1);
	}

	@Override
	@Transactional
	public ArrayList<CompanyBean> rejectCompany() {
		return eDao.rejectCompany();
	}

}
