package com.web.service.impl._03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._03.MyBlogDao;
import com.web.model._03.MyBlogBean;
@Service
public class MyBlogServiceImpl implements MyBlogService {
	MyBlogDao dao;
	
	@Autowired
	public void setDao(MyBlogDao dao) {
		this.dao = dao;
	}
	
	public MyBlogServiceImpl() {
	}
	@Transactional
	@Override	
	public void comehome(MyBlogBean Myblogbean) {
		dao.comehome(Myblogbean);
	}
	@Transactional
	@Override
	public List<String> getByUser(String userid) {		
		return dao.getByUser(userid);
	}

}
