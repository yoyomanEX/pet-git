package com.web.service.impl._07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._07.AdminDaoImpl;
import com.web.model._01.AdminBean;

@Service
public class AdminService {
	@Autowired
	AdminDaoImpl eDao;
	
	@Transactional
	public AdminBean checkAdminIdPassword(String userId, String password) {
		return eDao.checkAdminIdPassword(userId, password);
		
	}
}
