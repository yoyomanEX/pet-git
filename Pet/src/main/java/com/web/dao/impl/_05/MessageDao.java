package com.web.dao.impl._05;

import java.util.List;

import com.web.model._05.MessageBean;

public interface MessageDao {
	void add(MessageBean message);
	void deleteByToUser(String toUser);
	void queryMessage(MessageBean message);
	public List<MessageBean> getByToUser(String toUser);
	public List<MessageBean> deleteByToUser(String toUser, String sendUser);
}
