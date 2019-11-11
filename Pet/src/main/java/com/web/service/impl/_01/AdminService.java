package com.web.service.impl._01;

import java.sql.Connection;

import com.web.model._01.AdminBean;


public interface AdminService {
	
	int saveAdmin(AdminBean ad);
	
	AdminBean checkIDPassword(String userId, String password);

	boolean idExists(String id);

	AdminBean queryAdmin(String id);

	void setConnection(Connection con);
}
