package com.web.service.impl._01;

import java.sql.Connection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._01.CompanyDao;
import com.web.model._01.CompanyBean;
@Service
@Transactional
@EnableTransactionManagement
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	CompanyDao companyDao;
	
	@Override
	public int saveCompany(CompanyBean cb) {
		// TODO Auto-generated method stub
		return companyDao.saveCompany(cb);
	}

	@Override
	public CompanyBean checkIDPassword(String userId, String password) {
		// TODO Auto-generated method stub
		return companyDao.checkIDPassword(userId, password);
	}

	@Override
	public boolean idExists(String id) {
		// TODO Auto-generated method stub
		return companyDao.idExists(id);
	}

	@Override
	public CompanyBean queryCompany(String id) {
		// TODO Auto-generated method stub
		return companyDao.queryCompany(id);
	}

	@Override
	public void setConnection(Connection con) {
		
	}

}
