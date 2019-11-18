package com.web.service.impl._08.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._08.index.AnnouncementDAO;
import com.web.model._08.index.AnnouncementBean;

@Service
@EnableTransactionManagement
public class AnnouncementServiceImpl implements AnnouncementService {
	
	AnnouncementDAO annDAO;
	@Autowired
	public void setAnnDAO(AnnouncementDAO annDAO) {
		this.annDAO = annDAO;
	}
	@Transactional
	@Override
	public List<AnnouncementBean> qryAllAnnouncement() {
		return annDAO.qryAllAnnouncement();
	}
	
	@Transactional
	@Override
	public AnnouncementBean qryAnnouncementById(Integer annId) {
		return annDAO.qryAnnouncementById(annId);
	}
	@Transactional
	@Override
	public List<AnnouncementBean> qryAnnounceByTitle(String title) {
		return annDAO.qryAnnounceByTitle(title);
	}
	@Transactional
	@Override
	public void insertAnnounce(AnnouncementBean annBean) {
		annDAO.insertAnnounce(annBean);

	}
	@Transactional
	@Override
	public void updateAnnounce(Integer annId, AnnouncementBean annBean) {
		annDAO.updateAnnounce(annId, annBean);

	}
	@Transactional
	@Override
	public void deleteAnnounce(AnnouncementBean annBean) {
		annDAO.deleteAnnounce(annBean);
	}

}
