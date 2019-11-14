package com.web.dao.impl._03;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._01.MemberBean;
import com.web.model._03.FriendBean;
import com.web.model._03.MemberData;
@Repository
public class FriendDaoImpl implements FriendDao {
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	

	@Override
	public List<FriendBean> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteByMid(String mid1,String mid2) {
		String hql="Delete FriendBean WHERE mid1=:mid1 and mid2 = :mid2";
		Session session = factory.getCurrentSession();
		
		session.createQuery(hql)
				.setParameter("mid2", mid2).setParameter("mid1", mid1).executeUpdate();
		
	}
	

	@Override
	public List<FriendBean> getByMId1(String mid1) {
		String hql="FROM FriendBean WHERE mid1=:mid1";
		List<FriendBean>list=new ArrayList<>();
		Session session = factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("mid1", mid1).getResultList();
		return list;
	}
	

	@Override
	public List<FriendBean> getByUserFrId(String mid1,String mid2) {
		String hql="FROM FriendBean WHERE mid1=:mid1 and mid2=:mid2";
		List<FriendBean>list=new ArrayList<>();
		Session session = factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("mid1", mid1).setParameter("mid2", mid2).getResultList();
		return list;
	}

	@Override
	public void add(FriendBean friend) {
		Session session = factory.getCurrentSession();		
		session.save(friend);
	}


	@Override
	public List<FriendBean> getStatus(String mid2) {
		String hql="SELECT fb.status FROM FriendBean fb WHERE mid2=:mid2";
		List<FriendBean>list=new ArrayList<>();
		Session session = factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("mid2", mid2).getResultList();
		return list;
	}


	@Override
	public List<MemberBean> getName(String mid2) {
		String hql="SELECT mb.name FROM MemberBean mb WHERE member_id=:member_id";
		List<MemberBean>list=new ArrayList<>();
		Session session = factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("member_id", mid2).getResultList();
		return list;
	}


	@Override
	public List<MemberBean> getMemberImage(String mid2) {
		String hql="SELECT mb.memberImage FROM MemberBean mb WHERE member_id=:member_id";
		List<MemberBean>list=new ArrayList<>();
		Session session = factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("member_id", mid2).getResultList();
		return list;
	}


	@Override
	public List<MemberBean> getByUserId(String mid) {
		String hql="FROM MemberBean WHERE member_id=:member_id";
		List<MemberBean>list=new ArrayList<>();
		Session session = factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("member_id", mid).getResultList();
		return list;
	}


	@Override
	public void updateUserFrById(String mid1, String mid2) {
		String hql="Update FriendBean b SET b.status='allow' WHERE mid1=:mid1 and mid2 = :mid2";
		Session session = factory.getCurrentSession();
		session.createQuery(hql)
				.setParameter("mid1", mid1).setParameter("mid2", mid2).executeUpdate();
	}



}
