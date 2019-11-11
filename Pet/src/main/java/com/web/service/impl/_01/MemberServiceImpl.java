package com.web.service.impl._01;

import java.sql.Connection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._01.MemberDao;
import com.web.model._01.MemberBean;



@Service
@Transactional
@EnableTransactionManagement
public class MemberServiceImpl implements MemberService {
    
	@Autowired
	MemberDao memberDao;
	
	@Override
	public int saveMember(MemberBean mb) {
		return memberDao.saveMember(mb);
	}
	
	@Override
	public MemberBean checkIDPassword(String userId, String password) {
		return memberDao.checkIDPassword(userId, password);
	}

	@Override
	public boolean idExists(String id) {
		return memberDao.idExists(id);
	}

	@Override
	public MemberBean queryMember(String id) {
		return memberDao.queryMember(id);
	}

	@Override
	public void setConnection(Connection con) {
		
	}
	

}
