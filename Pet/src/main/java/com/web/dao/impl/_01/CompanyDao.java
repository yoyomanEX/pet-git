package com.web.dao.impl._01;

import java.sql.Connection;

import com.web.model._01.CompanyBean;

public interface CompanyDao {
	//新增廠商
	int saveCompany(CompanyBean cb);
	//刪除廠商
	int deleteCompany(CompanyBean cb);
	//修改廠商
	int updataCompany(CompanyBean cb);
	//檢查廠商在登入時輸入的帳號與密碼是否正確
	CompanyBean checkIDPassword(String userId, String password);
	//判斷廠商帳號是否重覆
	boolean idExists(String id);
	//查詢廠商
	CompanyBean queryCompany(String id);

	void setConnection(Connection con);
	
}
