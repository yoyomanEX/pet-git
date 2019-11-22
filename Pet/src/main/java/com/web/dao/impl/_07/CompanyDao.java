package com.web.dao.impl._07;

import java.util.ArrayList;

import com.web.model._01.CompanyBean;


public interface CompanyDao {
	//新增廠商
	public void addCompany(CompanyBean p1);
	//修改廠商
	public void updateCompany(CompanyBean p1,String s1);
	//刪除廠商
	public void deleteCompany(CompanyBean p1);
	
	//查廠商id
	public void querybyCompanyId(CompanyBean p1);
	//模糊查詢廠商id
	public ArrayList<CompanyBean> fuzzyQueryByCompanyId(CompanyBean p1);
	//模糊查詢廠商名稱
	public ArrayList<CompanyBean> fuzzyQueryByCompanyName(CompanyBean p1);
	public ArrayList<CompanyBean> queryAllCompany();
	public CompanyBean checkCompanyIdPassword(String userId, String password);
	//下架的廠商列表
	public ArrayList<CompanyBean> obtainedCompany();	
	//申請中的廠商列表
	public ArrayList<CompanyBean> reviewCompany();
	//拒絕廠商列表
	public ArrayList<CompanyBean> rejectCompany();
	public void rejectByCompanyId(CompanyBean p1);
	public void acceptByCompanyId(CompanyBean p1);
	public void obtainedByCompanyId(CompanyBean p1);
	
	
	
	
	

}
