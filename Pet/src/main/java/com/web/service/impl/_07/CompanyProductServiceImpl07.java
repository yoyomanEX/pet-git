package com.web.service.impl._07;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._07.CompanyProductDaoImpl;
import com.web.model._07.CompanyProductBean;

@Service
public class CompanyProductServiceImpl07 implements CompanyProductService07 {
	@Autowired
	CompanyProductDaoImpl eDao;

	@Override
	@Transactional
	public ArrayList<CompanyProductBean> queryAllProduct(CompanyProductBean p1) {
		return eDao.queryAllProduct(p1);
	}
	@Override
	@Transactional
	public void addProduct(CompanyProductBean p1) {
		eDao.addProduct(p1);
	}
	@Override
	@Transactional
	public void updateProduct(CompanyProductBean p1, Integer s1) {
		eDao.updateProduct(p1, s1);
	}
	@Override
	@Transactional
	public void deleteProduct(CompanyProductBean p1) {
		eDao.deleteProduct(p1);
	}
	@Override
	@Transactional
	public void querybyProductId(CompanyProductBean p1) {
		eDao.querybyProductId(p1);
	}
	@Override
	@Transactional
	public ArrayList<CompanyProductBean> fuzzyQueryByProductId(CompanyProductBean p1) {
		return eDao.fuzzyQueryByProductId(p1);
		
	}
	@Override
	@Transactional
	public ArrayList<CompanyProductBean> fuzzyQueryByProductName(CompanyProductBean p1) {
		return eDao.fuzzyQueryByProductName(p1);
		
	}
	@Override
	@Transactional
	public ArrayList<CompanyProductBean> nonSaleProduct(CompanyProductBean p1){
		return eDao.nonSaleProduct(p1);
		
	}
	@Override
	@Transactional
	public void onSaleByProductId(CompanyProductBean p1){
		eDao.onSaleByProductId(p1);
	}
	@Override
	@Transactional
	public void nonSaleByProductId(CompanyProductBean p1){
		eDao.nonSaleByProductId(p1);
	}

}
