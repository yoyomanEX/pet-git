package com.web.dao.impl._07;

import java.util.ArrayList;

import com.web.model._07.MemberOrderDetailBean;

public interface MemberOrderDetailDao {
	public ArrayList<MemberOrderDetailBean> queryAllOrder(MemberOrderDetailBean p1);
	
	public ArrayList<MemberOrderDetailBean> queryByOrderId(MemberOrderDetailBean p1);
}
