package com.web.service.impl._01;

import java.sql.Connection;

import com.web.model._01.CompanyBean;

public interface CompanyService {
	int saveCompany(CompanyBean cb);

	CompanyBean checkIDPassword(String userId, String password);

	boolean idExists(String id);

	CompanyBean queryCompany(String id);
	
	int updataCompany(CompanyBean cb);

	void setConnection(Connection con);
}
