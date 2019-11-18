package com.web.controller._06;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.BodyBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.model._06.OrderBean;
import com.web.model._06.OrderDetailBean;
import com.web.model._06.PetBean06;
import com.web.service.impl._06.PetDao;

//@Controller 表示該類別是一個控制器
@Controller
@RequestMapping("/_06")
public class ProductMangementController06_New {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PetDao petDao;

	// @RequestMapping("/")= 定義此處的URL地址
	@RequestMapping("/productList")
	public String petProduct() throws Exception {
		return "_06/PetProductsList"; // !!自行修正：建立的JSP檔案名稱
	}

	/*
	 * 秀出後台全部商品
	 */
	@RequestMapping("/petProductsAll")
	public String petProductsAll(Model model) throws Exception {
		List<PetBean06> pbs = petDao.queryAll();
		model.addAttribute("pbs", pbs);
		return "_06/PetProductsAll";
	}
	
	/**
	 * 判別傳入字串回傳DB內相同資料 查詢商品資料
	 * @param petBean
	 */

	@RequestMapping("/petProductsQuery")
	public String PetProductsQuery(HttpServletRequest request,Model model) throws Exception {
		String productSearch = request.getParameter("productSearch");
		List<PetBean06> pbs = petDao.queryProduct(productSearch);
		model.addAttribute("pbs", pbs);
		return "_06/PetProductsAll";
	}
	
	
	@RequestMapping("/queryOrder")
	public String orderQuery(HttpServletRequest request,Model model) throws Exception {
		String orderSearch = request.getParameter("orderSearch");
		System.out.println("orderSearch="+orderSearch);
		List<OrderBean> orderList = petDao.queryOrder(orderSearch);
		List <OrderDetailBean>orderDetailBeans =petDao.totalOrderDetail();	
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderListDetail", orderDetailBeans);
		return "_06/ShippingManagement";
	}
	
	

//	@RequestMapping("/petProductsQueryId")
//	public String petProductQueryId(HttpServletRequest request, Model model) throws Exception {
//		PetBean06 petBean = new PetBean06();
//		String productId = request.getParameter("productId");
//		petBean.setProduct_id(Integer.parseInt(productId));
//		petDao.queryDBId(petBean);
//		model.addAttribute("pb", petBean);
//		return "06_/PetProductsQueryId";
//	}

	/*
	 * 更改商品上架狀態
	 */
	
	@RequestMapping("/changeProductsStatus")
	public String petProductsDelete(HttpServletRequest request, Model model) throws Exception {
		String productId = request.getParameter("productId");
		String status = request.getParameter("status");
		petDao.changeStatus(Integer.parseInt(productId), Integer.parseInt(status));
		List<PetBean06> petBean = petDao.queryAll();
		model.addAttribute("pbs", petBean);
		return "06_/PetProductsAll";
	}
	
	/*
	 *   取得商品ID 跳至更新頁面
	 */

	@RequestMapping("/petProductUpdate")
	public String petProductUpdate(HttpServletRequest request, Model model) throws Exception {
		PetBean06 petBean = new PetBean06();
		String productId = request.getParameter("productId");
		petBean.setProduct_id(Integer.parseInt(productId));
		petDao.queryDBId(petBean);
		model.addAttribute("pb", petBean);
		return "_06/PetProductsUpdate";
	}
	
	/*
	 *   取得輸入更新資料執行後跳回商品頁
	 */

	@RequestMapping("/petProductUpdateDone")
	public String petProductUpdateDone(HttpServletRequest request, Model model, @RequestParam("file") MultipartFile file) throws Exception {
		PetBean06 petBean = new PetBean06();

		String productId = request.getParameter("productId");
		
		String productName = request.getParameter("productName");
		String amount = request.getParameter("amount");
		String cost = request.getParameter("cost");
		String price = request.getParameter("price");
		String describe = request.getParameter("describe");
		String status = request.getParameter("status");
		String category = request.getParameter("category");
		logger.info("category="+category);
		
		
		petBean.setProduct_id(Integer.parseInt(productId));
		petBean.setProduct_name(productName);
		petBean.setAmount(Integer.parseInt(amount));
		petBean.setCost_price(Integer.parseInt(cost));
		petBean.setPrice(Integer.parseInt(price));
		petBean.setDescribe(describe);
		petBean.setStatus(Integer.parseInt(status));
		petBean.setCategory(Integer.parseInt(category));

		petDao.updateProduct(petBean);

		if (!file.isEmpty()) {
			Path path = Paths.get("C:/photo/" + productId + ".jpg");
			byte[] bytes = file.getBytes();
			Files.write(path, bytes);
			// thumbanails使用方法:https://blog.csdn.net/qq_39403545/article/details/89405885
//			Thumbnails.of(file.getInputStream()).size(150,180).keepAspectRatio(false)
//					.toFile("C:/photo/" + productId + ".jpg");
		}
		List<PetBean06> pbs = petDao.queryAll();
		
		model.addAttribute("pbs", pbs);
		return "_06/PetProductsAll";
	}

	/*
	 *   直接跳至新增商品頁
	 */
	@RequestMapping("/petProductsNew")
	public String petNew() {
		return "_06/PetProductsNew";
	}

	/*
	 *  取得輸入的新增商品資料執行後跳回商品頁
	 */
	@RequestMapping("/petProductInsert")
	public String petProductInsert(HttpServletRequest request, Model model, @RequestParam("file") MultipartFile file) throws SQLException, IOException {
		PetBean06 petBean = new PetBean06();
		String productName = request.getParameter("product_name");
		String quantity = request.getParameter("amount");
		String cost = request.getParameter("cost_price");
		String price = request.getParameter("price");
		String describe = request.getParameter("describe");
		String status = request.getParameter("status");
		String category = request.getParameter("category");
		petBean.setProduct_name(productName);
		petBean.setAmount(Integer.parseInt(quantity));
		petBean.setCost_price(Integer.parseInt(cost));
		petBean.setPrice(Integer.parseInt(price));
		petBean.setDescribe(describe);
		petBean.setStatus(Integer.parseInt(status));
		petBean.setCategory(Integer.parseInt(category));
		petDao.insert(petBean);
		int productId = petDao.insert(petBean);
		System.out.println("productId=" + productId);
		if (!file.isEmpty()) {
			byte[] bytes = file.getBytes();
			Path path = Paths.get("C:/photo/" + productId + ".jpg");
			Files.write(path, bytes);
			// thumbanails使用方法:https://blog.csdn.net/qq_39403545/article/details/89405885
//			Thumbnails.of(file.getInputStream()).size(150,180).keepAspectRatio(false)
//					.toFile("C:/photo/" + productId + ".jpg");
		}
		List<PetBean06> pbs = petDao.queryAll();
		model.addAttribute("pbs", pbs);
		return "_06/PetProductsAll";
	}

	/*
	 *  取得輸入的新增商品名稱執行資料庫查找，回復資料後跳回商品頁
	 */
	
	@RequestMapping("/petProductQueryName")
	public String petProductQueryName(HttpServletRequest request, Model model) throws SQLException {
		String productName = request.getParameter("productName");
		List<PetBean06> petBean = petDao.queryAllName(productName);
		model.addAttribute("pbs", petBean);
		return "06_/PetProductsAll";
	}
	
	/*
	 * 返回至訂單管理頁
	 */

	@RequestMapping("/shippingManagement")
	public String shippingManagement(HttpServletRequest request, Model model) throws SQLException {
		return "_06/ShippingManagement";
	}
	
	
	
	/*
	 * 查詢未出貨訂單
	 */
	@RequestMapping("/unshippedOrder")
	public String unshippedOrder(HttpServletRequest request, Model model) throws SQLException {
		List <OrderBean> orderBeans = petDao.unshippedOrder();
		List <OrderDetailBean>orderDetailBeans =petDao.totalOrderDetail();	
		model.addAttribute("orderList", orderBeans);
		model.addAttribute("orderListDetail", orderDetailBeans);
		return "_06/ShippingManagement";
	}
	
	/**
	 * 安排出貨 插入出貨時間後回傳，訂單將移入已出貨訂單
	 */
	@RequestMapping("/insertShippedDate")
	public String insertShippedDate(HttpServletRequest request, Model model) throws SQLException {
		String order_id = request.getParameter("orderId");
		petDao.insertShippedDate(order_id);
		List <OrderBean> orderBeans = petDao.unshippedOrder();
		List <OrderDetailBean>orderDetailBeans =petDao.totalOrderDetail();	
		model.addAttribute("orderList", orderBeans);
		model.addAttribute("orderListDetail", orderDetailBeans);
		return "_06/ShippingManagement";
	}
	
	/*
	 * 查詢已出貨訂單
	 */
	
	@RequestMapping("/shippedOrder")
	public String shippedOrder(HttpServletRequest request, Model model) throws SQLException {
		List <OrderBean> orderBeans = petDao.shippedOrder();
		List <OrderDetailBean>orderDetailBeans =petDao.totalOrderDetail();	
		model.addAttribute("orderList", orderBeans);
		model.addAttribute("orderListDetail", orderDetailBeans);
		return "_06/ShippingManagement";
	}
	
	
	/*
	 * 查詢付款失敗訂單
	 */
	
	@RequestMapping("/errorOrder")
	public String errorOrder(HttpServletRequest request, Model model) throws SQLException {
		List <OrderBean> orderBeans = petDao.errorOrder();
		List <OrderDetailBean>orderDetailBeans =petDao.totalOrderDetail();	
		model.addAttribute("orderList", orderBeans);
		model.addAttribute("orderListDetail", orderDetailBeans);
		return "_06/ShippingManagement";
	}
	
	@RequestMapping("/upload")
	public String singleFileUpload(@RequestParam("file") MultipartFile file, Model model) {
		if (file.isEmpty()) {
			model.addAttribute("message", "Please select a file to upload");
			return "errorUploadStatus";
		}
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get("C:\\photo\\" + file.getOriginalFilename());
			Files.write(path, bytes);
			model.addAttribute("message", "You successfully uploaded '" + file.getOriginalFilename() + "'");
		} catch (IOException e) {
			logger.error("", e);
		}
		return "uploadStatus";
	}

	@GetMapping("/downloadFile/{fileName:.+}")
	public ResponseEntity<Resource> downloadFile(@PathVariable String fileName, HttpServletRequest request) throws MalformedURLException {
		ResourcePatternResolver rpr = new PathMatchingResourcePatternResolver();
		Resource rs = rpr.getResource("file:/C:/photo/" + fileName);
		if (!rs.exists()) {
			rs = rpr.getResource("file:/C:/photo/noImg.jpg");
		}

		// Try to determine file's content type
		// 嘗試確定文件的內容類型
		String contentType = null;
		try {
			contentType = request.getServletContext().getMimeType(rs.getFile().getAbsolutePath());
		} catch (IOException ex) {
			logger.info("Could not determine file type.");
		}

		// Fallback to the default content type if type could not be determined
		// 如果無法確定類型，則回退到默認內容類型
		if (contentType == null) {
			contentType = "application/octet-stream";
		}

		BodyBuilder builder = ResponseEntity.ok();
		builder.contentType(MediaType.parseMediaType(contentType));
		// header是告知瀏覽器該圖片資料
		builder.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + rs.getFilename() + "\"");
		// body是秀在網頁上給使用者看的部分
		ResponseEntity<Resource> resp = builder.body(rs);
		return resp;
	}
}
