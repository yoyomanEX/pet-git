package com.web.dao.impl._07;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._07.MemberOrderDetailBean;

@Repository
public class MemberOrderDetailDaoImpl implements MemberOrderDetailDao {
	// 建立連線
		SessionFactory factory;

		@Autowired
		public void setFactory(SessionFactory factory) {
			this.factory = factory;
		}

		public MemberOrderDetailDaoImpl() {

		}

	@Override
	public ArrayList<MemberOrderDetailBean> queryAllOrder(MemberOrderDetailBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from MemberOrderDetailBean where company_id="+p1.getCompany_id());
		return (ArrayList<MemberOrderDetailBean>) query.list();
	}
	
	public ArrayList<MemberOrderDetailBean> queryByOrderId(MemberOrderDetailBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from MemberOrderDetailBean where order_id="+p1.getOrder_id());
		ArrayList<MemberOrderDetailBean> list = (ArrayList<MemberOrderDetailBean>) query.list();
		System.out.println("list=" + list);
		return list;
//		for(MemberOrderDetailBean b1: list) {
//			p1.setCompany_id(b1.getCompany_id());
//			p1.setOrder_id(b1.getOrder_id());
//			p1.setProduct_id(b1.getProduct_id());
//			p1.setProduct_name(b1.getProduct_name());
//			p1.setAmount(b1.getAmount());
//			p1.setTotal(b1.getTotal());
//		}
		
	}

}
