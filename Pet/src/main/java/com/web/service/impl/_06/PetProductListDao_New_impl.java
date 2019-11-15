package com.web.service.impl._06;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.model._06.OrderBean;
import com.web.model._06.OrderDetailBean;
import com.web.model._06.PetProductListBean;



@Service
public class PetProductListDao_New_impl implements PetProductListDao {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 取得全部商品
	 * 
	 * @return
	 */
	public List<PetProductListBean> productInfo() {
		// 準備好傳出去的集合
		List<PetProductListBean> products = new ArrayList<>();

		// 使用SQL查詢
		String qryStmt = "SELECT * FROM PRODUCT";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt);

		// 整理資料,並放入集合
		for (Map<String, Object> row : rows) {
			PetProductListBean product = new PetProductListBean();
			products.add(product);
			product.setProduct_id((int) row.get("product_id"));
			product.setProduct_name((String) row.get("product_name"));
			product.setAmount((int) row.get("amount"));
			product.setPrice((int) row.get("price"));
			product.setStatus((int)row.get("status"));
		}
		return products;
	}

	/**
	 * 取得貓咪分類商品
	 * 
	 * @return
	 */

	@Override
	public List<PetProductListBean> productInfoCat() {
		// 準備好傳出去的集合
		List<PetProductListBean> products = new ArrayList<>();

		// 使用SQL查詢，條件為category值是2的商品
		String qryStmt = "SELECT * FROM product where category=?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt, "2");

		// 整理資料,並放入集合
		for (Map<String, Object> row : rows) {
			PetProductListBean product = new PetProductListBean();
			products.add(product);
			product.setProduct_id((int) row.get("product_id"));
			product.setProduct_name((String) row.get("product_name"));
			product.setAmount((int) row.get("amount"));
			product.setPrice((int) row.get("price"));
		}
		return products;
	}

	/**
	 * 取得狗狗分類商品
	 * 
	 * @return
	 */
	@Override
	public List<PetProductListBean> productInfoDog() {
		// 準備好傳出去的集合
		List<PetProductListBean> products = new ArrayList<>();

		// 使用SQL查詢，條件為category值是1的商品
		String qryStmt = "SELECT * FROM product where category=?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt, "1");

		// 整理資料,並放入集合
		for (Map<String, Object> row : rows) {
			PetProductListBean product = new PetProductListBean();
			products.add(product);
			product.setProduct_id((int) row.get("product_id"));
			product.setProduct_name((String) row.get("product_name"));
			product.setAmount((int) row.get("amount"));
			product.setPrice((int) row.get("price"));
		}
		return products;
	}

	/**
	 * 加入商品頁面中單樣~多樣商品至購物車
	 * 
	 * @return
	 */
	@Override
	public List<PetProductListBean> addProducts(String[] product_ids, String[] amounts) {
		// 準備好傳出去的集合
		List<PetProductListBean> products = new ArrayList<>();

		// 資料整理 只使用有選購數量的商品作查詢動作(產品ID)
		List<String> newProductIds = new ArrayList<String>();
		for (int i = 0; i < product_ids.length; i++) {
			if (new Integer(amounts[i]) > 0) {
				newProductIds.add(product_ids[i]);
			}
		}
		product_ids = new String[] {};
		product_ids = newProductIds.toArray(product_ids);

		// 資料整理 只撈取有選購數量的值 ,要做塞值動作
		List<String> newMounts = new ArrayList<String>();
		for (int i = 0; i < amounts.length; i++) {
			if (new Integer(amounts[i]) > 0) {
				newMounts.add(amounts[i]);
			}
		}
		amounts = new String[] {};
		amounts = newMounts.toArray(amounts);

		// 將陣列轉換成字串 ex:111,222,333
		String ids = StringUtils.join(product_ids, ",");

		// 撈出有點選買購數量的商品
		String qryStmt = "SELECT * FROM product where product_id in (" + ids + ")";

		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt);
		int i = 0;
		for (Map<String, Object> row : rows) {
			PetProductListBean p = new PetProductListBean();
			products.add(p);
			p.setProduct_id((int) row.get("product_id"));
			p.setProduct_name((String) row.get("product_name"));
			// Amount數塞入點選的數量 ex:點選2塞入2 點選3塞入3
			p.setAmount(Integer.parseInt(amounts[i]));
			p.setPrice((int) row.get("price"));
			i++;
		}
		return products;
	}

	/**
	 * 加入詳細商品頁面1樣商品至購物車
	 * 
	 * @return
	 */
	@Override
	public List<PetProductListBean> addProduct(String product_id, String amount) {
		// 準備好傳出去的集合(?
		List<PetProductListBean> product = new ArrayList<>();
		// 使用SQL查詢產品ID
		String qryStmt = "SELECT * FROM product where product_id=?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt, product_id);

		// 取得商品詳細資料回傳CONTROLLER放入購物車
		for (Map<String, Object> row : rows) {
			PetProductListBean p = new PetProductListBean();
			product.add(p);
			p.setProduct_id(Integer.parseInt(product_id));
			p.setProduct_name((String) row.get("product_name"));
			p.setAmount(Integer.parseInt(amount));
			p.setPrice((int) row.get("price"));
		}
		return product;
	}

	/**
	 * 取得訂單編號ID並回傳
	 * 
	 * @return orderId
	 */
	@Override
	public String order_id() throws SQLException {
		String sqlIdentifier = "select next value for TableSequenceID";
		String id = jdbcTemplate.queryForObject(sqlIdentifier, String.class);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		String temp = sdf.format(new Date());
		String orderId = temp + id;
		return orderId;
	}

	/**
	 * 更新member_order資料
	 * 
	 * @return
	 */
	@Override
	public List<OrderBean> confirmOrder(OrderBean orderBean) throws SQLException {
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String setOrder = "Insert into member_order(order_id,member_id,total,address, " + "recipient,phone,order_date) values(?,?,?,?,?,?,?)";
		jdbcTemplate.update(setOrder, orderBean.getOrder_id(), orderBean.getMember_id(), orderBean.getTotal(), orderBean.getAddress(), orderBean.getRecipient(), orderBean.getPhone(), now);
		return null;
	}

	/**
	 * 更新member_order_detail資料
	 * 
	 * @return
	 */
	@Override
	public List<OrderBean> confirmOrderDetail(OrderBean orderBean, String[] product_ids, String[] product_names, String[] amounts, String[] prices) throws SQLException {
		String setOrderDeatil = "Insert into member_order_detail(product_id,product_name," + "amount,total,order_id) values(?,?,?,?,?) ";
		for (int i = 0; i < product_ids.length; i++) {
			//價格*數量正確金額
			int p = Integer.parseInt(prices[i]) * Integer.parseInt(amounts[i]);
			jdbcTemplate.update(setOrderDeatil, product_ids[i], product_names[i], amounts[i],p, orderBean.getOrder_id());
		}
		return null;
	}

	/**
	 * 更新庫存 設定 庫存減購買數 的正確數量
	 * 
	 * @return
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<PetProductListBean> confirmbBuy(String[] product_ids, String[] amounts) {
		// 資料整理 只使用有選購數量的商品作查詢動作(產品ID)
		List<String> newProduct_id = new ArrayList<>();
		for (int i = 0; i < product_ids.length; i++) {
			newProduct_id.add(product_ids[i]);
		}
		product_ids = new String[] {};
		product_ids = newProduct_id.toArray(product_ids);

		// 資料整理 只撈取有選購數量的值 ,要做塞值動作
		List<String> newAmo = new ArrayList<>();
		for (int i = 0; i < amounts.length; i++) {
			newAmo.add(amounts[i]);
		}
		amounts = new String[] {};
		amounts = newAmo.toArray(amounts);

		// SQL撈取有選購數量的商品ID作查詢動作
		String ids = StringUtils.join(product_ids, ",");
		String qryStmt = "SELECT * FROM PRODUCT where product_id in(" + ids + ")";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(qryStmt);

		int i = 0;
		for (Map<String, Object> row : rows) {
			logger.info("row=" + row);
			if (i < amounts.length) {
				// row.get("amount")撈出DB現在的庫存值 減amounts[i]購買數量="newAmount更新好的庫存"
				int newAmount = (int) row.get("amount") - Integer.parseInt(amounts[i]);

				// 更新DB商品庫存資料
				String setBuy = "update product set amount = ? where product_id =?";
				jdbcTemplate.update(setBuy, newAmount, product_ids[i]);
				i++;
			}
		}
		return null;
	}

	/**
	 * 查詢用戶ID的所有訂單
	 * 
	 * @return orderList
	 */
	@Override
	public List<OrderBean> orderAll(String Member_id) {
		// 準備好傳出去的集合
		List<OrderBean> orderList = new ArrayList<OrderBean>();

		// 查詢指定用戶ID的所有訂單並搜尋後回傳
		String getMemberdOrder = "select * from member_order where Member_id=?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(getMemberdOrder, Member_id);
		for (Map<String, Object> row : rows) {
			OrderBean o = new OrderBean();
			orderList.add(o);
			o.setOrder_id(String.valueOf(row.get("order_id")));
			o.setOrder_date((Date) row.get("order_date"));
			o.setTotal((int) row.get("total"));
			o.setShip_date((Date) row.get("ship_date"));
		}
		return orderList;
	}

	@Override
	public List<OrderDetailBean> orderDetail(List<OrderBean> orderList) {
		List<OrderDetailBean> orderDetail = new ArrayList<>();
		List<String> newOrderList = new ArrayList<String>();
		for (int i = 0; i < orderList.size(); i++) {
			newOrderList.add(orderList.get(i).getOrder_id());
		}

		String ids = StringUtils.join(newOrderList, ",");
		

		String getOrderDetail = "select * from member_order_detail where order_id in(" + ids + ")";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(getOrderDetail);
		for (Map<String, Object> row : rows) {
			OrderDetailBean o = new OrderDetailBean();
			orderDetail.add(o);
			o.setOrder_id(String.valueOf(row.get("order_id")));
			o.setProduct_id((int)row.get("product_id"));
			o.setProduct_name((String) row.get("product_name"));
			o.setAmount((int) row.get("amount"));
			o.setTotal((int) row.get("total"));
		}

		return orderDetail;
	}

	/**
	 * 得到單樣商品詳細資料
	 * 
	 * @return
	 */
	@Override
	public PetProductListBean findProductId(int orderId) {
		// 準備好傳出去的集合
		PetProductListBean product = new PetProductListBean();

		// 用orderId至SQL查詢該項商品詳細資料
		String sqlFindId = "select * from product where product_id = ?";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sqlFindId, orderId);

		// 撈出詳細資料並回傳
		for (Map<String, Object> row : rows) {
			product.setProduct_id((int) row.get("product_id"));
			product.setProduct_name((String) row.get("product_name"));
			product.setAmount((int) row.get("amount"));
			product.setPrice((int) row.get("price"));
			product.setDescribe((String) row.get("describe"));
		}
		return product;
	}

	@Override
	public void createConn() {
		// TODO Auto-generated method stub

	}

	@Override
	public void closeConn() {
		// TODO Auto-generated method stub

	}

}
