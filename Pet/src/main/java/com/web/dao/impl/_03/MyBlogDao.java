package com.web.dao.impl._03;

import java.util.List;

import com.web.model._03.MyBlogBean;

public interface MyBlogDao {
	void comehome(MyBlogBean Mybolgbean);
	public List<MyBlogBean> getByUser(String userid);
}
