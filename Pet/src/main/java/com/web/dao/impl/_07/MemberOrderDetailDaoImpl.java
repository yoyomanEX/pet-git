package com.web.dao.impl._07;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
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
	@Override
	public ArrayList<MemberOrderDetailBean> queryByOrderId(MemberOrderDetailBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from MemberOrderDetailBean where order_id="+p1.getOrder_id());
		ArrayList<MemberOrderDetailBean> list = (ArrayList<MemberOrderDetailBean>) query.list();
		System.out.println("list=" + list);
		return list;
		
	}
	@Override
	public ArrayList<MemberOrderDetailBean> queryOrderProductTotalAmount(String p1,String p2,String p3) {
		Session session = factory.getCurrentSession();
		NativeQuery query = session
				.createSQLQuery("SELECT 0 as order_id, 0 as company_id,0 as total,member_order_detail.product_id,member_order_detail.product_name"
						+ ",sum(member_order_detail.amount) as amount "
						+ "FROM member_order INNER JOIN member_order_detail "
						+ "ON member_order.order_id = member_order_detail.order_id "
						+ "where member_order.order_date >= '"+p1+"' "
						+ "and member_order.order_date <='"+p2+"' "
						+ "and member_order.company_id='"+p3+"'"
						+ "and member_order.status = 3"
						+ "group by member_order_detail.product_id,member_order_detail.product_name");
		return (ArrayList<MemberOrderDetailBean>) query.addEntity(MemberOrderDetailBean.class).list();
	}
	@Override
	public ArrayList<MemberOrderDetailBean> queryOrderChartsList(String p1,String p2,String p3) {
		Session session = factory.getCurrentSession();
		NativeQuery query = session
				.createSQLQuery("SELECT member_order.order_id,member_order.company_id,"
						+ "member_order.order_date,member_order_detail.product_id,"
						+ "member_order_detail.product_name,member_order_detail.amount,"
						+ "member_order.total,member_order.ship_date "
						+ "FROM member_order INNER JOIN member_order_detail "
						+ "ON member_order.order_id = member_order_detail.order_id "
						+ "where member_order.order_date >= '"+p1+"' "
						+ "and member_order.order_date <='"+p2+"' "
						+ "and member_order.company_id='"+p3+"'"
						+ "and member_order.status = 3");
		return (ArrayList<MemberOrderDetailBean>) query.addEntity(MemberOrderDetailBean.class).list();
	}


}
