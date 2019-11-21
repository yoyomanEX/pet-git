package com.web.dao.impl._08.index;

import java.util.List;

import com.web.model._08.index.AnnouncementBean;

public interface AnnouncementDAO {
	public List<AnnouncementBean> qryAllAnnouncement();
	public AnnouncementBean qryAnnouncementById(Integer announce_id);
	public List<AnnouncementBean> qryAnnounceByTitle(String title);
	public void insertAnnounce(AnnouncementBean annBean);
	public void updateAnnounce(Integer annId, AnnouncementBean annBean);
	public void deleteAnnounce(AnnouncementBean annBean);
}
