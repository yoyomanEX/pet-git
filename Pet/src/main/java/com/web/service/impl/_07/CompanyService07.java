package com.web.service.impl._07;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.web.model._01.CompanyBean;

public interface CompanyService07 {

	ArrayList<CompanyBean> queryAllCompany();

	CompanyBean checkCompanyIdPassword(String userId, String password);

	void addCompany(CompanyBean p1);

	ArrayList<CompanyBean> reviewCompany();

	void rejectByCompanyId(CompanyBean p1);

	void acceptByCompanyId(CompanyBean p1);

	ArrayList<CompanyBean> obtainedCompany();
	
	ArrayList<CompanyBean> rejectCompany();

	void obtainedByCompanyId(CompanyBean p1);

}