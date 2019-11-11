package com.web.service.impl._07;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._07.MemberOrderDetailDaoImpl;

import com.web.model._07.MemberOrderDetailBean;

@Service
public class MemberOrderDetailServiceImpl implements MemberOrderDetailService {
	@Autowired
	MemberOrderDetailDaoImpl eDao;
	
	@Override
	@Transactional
	public ArrayList<MemberOrderDetailBean> queryAllOrder(MemberOrderDetailBean p1){	
		return eDao.queryAllOrder(p1);
		
	}
	@Override
	@Transactional
	public ArrayList<MemberOrderDetailBean> queryByOrderId(MemberOrderDetailBean p1) {
		return eDao.queryByOrderId(p1);
	}
}
