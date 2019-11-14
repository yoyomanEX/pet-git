package com.web.service.impl._01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import com.web.dao.impl._01.ActivityPeopleDao;
import com.web.model._01.ActivityPeopleBean;

public class ActivityPeopleServiceImpl implements ActivityPeopleService {
	
	@Autowired
	ActivityPeopleDao activityPeopleDao;
	
	@Override
	public int saveActivityPeople(ActivityPeopleBean apb) {
		return activityPeopleDao.saveActivityPeople(apb);
	}

	@Override
	public int deleteActivityPeople(ActivityPeopleBean apb) {
		return activityPeopleDao.deleteActivityPeople(apb);
	}

	@Override
	public List<ActivityPeopleBean> queryMemberActivity(String id) {
		return activityPeopleDao.queryMemberActivity(id);
	}

	@Override
	public List<ActivityPeopleBean> queryActivityPeople(Integer id) {
		return activityPeopleDao.queryActivityPeople(id);
	}

}
