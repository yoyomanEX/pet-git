package com.web.service.impl._01;

import java.sql.Connection;
import java.util.List;

import com.web.model._01.MemberBean;

public interface MemberService {
	
	int saveMember(MemberBean mb);
	
	MemberBean checkIDPassword(String userId, String password);

	boolean idExists(String id);

	MemberBean queryMember(String id);


	
	int updataMember(MemberBean mb);



	void setConnection(Connection con);
}
