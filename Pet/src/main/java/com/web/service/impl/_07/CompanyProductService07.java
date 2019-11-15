package com.web.service.impl._07;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.web.model._07.CompanyProductBean;

public interface CompanyProductService07 {

	ArrayList<CompanyProductBean> queryAllProduct(CompanyProductBean p1);

	void addProduct(CompanyProductBean p1);

	void updateProduct(CompanyProductBean p1, Integer s1);

	void deleteProduct(CompanyProductBean p1);

	void querybyProductId(CompanyProductBean p1);

	ArrayList<CompanyProductBean> fuzzyQueryByProductId(CompanyProductBean p1);

	ArrayList<CompanyProductBean> fuzzyQueryByProductName(CompanyProductBean p1);

	ArrayList<CompanyProductBean> nonSaleProduct(CompanyProductBean p1);

	void onSaleByProductId(CompanyProductBean p1);

	void nonSaleByProductId(CompanyProductBean p1);

}