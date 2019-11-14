package com.web.service.impl._01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._01.PetActivityDao;
import com.web.model._01.ActivityPeopleBean;
import com.web.model._01.AdminBean;
import com.web.model._01.PetActivityBean;
@Service
@Transactional
@EnableTransactionManagement
public class PetActivityServiceImpl implements PetActivityService {
	@Autowired
	PetActivityDao petActivityDao;
	
	@Override
	public int savePetActivity(PetActivityBean pab) {
		return petActivityDao.savePetActivity(pab);
	}

	@Override
	public int deletePetActivity(PetActivityBean pab) {
		return petActivityDao.deletePetActivity(pab);
	}

	@Override
	public int updataActivity(PetActivityBean pab) {
		return petActivityDao.updataActivity(pab);
	}

	@Override
	public List<PetActivityBean> queryAdminPetActivity(AdminBean ab) {
		return petActivityDao.queryAdminPetActivity(ab);
	}

	@Override
	public List<PetActivityBean> queryMemberPetActivity(List<ActivityPeopleBean> list) {
		return petActivityDao.queryMemberPetActivity(list);
	}

	@Override
	public List<PetActivityBean> queryAllPetActivity() {
		return petActivityDao.queryAllPetActivity();
	}

}
