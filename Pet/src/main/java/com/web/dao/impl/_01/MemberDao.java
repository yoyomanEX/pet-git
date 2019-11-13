package com.web.dao.impl._01;

import java.sql.Connection;

import com.web.model._01.MemberBean;



public interface MemberDao {
	
	int saveMember(MemberBean mb);
	
	MemberBean checkIDPassword(String userId, String password);
	
	boolean idExists(String id);

	MemberBean queryMember(String id);
	
	void setConnection(Connection con);
	
	

}