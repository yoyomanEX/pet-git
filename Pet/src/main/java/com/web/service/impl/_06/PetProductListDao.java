package com.web.service.impl._06;

import java.sql.SQLException;
import java.util.List;

import com.web.model._06.OrderBean;
import com.web.model._06.OrderDetailBean;
import com.web.model._06.PetProductListBean;



public interface PetProductListDao {

	/**
	 * 
	 * @param conn
	 * @return
	 */
	public List<PetProductListBean> productInfo();

	public List<PetProductListBean> productInfoCat();

	public List<PetProductListBean> productInfoDog();

	public List<PetProductListBean> addProducts(String[] product_ids, String[] amounts);

	public List<PetProductListBean> addProduct(String product_id, String amount);

	public String order_id() throws SQLException;

	public List<OrderBean> confirmOrder(OrderBean orderBean) throws SQLException;

	public List<OrderBean> confirmOrderDetail(OrderBean orderBean, String[] product_ids, String[] product_names, String[] amounts, String[] prices) throws SQLException;

	public List<OrderBean> orderAll(int Member_id);

	public List<OrderDetailBean> orderDetail(List<OrderBean> orderList);

	public PetProductListBean findProductId(int orderId);

	void createConn();

	void closeConn();

	public List<PetProductListBean> confirmbBuy(String[] product_ids, String[] amounts);


}