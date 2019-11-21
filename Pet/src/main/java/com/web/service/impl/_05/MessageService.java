package com.web.service.impl._05;

import java.util.List;

import com.web.dao.impl._05.MessageDao;
import com.web.model._05.MessageBean;

public interface MessageService {
	void add(String message);
	void deleteByToUser(String toUser);
	public List<MessageBean> getByToUser(String toUser);
	public List<MessageBean> deleteByToUser(String toUser, String sendUser);
	void setMdao(MessageDao mdao);
}
