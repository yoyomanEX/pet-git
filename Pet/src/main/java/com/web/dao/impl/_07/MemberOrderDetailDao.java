package com.web.dao.impl._07;

import java.util.ArrayList;

import com.web.model._07.MemberOrderDetailBean;

public interface MemberOrderDetailDao {
	public ArrayList<MemberOrderDetailBean> queryAllOrder(MemberOrderDetailBean p1);
	
	public ArrayList<MemberOrderDetailBean> queryByOrderId(MemberOrderDetailBean p1);
	ArrayList<MemberOrderDetailBean> queryOrderProductTotalAmount(String p1, String p2, String p3);

	ArrayList<MemberOrderDetailBean> queryOrderChartsList(String p1, String p2, String p3);
}
