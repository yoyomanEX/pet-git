package com.web.dao.impl._08.index;

import java.util.List;

import com.web.model._08.index.MarkBean;


public interface MarkDAO {
	public List<MarkBean> qryAllMark();
	public MarkBean qryMarkById(Integer markId);
//	public List<MarkBean> qryMarkByTitle(String title);
	public void insertMark(MarkBean markBean);
	public void updateMark(MarkBean markBean);
	public void deleteMark(Integer markId);
}
