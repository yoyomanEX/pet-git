package com.web.dao.impl._08.index;

import java.util.List;

import com.web.model._08.index.CommentsBean;

public interface CommentsDAO {
	public List<CommentsBean> qryAllComments();
	public CommentsBean qryCommentsById(Integer comId);
	public List<CommentsBean> qryCommentsByTitle(String title);
	public void insertComments(CommentsBean comBean);
	public void updateComments(CommentsBean comBean);
	public void deleteComments(Integer comId);
}
