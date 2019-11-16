package com.web.service.impl._06;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;

import com.web.model._06.OrderBean;
import com.web.model._06.OrderDetailBean;
import com.web.model._06.PetBean06;

@Service
public class PetDao implements PetInterface {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/*
	 * 搜尋全部商品資料
	 */
	@Override
	public List<PetBean06> queryAll() {
		// 準備回傳資料
		List<PetBean06> PBs = new ArrayList<PetBean06>();

		// 執行SQL敘述 List<Map<String, Object>>存放資料(kev跟value型態)
		String qryStmt = "SELECT * FROM product";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt);
		for (Map<String, Object> row : rows) {
			PetBean06 PB = new PetBean06();
			PB.setProduct_id((int) row.get("product_id"));
			PB.setProduct_name((String) row.get("product_name"));
			PB.setPrice((int) row.get("price"));
			PB.setCost_price((int) row.get("cost_price"));
			PB.setAmount((int) row.get("amount"));
			PB.setCompany_id((String) row.get("company_id"));
			PB.setDescribe((String) row.get("describe"));
			PB.setStatus((int) row.get("status"));
			PB.setCategory((int) row.get("category"));
			PBs.add(PB);
		}
		return PBs;
	}

	@Override
	public void queryDB(PetBean06 PB) throws SQLException {
//		String qryStmt = "select * from Pet_Product where productId=?";
//		PreparedStatement stmt = conn.prepareStatement(qryStmt);
//		stmt.setInt(1, PB.getProductId());
//		ResultSet rs = stmt.executeQuery();
//		if (rs.next()) {
//			PB.setProductId(rs.getInt("productId"));
//			PB.setProductName(rs.getString("productName"));
//			PB.setQuantity(rs.getInt("quantity"));
//			PB.setCost(rs.getInt("cost"));
//			PB.setPrice(rs.getInt("price"));
//		}
//		stmt.close();
	}

	public List<PetBean06> queryAllName(String productName) {
		List<PetBean06> PBs = new ArrayList<>();
		String qryStmt = "select * from product where product_name LIKE ?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt, "%" + productName + "%");
		for (Map<String, Object> row : rows) {
			PetBean06 PB = new PetBean06();
			PB.setProduct_id((int) row.get("product_id"));
			PB.setProduct_name((String) row.get("product_name"));
			PB.setPrice((int) row.get("price"));
			PB.setCost_price((int) row.get("cost_price"));
			PB.setAmount((int) row.get("amount"));
			PB.setCompany_id((String) row.get("company_id"));
			PB.setDescribe((String) row.get("describe"));
			PB.setStatus((int) row.get("status"));
			PB.setCategory((int) row.get("category"));
			PBs.add(PB);
		}
//		String qryStmt = "select * from Pet_Product where productName LIKE ?";
//		List<com.tw.vo.PetBean06> PBs = new ArrayList<>();
//		try {
//			PreparedStatement stmt = conn.prepareStatement(qryStmt);
//			stmt.setString(1, "%" + productName + "%");
//			ResultSet rs = stmt.executeQuery();
//			while (rs.next()) {
//				com.tw.vo.PetBean06 PB = new com.tw.vo.PetBean06();
//				PB.setProductId(rs.getInt("productId"));
//				PB.setProductName(rs.getString("productName"));
//				PB.setQuantity(rs.getInt("quantity"));
//				PB.setCost(rs.getInt("cost"));
//				PB.setPrice(rs.getInt("price"));
//				PBs.add(PB);
//			}
//		} catch (Exception e) {
//			System.out.println(e);
//		}
		return PBs;

	}

	/**
	 * 判別傳入字串回傳DB內相同資料 ，查詢商品資料
	 * 
	 * @param petBean
	 */

	public List<PetBean06> queryProduct(String productSearch) {

		List<PetBean06> pbs = new ArrayList<>();
		String qryStmt = "select * from product where product_name like ? or product_id like ?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt, "%" + productSearch + "%", "%" + productSearch + "%");
		for (Map<String, Object> row : rows) {
			PetBean06 petBean = new PetBean06();
			petBean.setProduct_id((int) row.get("product_id"));
			petBean.setProduct_name((String) row.get("product_name"));
			petBean.setPrice((int) row.get("price"));
			petBean.setCost_price((int) row.get("cost_price"));
			petBean.setAmount((int) row.get("amount"));
			petBean.setCompany_id((String) row.get("company_id"));
			petBean.setDescribe((String) row.get("describe"));
			petBean.setStatus((int) row.get("status"));
			petBean.setCategory((int) row.get("category"));
			pbs.add(petBean);
		}
		return pbs;

	}

	/**
	 * 判別傳入字串回傳DB內相同資料 ，查詢訂單資料
	 * 
	 * @param petBean
	 */

	public List<OrderBean> queryOrder(String queryOrder) {

		List<OrderBean> orderBean = new ArrayList<>();
		
		String qryStmt = "select * from member_order where member_id like ? or order_id like ?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt, "%" + queryOrder + "%", "%" + queryOrder + "%");
		for (Map<String, Object> row : rows) {
			System.out.println(row);
			OrderBean ob = new OrderBean();
			ob.setOrder_id(String.valueOf(row.get("order_id")));
			ob.setAddress((String) row.get("address"));
			ob.setMember_id((String) row.get("member_id"));
			ob.setPhone((String) row.get("userPhone"));
			ob.setRecipient((String) row.get("recipient"));
			ob.setOrder_date((Date) row.get("order_date"));
			ob.setTotal((int) row.get("total"));
			ob.setShip_date((Date) row.get("ship_date"));
			orderBean.add(ob);
		}
		return orderBean;
	}

	public void queryDBId(PetBean06 petBean) {

		String qryStmt = "select * from product where product_id=?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt, petBean.getProduct_id());
		for (Map<String, Object> row : rows) {
			petBean.setProduct_id((int) row.get("product_id"));
			petBean.setProduct_name((String) row.get("product_name"));
			petBean.setPrice((int) row.get("price"));
			petBean.setCost_price((int) row.get("cost_price"));
			petBean.setAmount((int) row.get("amount"));
			petBean.setCompany_id((String) row.get("company_id"));
			petBean.setDescribe((String) row.get("describe"));
			petBean.setStatus((int) row.get("status"));
			petBean.setCategory((int) row.get("category"));
		}
	}
	/**
	 * 更新商品資料
	 */

	@Override
	public void updateProduct(PetBean06 PB) throws SQLException {
		String qryStmt = "update product set product_name=?,price=?,cost_price=?,amount=?," + "company_id =?,describe=?,status=?,category=? where product_id=?";
		jdbcTemplate.update(qryStmt, PB.getProduct_name(), PB.getPrice(), PB.getCost_price(), PB.getAmount(), PB.getCompany_id(), PB.getDescribe(), PB.getStatus(), PB.getCategory(),
			PB.getProduct_id());
	}

	@Override
	public int insert(PetBean06 PB) throws SQLException {
		String insertSql = "insert into product (product_name,price,cost_price,amount,describe,status,category) values(?,?,?,?,?,?,?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();

		// 獲取自動產生的PRIMARY KEY
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement ps = con.prepareStatement(insertSql, new String[] { "AutoId" });
				ps.setString(1, PB.getProduct_name());
				ps.setInt(2, PB.getPrice());
				ps.setInt(3, PB.getCost_price());
				ps.setInt(4, PB.getAmount());
				ps.setString(5, PB.getDescribe());
				ps.setInt(6, PB.getStatus());
				ps.setInt(7, PB.getCategory());
				return ps;
			}
		}, keyHolder);
		// jdbcTemplate.update(insertStmt, PB.getProduct_name(), PB.getPrice(),
		// PB.getCost_price(),
		// PB.getAmount(), PB.getDescribe(), PB.getStatus(),
		// PB.getCategory(),keyHolder);
		int productId = keyHolder.getKey().intValue();
		return productId;
	}

	@Override
	public void changeStatus(int productId, int status) throws SQLException {
		if (status == 1) {
			String changeSQL = "update product set status = 2 where product_id=?";
			jdbcTemplate.update(changeSQL, productId);
		} else {
			String changeSQL = "update product set status = 1 where product_id=?";
			jdbcTemplate.update(changeSQL, productId);
		}
	}

	/*
	 * 確認尚未出貨訂單
	 */
	@Override
	public List<OrderBean> unshippedOrder() throws SQLException {
		List<OrderBean> orderBean = new ArrayList<>();

		// 判斷目前出貨日期是空值的話即為未出貨
		String sql = "select * from member_order where ship_date is null";

		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
		for (Map<String, Object> row : rows) {
			OrderBean ob = new OrderBean();
			ob.setOrder_id(String.valueOf(row.get("order_id")));
			ob.setAddress((String) row.get("address"));
			ob.setMember_id((String) row.get("member_id"));
			ob.setPhone((String) row.get("userPhone"));
			ob.setRecipient((String) row.get("recipient"));
			ob.setOrder_date((Date) row.get("order_date"));
			ob.setTotal((int) row.get("total"));
			ob.setShip_date((Date) row.get("ship_date"));
			orderBean.add(ob);
		}
		return orderBean;
	}

	@Override
	public List<OrderBean> shippedOrder() throws SQLException {
		List<OrderBean> orderBean = new ArrayList<>();

		// 判斷目前出貨日期是空值的話即為未出貨
		String sql = "select * from member_order where ship_date is not null";

		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
		for (Map<String, Object> row : rows) {
			OrderBean ob = new OrderBean();
			ob.setOrder_id(String.valueOf(row.get("order_id")));
			ob.setAddress((String) row.get("address"));
			ob.setMember_id((String) row.get("member_id"));
			ob.setPhone((String) row.get("userPhone"));
			ob.setRecipient((String) row.get("recipient"));
			ob.setOrder_date((Date) row.get("order_date"));
			ob.setTotal((int) row.get("total"));
			ob.setShip_date((Date) row.get("ship_date"));
			orderBean.add(ob);
		}
		return orderBean;
	}

	/*
	 * 訂單詳情
	 */
	@Override
	public List<OrderDetailBean> totalOrderDetail() throws SQLException {
		List<OrderDetailBean> orderDetailBean = new ArrayList<>();

		String sql = "select * from member_order_detail where company_id is null";

		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
		for (Map<String, Object> row : rows) {
			OrderDetailBean ob = new OrderDetailBean();
			ob.setOrder_id(String.valueOf(row.get("order_id")));
			ob.setProduct_id((int) row.get("product_id"));
			ob.setProduct_name((String) row.get("product_name"));
			ob.setAmount((int) row.get("amount"));
			ob.setTotal((int) row.get("total"));
			// ob.setCompany_id((int)row.get("company_id"));
			orderDetailBean.add(ob);
		}
		return orderDetailBean;
	}

	@Override
	public void insertShippedDate(String order_id) throws SQLException {
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String sql = "update member_order set ship_date =? where order_id =?";
		jdbcTemplate.update(sql, now, order_id);

	}

	@Override
	public void delete(int productId) throws SQLException {
//		String qryStmt = "delete from Pet_Product where productId =?";
//		PreparedStatement stmt = conn.prepareStatement(qryStmt);
//		stmt.setInt(1, productId);
//		stmt.execute();
//		stmt.close();
	}

	@Override
	public void createConn() {
//		try {
//			Context context = new InitialContext();
//			 DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/Pet");
//			conn=ds.getConnection();
//			
//		}catch(Exception e){
//			System.out.println(e);
//		}
//		try {
//			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=PetDB";
//			conn = DriverManager.getConnection(connUrl, "sa", "password");
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}

	@Override
	public void closeConn() throws SQLException {
//		if (conn != null) {
//			try {
//				conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
	}

}
