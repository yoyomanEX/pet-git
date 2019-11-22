package com.web.service.impl._03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._03.NoticeDao;
import com.web.model._03.NoticeBean;
@Service
public class NoticeServiceImpl implements NoticeService {
	NoticeDao dao;
	
	@Autowired
	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}
	public NoticeServiceImpl() {
	}
	@Transactional
	@Override
	public List<NoticeBean> getByUserId(String userid) {
		return dao.getByUserId(userid);
	}
	@Transactional
	@Override
	public void addFriendNotice(NoticeBean Noticebean) {
		Noticebean.setFriendstatus("Y");
		dao.addFriendNotice(Noticebean);
	}
	@Transactional
	@Override
	public void addMessageNotice(NoticeBean Noticebean) {
		Noticebean.setMessagestatus("Y");
		dao.addMessageNotice(Noticebean);
	}
	@Transactional
	@Override
	public List<NoticeBean> findStatusByUser(String userid) {
		return dao.findStatusByUser(userid);
	}
	@Transactional
	@Override
	public void deleteMeStatusByUser(String userid,Integer articleid) {
		dao.deleteMeStatusByUser(userid,articleid);
	}
	@Transactional
	@Override
	public void deleteFrStarusByUser(String userid) {
		dao.deleteFrStarusByUser(userid);
	}

}
