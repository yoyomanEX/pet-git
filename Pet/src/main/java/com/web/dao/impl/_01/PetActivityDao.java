package com.web.dao.impl._01;

import java.util.List;

import com.web.model._01.ActivityPeopleBean;
import com.web.model._01.AdminBean;
import com.web.model._01.PetActivityBean;

public interface PetActivityDao {
	//新增活動
	int savePetActivity(PetActivityBean pab);
	//刪除活動
	int deletePetActivity(PetActivityBean pab);
	//修改活動
	int updataActivity(PetActivityBean pab);
	//查詢管理員新增的活動
	List<PetActivityBean> queryAdminPetActivity(AdminBean ab);
	//查詢會員參加的活動
	List<PetActivityBean> queryMemberPetActivity(List<ActivityPeopleBean> list);
	//查詢全部活動
	List<PetActivityBean> queryAllPetActivity();
	
}
