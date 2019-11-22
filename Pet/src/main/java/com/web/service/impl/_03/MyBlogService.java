package com.web.service.impl._03;

import java.util.List;

import com.web.model._03.MyBlogBean;

public interface MyBlogService {
	void comehome(MyBlogBean Mybolgbean);
	public List<String> getByUser(String userid);
}
