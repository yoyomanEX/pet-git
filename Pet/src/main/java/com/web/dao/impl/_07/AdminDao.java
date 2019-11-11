package com.web.dao.impl._07;

import com.web.model._01.AdminBean;

public interface AdminDao {
	
	public AdminBean checkAdminIdPassword(String userId, String password);
}
