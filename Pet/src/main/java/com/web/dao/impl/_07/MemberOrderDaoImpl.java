package com.web.dao.impl._07;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._07.MemberOrderBean;



@Repository
public class MemberOrderDaoImpl implements MemberOrderDao{
	// 建立連線
			SessionFactory factory;

			@Autowired
			public void setFactory(SessionFactory factory) {
				this.factory = factory;
			}

			public MemberOrderDaoImpl() {

			}
			
	//依日期搜尋訂單
	@Override
	public ArrayList<MemberOrderBean> queryAllOrder(String p1,String d1,String d2) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery
				("from MemberOrderBean where company_id="+p1+" and order_date>='"+d1+"' and order_date<='"+d2+"'");
		return (ArrayList<MemberOrderBean>) query.list();
	}
	
	//搜尋全部未處理訂單(依照日期起訖日、company_id、商品狀態來判斷)
		@Override
		public ArrayList<MemberOrderBean> queryAllOrderByStatus(String p1,String d1,String d2,Integer s1) {
			Session session = factory.getCurrentSession();
			Query query = session.createQuery
					("from MemberOrderBean where company_id="+p1+" and status="+s1+" and order_date>='"+d1+"' and order_date<='"+d2+"'");
			return (ArrayList<MemberOrderBean>) query.list();
		}

	//搜尋未處理訂單(狀態是1)
	@Override
	public ArrayList<MemberOrderBean> queryUnprocessedOrder(MemberOrderBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery
				("from MemberOrderBean where company_id="+p1.getCompany_id()+"and status=1");
		return (ArrayList<MemberOrderBean>) query.list();
	}
	
	//撈已接未出貨訂單(狀態是2)
		@Override
		public ArrayList<MemberOrderBean> queryUnshippedOrder(MemberOrderBean p1) {
			Session session = factory.getCurrentSession();
			Query query = session.createQuery
					("from MemberOrderBean where company_id="+p1.getCompany_id()+"and status=2");
			return (ArrayList<MemberOrderBean>) query.list();
		}
	//撈已接已出貨訂單(狀態是3)
		@Override
		public ArrayList<MemberOrderBean> queryshippedOrder(MemberOrderBean p1) {
			Session session = factory.getCurrentSession();
			Query query = session.createQuery
					("from MemberOrderBean where company_id="+p1.getCompany_id()+"and status=3");
			return (ArrayList<MemberOrderBean>) query.list();
		}	
		//接收訂單 狀態由1→2
		@Override
		public void processedUnshippedOrder(MemberOrderBean p1) {
			Session session = factory.getCurrentSession();
			String hql = "update MemberOrderBean m set m.status=2 WHERE m.order_id ="+p1.getOrder_id()+" and m.company_id="+p1.getCompany_id();
			Query query = session.createQuery(hql);
			query.executeUpdate();
			
		}
		//未出貨改已出貨 狀態由2→3
				@Override
				public void processedShippedOrder(MemberOrderBean p1) {
					Session session = factory.getCurrentSession();
					String hql = "update MemberOrderBean m set m.status=3 WHERE m.order_id ="+p1.getOrder_id()+"and m.company_id="+p1.getCompany_id();
					Query query = session.createQuery(hql);
					query.executeUpdate();
					
				}

				//
				public MemberOrderBean getMemberOrder(Long id) {
					Session session = factory.getCurrentSession();
					return session.get(MemberOrderBean.class, id);
				}
}
