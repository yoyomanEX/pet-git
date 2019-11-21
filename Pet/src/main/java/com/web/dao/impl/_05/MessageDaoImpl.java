package com.web.dao.impl._05;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.web.model._05.MessageBean;

@Repository
public class MessageDaoImpl implements MessageDao{

	SessionFactory factory;

	public void setFactory(SessionFactory factory) { 
        this.factory = factory;
	}

	@Override
	public void add(MessageBean message) {
		Session session = factory.getCurrentSession();	
		session.save(message);
	}

	@Override
	public void deleteByToUser(String toUser) {
		MessageBean MessageBean = new MessageBean();
		Session session = factory.getCurrentSession();	
		MessageBean.setToUser(toUser);
		session.delete(MessageBean);
	}


	@Override
	public void queryMessage(MessageBean message) {
		MessageBean MessageBean = new MessageBean();
		Session session = factory.getCurrentSession();	
		String hql="SELECT content from talkmessage where snedUser=:snedUser and toUser=:toUser";
		
	}


	@Override
	public List<MessageBean> getByToUser(String toUser) {
		String hql=" from MessageBean where snedUser=:snedUser and toUser=:toUser";
		List<MessageBean>list=new ArrayList<>();
		Session session = factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("toUser",toUser).getResultList();
		return list;
	}


	@Override
	public List<MessageBean> deleteByToUser(String toUser, String sendUser) {
		String hql="Delete MessageBean where snedUser=:snedUser and toUser=:toUser";
		List<MessageBean>list=new ArrayList<>();
		Session session = factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("toUser",toUser).setParameter("sendUser", sendUser).getResultList();
		return list;
	}

}
