package com.web.dao.impl._01;

import java.sql.Connection;

import com.web.model._01.CompanyBean;

public interface CompanyDao {
	int saveCompany(CompanyBean cb);

	CompanyBean checkIDPassword(String userId, String password);

	boolean idExists(String id);

	CompanyBean queryCompany(String id);

	void setConnection(Connection con);
}
