package com.web.service.impl._08.index;

import java.util.List;

import com.web.model._08.index.ContentBean;

public interface ContentService {
	public List<ContentBean> qryAllContent();
	public ContentBean qryContentById(Integer contId);
	public List<ContentBean> qryContentByTitle(String title);
	public void insertContent(ContentBean contBean);
	public void updateContent(Integer contId, ContentBean contBean);
	public void deleteContent(ContentBean contBean);
}
