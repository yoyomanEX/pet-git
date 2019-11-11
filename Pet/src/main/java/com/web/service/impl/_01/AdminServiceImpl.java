package com.web.service.impl._01;

import java.sql.Connection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._01.AdminDao;
import com.web.model._01.AdminBean;



@Service
@Transactional
@EnableTransactionManagement
public class AdminServiceImpl implements AdminService {
    
	@Autowired
	AdminDao adminDao;

	@Override
	public int saveAdmin(AdminBean ad) {
		// TODO Auto-generated method stub
		return adminDao.saveAdmin(ad);
	}

	@Override
	public AdminBean checkIDPassword(String userId, String password) {
		// TODO Auto-generated method stub
		return adminDao.checkIDPassword(userId, password);
	}

	@Override
	public boolean idExists(String id) {
		// TODO Auto-generated method stub
		return adminDao.idExists(id);
	}

	@Override
	public AdminBean queryAdmin(String id) {
		// TODO Auto-generated method stub
		return adminDao.queryAdmin(id);
	}

	@Override
	public void setConnection(Connection con) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public int updataAdmin(AdminBean ad) {
		// TODO Auto-generated method stub
		return adminDao.updataAdmin(ad);
	}

	
	
	

}
