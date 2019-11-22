package com.web.service.impl._03;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.metamodel.SetAttribute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._03.FriendDao;
import com.web.model._01.MemberBean;
import com.web.model._03.FriendBean;
import com.web.model._03.MemberData;

@Service
public class FriendServiceImpl implements FriendService {

	FriendDao dao;
	
	@Autowired
	public void setDao(FriendDao dao) {
		this.dao = dao;
	}

	public FriendServiceImpl() {
	}
	@Transactional
	@Override
	public List<FriendBean> getAll() {
		return dao.getAll();
	}
	@Transactional
	@Override
	public void deleteByMid(String mid1,String mid2) {
		 dao.deleteByMid(mid1,mid2);
		 dao.deleteByMid(mid2,mid1);
	}
	
	@Transactional
	@Override
	public List<FriendBean> getByMId1(String mid1) {
		return dao.getByMId1(mid1);
	}
	@Transactional
	@Override
	public List<FriendBean> getByUserFrId(String mid1,String mid2) {
		return dao.getByUserFrId(mid1,mid2);
	}
	@Transactional
	@Override
	public void add(FriendBean friend) {
		friend.setStatus("application");
		dao.add(friend);
		FriendBean friend2 = new FriendBean();
		friend2.setStatus("waiting");
		friend2.setMid1(friend.getMid2());
		friend2.setMid2(friend.getMid1());
		
		dao.add(friend2);
	}
	@Transactional
	@Override
	public List<FriendBean> getStatus(String mid2) {
		return dao.getStatus(mid2);
	}
	@Transactional
	@Override
	public List<MemberData> getMemberData(String userid,List<String> mid) {
		List<MemberData> list = new ArrayList<MemberData>();
		for(int i=0;i<mid.size();i++) {
			MemberData mda = new MemberData();
			System.out.println("mid:"+mid);
			System.out.println("mid(i):"+mid.get(i));
			List<FriendBean> a1 = dao.getByUserFrId(userid, mid.get(i));
			System.out.println("state12345:"+a1.get(0).getStatus());
			List<MemberBean> a2 = dao.getByUserId(mid.get(i));
			mda.setMid(a2.get(0).getMember_Id());
			mda.setName(a2.get(0).getName());
//			mda.setImage(a2.get(0).getMemberImage());
			mda.setStatus(a1.get(0).getStatus());
			list.add(mda);
		}
		
		
		return list;
	}
	@Transactional
	@Override
	public List<MemberBean> getName(String mid2) {	
		return dao.getName(mid2);
	}
	@Transactional
	@Override
	public List<MemberBean> getMemberImage(String mid2) {
		return dao.getMemberImage(mid2);
	}
	@Transactional
	@Override
	public List<MemberBean> getByUserId(String mid) {
		return dao.getByUserId(mid);
	}
	@Transactional
	@Override
	public void updateUserFrById(String mid1, String mid2) {
		dao.updateUserFrById(mid1, mid2);
		dao.updateUserFrById(mid2, mid1);
	}

}
