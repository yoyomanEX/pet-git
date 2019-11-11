package com.web.service.impl._01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._01.PetDao;
import com.web.model._01.MemberBean;
import com.web.model._01.PetBean;
@Service
@Transactional
@EnableTransactionManagement
public class PetServiceImpl implements PetService {
	
	@Autowired
	PetDao petDao;
	
	@Override
	public int savePet(PetBean pb) {
		return petDao.savePet(pb);
	}

	@Override
	public int deletePet(PetBean pb) {
		return petDao.deletePet(pb);
	}

	@Override
	public int updataPet(PetBean pb) {
		return petDao.updataPet(pb);
	}

	@Override
	public List<PetBean> queryAllPet(MemberBean mb) {
		return petDao.queryAllPet(mb);
	}

}
