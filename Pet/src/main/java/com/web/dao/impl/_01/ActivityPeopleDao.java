package com.web.dao.impl._01;

import java.util.List;

import com.web.model._01.ActivityPeopleBean;

public interface ActivityPeopleDao {
	//參加活動
	int saveActivityPeople(ActivityPeopleBean apb);
	//取消已參加的活動
	int deleteActivityPeople(ActivityPeopleBean apb);
	//查詢會員參加活動的活動
	List<ActivityPeopleBean> queryMemberActivity(String id);
	//查詢參加活動的會員
	List<ActivityPeopleBean> queryActivityPeople(Integer id);
	
}
