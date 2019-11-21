package com.web.service.impl._05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._05.ActivityPeopleDao;
import com.web.model._05.ActivityPeopleBean;

@Service
@Transactional
@EnableTransactionManagement
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
