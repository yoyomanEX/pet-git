package com.web.dao.impl._07;

import java.util.ArrayList;

import com.web.model._07.CompanyProductBean;

public interface CompanyProductDao {
	public void addProduct(CompanyProductBean p1);
	public void updateProduct(CompanyProductBean p1,Integer s1);
	public void deleteProduct(CompanyProductBean p1);
	
	public void querybyProductId(CompanyProductBean p1);
	public ArrayList<CompanyProductBean> fuzzyQueryByProductId(CompanyProductBean p1);
	public ArrayList<CompanyProductBean> fuzzyQueryByProductName(CompanyProductBean p1);
	public ArrayList<CompanyProductBean> queryAllProduct(CompanyProductBean p1);
	public ArrayList<CompanyProductBean> nonSaleProduct(CompanyProductBean p1);
	public void onSaleByProductId(CompanyProductBean p1);
	public void nonSaleByProductId(CompanyProductBean p1);
}
