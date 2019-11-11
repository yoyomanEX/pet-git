package com.web.service.impl._07;

import java.util.ArrayList;


import org.springframework.transaction.annotation.Transactional;

import com.web.model._07.MemberOrderBean;

public interface MemberOrderService {

	ArrayList<MemberOrderBean> queryAllOrder(String p1, String d1, String d2);

	//	@Transactional
	//	public ArrayList<MemberOrderBean> queryUnprocessedOrder(MemberOrderBean p1){
	//		ArrayList<MemberOrderBean> list =eDao.queryUnprocessedOrder(p1);
	//		
	//		for(MemberOrderBean b1:list) {
	//			
	//			MemberOrderDetailBean bean = new MemberOrderDetailBean();
	//			bean.setOrder_id(b1.getOrder_id()); //撈出這筆訂單的明細
	//			b1.setOrderDetailBean(detail.queryAllOrder(bean));//把參數傳進來
	//		}
	//		return list;
	//	}
	ArrayList<MemberOrderBean> queryUnprocessedOrder(MemberOrderBean p1);

	ArrayList<MemberOrderBean> queryUnshippedOrder(MemberOrderBean p1);

	ArrayList<MemberOrderBean> queryshippedOrder(MemberOrderBean p1);

	void processedUnshippedOrder(MemberOrderBean p1);

	void processedShippedOrder(MemberOrderBean p1);

	//搜尋全部未處理訂單(依照日期起訖日、company_id、商品狀態來判斷)
	ArrayList<MemberOrderBean> queryAllOrderByStatus(String p1, String d1, String d2, Integer s1);

}

