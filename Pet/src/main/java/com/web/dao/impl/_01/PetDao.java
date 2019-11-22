package com.web.dao.impl._01;

import java.util.List;

import com.web.model._01.MemberBean;
import com.web.model._01.PetBean;

public interface PetDao {
	//新增寵物
	int savePet(PetBean pb);
	//刪除寵物
	int deletePet(PetBean pb);
	//修改寵物
	int updataPet(PetBean pb);
	//查詢全部寵物
	List<PetBean> queryAllPet(MemberBean mb);
	
}
