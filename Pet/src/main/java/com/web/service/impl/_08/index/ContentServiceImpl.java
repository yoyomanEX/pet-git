package com.web.service.impl._08.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._08.index.ContentDAO;
import com.web.model._08.index.ContentBean;

@Service
@EnableTransactionManagement
public class ContentServiceImpl implements ContentService {
	
	ContentDAO contDAO;
	@Autowired
	public void setContDAO(ContentDAO contDAO) {
		this.contDAO = contDAO;
	}
	@Transactional
	@Override
	public List<ContentBean> qryAllContent() {
		return contDAO.qryAllContent();
	}
	@Transactional
	@Override
	public ContentBean qryContentById(Integer contId) {
		return contDAO.qryContentById(contId);
	}
	@Transactional
	@Override
	public List<ContentBean> qryContentByTitle(String title) {
		return contDAO.qryContentByTitle(title);
	}
	@Transactional
	@Override
	public void insertContent(ContentBean contBean) {
		contDAO.insertContent(contBean);

	}
	@Transactional
	@Override
	public void updateContent(Integer contId, ContentBean contBean) {
		contDAO.updateContent(contId, contBean);
	}
	@Transactional
	@Override
	public void deleteContent(ContentBean contBean) {
		contDAO.deleteContent(contBean);

	}

}
