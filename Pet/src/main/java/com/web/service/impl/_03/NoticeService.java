package com.web.service.impl._03;

import java.util.List;

import com.web.model._03.NoticeBean;

public interface NoticeService {
	public List<NoticeBean> getByUserId(String userid);
	void addFriendNotice(NoticeBean Noticebean);
	void addMessageNotice(NoticeBean Noticebean);
	public List<NoticeBean> findStatusByUser(String userid);
	void deleteMeStatusByUser(String userid);
	void deleteFrStarusByUser(String userid);
}
