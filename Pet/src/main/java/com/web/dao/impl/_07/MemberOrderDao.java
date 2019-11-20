package com.web.dao.impl._07;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.web.model._07.MemberOrderBean;
import com.web.model._07.MemberOrderDetailBean;


public interface MemberOrderDao {
	//搜尋全部訂單(by日期起訖日、company_id)
	public ArrayList<MemberOrderBean> queryAllOrder(String p1, String d1, String d2);
	
	//搜尋全部未處理訂單(依日期起訖日、company_id、商品狀態來判斷)
	public ArrayList<MemberOrderBean> queryAllOrderByStatus(String p1, String d1, String d2, Integer s1);

	//搜尋全部未處理訂單(by廠商統編、商品狀態=1)
	public ArrayList<MemberOrderBean> queryUnprocessedOrder(MemberOrderBean p1);
	
	//搜尋全部已處理未出貨訂單(by廠商統編、商品狀態=2)
	public ArrayList<MemberOrderBean> queryUnshippedOrder(MemberOrderBean p1);
	
	//搜尋全部已處理已出貨訂單(by廠商統編、商品狀態=3)
	public ArrayList<MemberOrderBean> queryshippedOrder(MemberOrderBean p1);
	
	public void processedUnshippedOrder(MemberOrderBean p1);
	public void processedShippedOrder(MemberOrderBean p1);

	//測試用
	ArrayList<MemberOrderBean> queryAllOrder();

	

	

}
