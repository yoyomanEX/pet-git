package com.web.service.impl._07;

import java.util.ArrayList;


import org.springframework.transaction.annotation.Transactional;

import com.web.model._07.MemberOrderDetailBean;

public interface MemberOrderDetailService {

	ArrayList<MemberOrderDetailBean> queryAllOrder(MemberOrderDetailBean p1);

	void queryByOrderId(MemberOrderDetailBean p1);

}

