package com.web.dao.impl._01;

import java.sql.Connection;

import com.web.model._01.AdminBean;

public interface AdminDao {
	
	int saveAdmin(AdminBean ad);
	
	AdminBean checkIDPassword(String userId, String password);
	
	boolean idExists(String id);

	AdminBean queryAdmin(String id);
	
	void setConnection(Connection con);
	
	

}