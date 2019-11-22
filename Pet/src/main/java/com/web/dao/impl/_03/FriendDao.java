package com.web.dao.impl._03;

import java.util.List;

import com.web.model._01.MemberBean;
import com.web.model._03.FriendBean;

public interface FriendDao {
	List<FriendBean>  getAll(); 
	
	void deleteByMid(String mid1,String mid2);
	
	public List<FriendBean> getByMId1(String mid1);
	
	public List<FriendBean> getByUserFrId(String mid1,String mid2);
	
	public List<FriendBean> getStatus(String mid2);
	
	public List<MemberBean> getName(String mid2);
	
	public List<MemberBean> getMemberImage(String mid2);
	
	public List<MemberBean> getByUserId(String mid);
	
	void updateUserFrById(String mid1,String mid2);
	
	void add(FriendBean friend);
}
