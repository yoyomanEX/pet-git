package com.web.dao.impl._01;

import java.sql.Connection;

import com.web.model._01.MemberBean;

public interface MemberDao {
	//新增會員
	int saveMember(MemberBean mb);
	//刪除會員
	int deleteMember(MemberBean mb);
	//修改會員
	int updataMember(MemberBean mb);
	//檢查會員在登入時輸入的帳號與密碼是否正確
	MemberBean checkIDPassword(String userId, String password);
	//判斷會員帳號是否重覆
	boolean idExists(String id);
	//查詢會員
	MemberBean queryMember(String id);
	
	void setConnection(Connection con);


}