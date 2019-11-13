package com.web.dao.impl._01;

import java.sql.Connection;

import com.web.model._01.AdminBean;

public interface AdminDao {

	//新增管理員
	int saveAdmin(AdminBean ad);
	//刪除管理員
	int deleteAdmin(AdminBean ad);
	//修改管理員
	int updataAdmin(AdminBean ad);
	//檢查管理員在登入時輸入的帳號與密碼是否正確
	AdminBean checkIDPassword(String userId, String password);
	//判斷管理員帳號是否重覆
	boolean idExists(String id);
	//查詢管理員
	AdminBean queryAdmin(String id);

	void setConnection(Connection con);


}