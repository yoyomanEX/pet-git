package com.web.dao.impl._07;

import java.util.ArrayList;

import com.web.model._01.CompanyBean;


public interface CompanyDao {
	public void addCompany(CompanyBean p1);
	public void updateCompany(CompanyBean p1,String s1);
	public void deleteCompany(CompanyBean p1);
	
	public void querybyCompanyId(CompanyBean p1);
	public ArrayList<CompanyBean> fuzzyQueryByCompanyId(CompanyBean p1);
	public ArrayList<CompanyBean> fuzzyQueryByCompanyName(CompanyBean p1);
	public ArrayList<CompanyBean> queryAllCompany();
	
	public CompanyBean checkCompanyIdPassword(String userId, String password);
	public ArrayList<CompanyBean> obtainedCompany();
	public ArrayList<CompanyBean> reviewCompany();
	public void rejectByCompanyId(CompanyBean p1);
	public void acceptByCompanyId(CompanyBean p1);
	public void obtainedByCompanyId(CompanyBean p1);
	
	
	
	

}
