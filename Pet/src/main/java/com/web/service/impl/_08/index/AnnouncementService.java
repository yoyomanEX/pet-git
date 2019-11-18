package com.web.service.impl._08.index;

import java.util.List;

import com.web.model._08.index.AnnouncementBean;

public interface AnnouncementService {
	public List<AnnouncementBean> qryAllAnnouncement();
	public AnnouncementBean qryAnnouncementById(Integer annId);
	public List<AnnouncementBean> qryAnnounceByTitle(String title);
	public void insertAnnounce(AnnouncementBean annBean);
	public void updateAnnounce(Integer annId, AnnouncementBean annBean);
	public void deleteAnnounce(AnnouncementBean annBean);
}
