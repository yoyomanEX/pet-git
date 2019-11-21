package com.web.service.impl._05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.web.dao.impl._05.MessageDao;
import com.web.model._05.MessageBean;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDao mdao;
//	MessageBean mBean;
//	
//	@Autowired
//	public void setmBean(MessageBean mBean) {
//		this.mBean = mBean;
//	}

	public MessageServiceImpl() {
	}

	
	public void setMdao(MessageDao mdao) {
		this.mdao = mdao;
	}
	
	@Transactional
	@Override
	public void add(String message) {
		JsonParser jsonParser = new JsonParser();
		// 將json字符串轉化成json對象
		// 運用取出來的toName、content、sendName
		
		
		JsonObject jsonObject = jsonParser.parse(message).getAsJsonObject();
		String content = jsonObject.get("content").getAsString();
		String toName = jsonObject.get("toName").getAsString();
		String snedName = jsonObject.get("sendName").getAsString();
		MessageBean mBean = new MessageBean();
		mBean.setContent(content);
		mBean.setSendUser(snedName);
		mBean.setToUser(toName);
		mdao.add(mBean);

	}

	@Transactional
	@Override
	public void deleteByToUser(String toUser) {
		mdao.deleteByToUser(toUser);

	}
	@Transactional
	@Override
	public List<MessageBean> getByToUser(String toUser) {
		
		return mdao.getByToUser(toUser);
	}
	
	@Transactional
	@Override
	public List<MessageBean> deleteByToUser(String toUser, String sendUser) {
		
		return mdao.deleteByToUser(toUser, sendUser);
	}

}
