package com.web.service.impl._07;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.impl._07.MemberOrderDaoImpl;
import com.web.dao.impl._07.MemberOrderDetailDaoImpl;
import com.web.model._07.MemberOrderBean;
import com.web.model._07.MemberOrderDetailBean;

@Service
public class MemberOrderServiceImpl implements MemberOrderService {
	@Autowired
	MemberOrderDaoImpl eDao;
	
	@Autowired
	MemberOrderDetailDaoImpl detail;
	
	@Override
	@Transactional
	public ArrayList<MemberOrderBean> queryAllOrder(String p1,String d1,String d2){
		return eDao.queryAllOrder(p1, d1, d2);
		
	}
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
	@Override
	@Transactional
	public ArrayList<MemberOrderBean> queryUnprocessedOrder(MemberOrderBean p1){
		return eDao.queryUnprocessedOrder(p1);	
	}
	
	
	@Override
	@Transactional
	public ArrayList<MemberOrderBean> queryUnshippedOrder(MemberOrderBean p1){
		return eDao.queryUnshippedOrder(p1);
		
	}
	@Override
	@Transactional
	public ArrayList<MemberOrderBean> queryshippedOrder(MemberOrderBean p1){
		return eDao.queryshippedOrder(p1);
		
	}
	@Override
	@Transactional
	public void processedUnshippedOrder(MemberOrderBean p1) {
		eDao.processedUnshippedOrder(p1);
	}
	@Override
	@Transactional
	public void processedShippedOrder(MemberOrderBean p1) {
		eDao.processedShippedOrder(p1);
	}
	//搜尋全部未處理訂單(依照日期起訖日、company_id、商品狀態來判斷)
	@Override
	@Transactional
	public ArrayList<MemberOrderBean> queryAllOrderByStatus(String p1,String d1,String d2,Integer s1) {
		return eDao.queryAllOrderByStatus(p1, d1, d2, s1);
		
	}
//	@Override
//	@Transactional
//	public MemberOrderBean queryProductAmountByDate(String p1, String d1, String d2) {
//		return eDao.queryProductAmountByDate(p1, d1, d2);
//	}
//	@Override
//	@Transactional
//	public ArrayList<MemberOrderBean> queryAllOrder(){
//		return eDao.queryAllOrder();
//		
//	}
	
	@Override
	@Transactional
	public ArrayList<Map> queryOrderChartsList(String p1,String p2,String p3){
		return eDao.queryOrderChartsList(p1, p2, p3);
		
	}
	
	
	
}
