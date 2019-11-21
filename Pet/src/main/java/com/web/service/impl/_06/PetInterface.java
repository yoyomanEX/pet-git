package com.web.service.impl._06;

import java.sql.SQLException;
import java.util.List;

import com.web.model._06.OrderBean;
import com.web.model._06.OrderDetailBean;
import com.web.model._06.PetBean06;



public interface PetInterface {
	public List<PetBean06> queryAll();

	public void queryDB(PetBean06 PB) throws SQLException;

	public int insert(PetBean06 PB) throws SQLException;

	public void updateProduct(PetBean06 pb) throws SQLException;

	public void delete(int productId) throws SQLException; // int number?

	public void changeStatus(int productId, int status) throws SQLException; // int number?

	public void createConn() throws SQLException;

	public void closeConn() throws SQLException;

	public List<OrderBean> unshippedOrder() throws SQLException;

	public List<OrderBean> shippedOrder() throws SQLException;

	public List<OrderDetailBean> totalOrderDetail() throws SQLException;

	public void insertShippedDate(String order_id) throws SQLException;

	public List<OrderBean> errorOrder() throws SQLException;

}
