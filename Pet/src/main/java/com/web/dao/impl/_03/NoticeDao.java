package com.web.dao.impl._03;

import java.util.List;

import com.web.model._03.NoticeBean;

public interface NoticeDao {
	public List<NoticeBean> getByUserId(String userid);
	void addFriendNotice(NoticeBean Noticebean);
	void addMessageNotice(NoticeBean Noticebean);
	public List<NoticeBean> findStatusByUser(String userid);
	void deleteMeStatusByUser(String userid,Integer articleid);
	void deleteFrStarusByUser(String userid);
}
