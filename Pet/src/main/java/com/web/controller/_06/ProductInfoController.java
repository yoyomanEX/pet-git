package com.web.controller._06;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.time.DateFormatUtils;
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

import com.web.model._01.MemberBean;
import com.web.model._06.OrderBean;
import com.web.model._06.OrderDetailBean;
import com.web.model._06.OrderNumberRequest;
import com.web.model._06.PetProductListBean;
import com.web.service.impl._06.PetProductListDao;
import com.web.service.impl._06.Pet_UserDao;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

//@Controller 表示該類別是一個控制器
@Controller
@RequestMapping("/06")
public class ProductInfoController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private String merchantId = "2000132";
	@Autowired
	private Pet_UserDao petDao;

	@Autowired
	private PetProductListDao petProductDao;

//	@RequestMapping("/")
	public String PetLogin() {
		return "06/index";

	}

	@RequestMapping("/productSearch")
	public String productSearch(Model model, HttpServletRequest request) {
		String searchName = request.getParameter("productSearch");
		//logger.info(searchName);
		System.out.println(searchName);
		List<PetProductListBean> products = petProductDao.productSearch(searchName);
		model.addAttribute("products", products);
		return "06/ProductInfo";
	}

	@RequestMapping("/ProductInfoCat")
	public String productInfoCat(Model model) {
		List<PetProductListBean> products = petProductDao.productInfoCat();
		model.addAttribute("products", products);
		return "06/ProductInfo";
	}

	@RequestMapping("/ProductInfoDog")
	public String productInfoDog(Model model) {
		List<PetProductListBean> products = petProductDao.productInfoDog();
		model.addAttribute("products", products);
		return "06/ProductInfo";
	}

	@RequestMapping("/productInfoAll")
	public String productInfoAll(Model model) {
		List<PetProductListBean> products = petProductDao.productInfo();
		model.addAttribute("products", products);
		return "06/ProductInfo";
	}

	@RequestMapping("/petProductSale")
	public String petProductSale(Model model) throws Exception {
		List<PetProductListBean> products = petProductDao.productInfo();
		model.addAttribute("products", products);
		return "06/PetProductSaleHome";
	}

//	@RequestMapping("/login")

	public String Petlogin() {
		return "06/PetLogin";
	}

	/**
	 * 會員登入頁面
	 * 
	 * @param request
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */

	// @RequestMapping("/petLoginOrder")
//	public String petLoginOrder(HttpServletRequest request, Model model, HttpSession session) throws Exception {
//		String userName = request.getParameter("userName");
//		String userPassword = request.getParameter("userPassword");
//		petDao.createConn();
//		PetBean emp = petDao.loginVerifi(userName, userPassword);
//		petDao.closeConn();
//		if (emp == null) {
//			return "06/PetLoginError";
//		} else {
//			// model.addAttribute("emp", emp);
//			session.setAttribute("emp", emp);
//			System.out.println(emp);
//			return "redirect:/06/PetOrderAll";
//		}
//	}

	/**
	 * 商品詳細頁,單樣-多樣商品加入購物車
	 * 
	 * @param model
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */

	@RequestMapping("/addProductsToCar")
	public String petProductCarJoin(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		
		List<PetProductListBean> pro = (List<PetProductListBean>) session.getAttribute("productsInCar");
		String[] productIds = request.getParameterValues("productId");
		String[] amounts = request.getParameterValues("amount");
		
		if ((pro == null) || (pro.isEmpty())) { // 如果購物車是空的就叫出SESSION把資料塞進去並返回原頁面

			List<PetProductListBean> productsInCar = petProductDao.addProducts(productIds, amounts);
			session.setAttribute("productsInCar", productsInCar);
			List<PetProductListBean> products = petProductDao.productInfo();
			model.addAttribute("productsInCar", productsInCar);
			model.addAttribute("products", products);
			return "06/PetProductSale";
		} else { // 如果購物車裡面已經有東西就保留原資料並把新資料塞進去並返回原頁面
			List<PetProductListBean> productsInCar = petProductDao.addProducts(productIds, amounts);
			pro = (List<PetProductListBean>) session.getAttribute("productsInCar");
			pro.addAll((List<PetProductListBean>) productsInCar);
			List<PetProductListBean> products = petProductDao.productInfo();
			model.addAttribute("productsInCar", pro);
			model.addAttribute("products", products);
			return "06/PetProductSale";
		}
	}

	/**
	 * 商品詳細頁,單樣商品加入購物車
	 * 
	 * @param model
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/addProductToCar")
	public String petProductCarJoinOne(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		List<PetProductListBean> proSe = (List<PetProductListBean>) session.getAttribute("productsInCar");
		String productId = request.getParameter("productId");
		String amount = request.getParameter("amount");

		if ((proSe == null) || (proSe.isEmpty())) { // 如果proSe購物車為空執行
			// 將所選商品塞入productsInCar並加到session
			List<PetProductListBean> productsInCar = petProductDao.addProduct(productId, amount);
			session.setAttribute("productsInCar", productsInCar);
			// 重新撈取全部商品資料並傳回全部商品頁
			List<PetProductListBean> products = petProductDao.productInfo();
			model.addAttribute("productsInCar", productsInCar);
			model.addAttribute("products", products);
			return "06/PetProductSale";
		} else { // 如果proSe購物車裡面已經有東西就保留原資料並把新資料塞進去並返回原頁面
			List<PetProductListBean> productsInCar = petProductDao.addProduct(productId, amount);
			proSe.addAll((List<PetProductListBean>) productsInCar);
			List<PetProductListBean> products = petProductDao.productInfo();
			model.addAttribute("productsInCar", proSe);
			model.addAttribute("products", products);
			return "06/PetProductSale";
		}

	}

	/**
	 * 移除購物車所選商品
	 */
	@RequestMapping("/petClearCar")
	public String petClearCar(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		List<PetProductListBean> pro = (List<PetProductListBean>) session.getAttribute("productsInCar");
		pro.removeAll(pro);
		List<PetProductListBean> products = petProductDao.productInfo();
		model.addAttribute("productsInCar", pro);
		model.addAttribute("products", products);
		return "06/PetProductSale";
	}

	/*
	 * 會員結帳頁面 會先判斷是否登入 如果沒有則導回登入頁面
	 */

	@RequestMapping("/petOrder")
	public String petOrder(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		Object emp = session.getAttribute("LoginOK");
		if (emp == null) {
			return "redirect:/_01.memberloginPage";
		} else {
			List<PetProductListBean> pro = (List<PetProductListBean>) session.getAttribute("productsInCar");
			model.addAttribute("products", pro);
			return "06/PetOrder";
		}
	}

	/**
	 * 確認用戶訂單資料並串接綠界付款
	 */

	@RequestMapping("/petOrderConfirm")
	public String petOrderDetail(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		// 取得用戶資料SESSION
		MemberBean member = (MemberBean) session.getAttribute("LoginOK");

		// 取得目前購物車內選購商品資料SESSION
		List<PetProductListBean> shoppingCar = (List<PetProductListBean>) session.getAttribute("productsInCar");

		// 接收傳回資料
		String[] productIds = request.getParameterValues("productId");
		String[] amounts = request.getParameterValues("amount");
		String[] productNames = request.getParameterValues("productName");
		String[] prices = request.getParameterValues("price");
		String userAddress = request.getParameter("address");
		String recipient = request.getParameter("name");
		String userPhone = request.getParameter("phone");
		String total = request.getParameter("total");

		// 設定member_order_bean資料塞入傳回值
		OrderBean orderBean = new OrderBean();
		orderBean.setOrder_id(petProductDao.order_id()); // orderId透過DAO呼叫取值
		orderBean.setMember_id(member.getMember_Id());
		orderBean.setTotal(Integer.parseInt(total));
		orderBean.setPhone(userPhone);
		orderBean.setRecipient(recipient);
		orderBean.setAddress(userAddress);

		// 更新member_order table
		OrderBean ob = petProductDao.confirmOrder(orderBean);

		// 更新member_order_detail table 並取得詳細商品資料 塞回綠界測試付款
		List<OrderDetailBean> orderDeatil = petProductDao.confirmOrderDetail(orderBean, productIds, productNames, amounts, prices);
		String proAll = "";
		for (OrderDetailBean od : orderDeatil) {
			proAll += "商品名稱:" + od.getProduct_name() + ",數量:" + od.getAmount() + ",金額:" + od.getTotal() + "#";
		}
		// 更新商品資料庫存
		// petProductDao.confirmbBuy(productIds, amounts);

		// 移除購物車
		shoppingCar.removeAll(shoppingCar);

		// 得到DB產生的新的訂單編號
		String orderN = orderBean.getOrder_id();
		Date orderDate = ob.getOrder_date();
//				Date date = new Date();
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
//				String dateStr = sdf.format(date);
		String dateStr = DateFormatUtils.format(orderDate, "yyyy/MM/dd HH:mm:ss");

		// 綠界科技串接API
		AioCheckOutOneTime All = new AioCheckOutOneTime();
		All.setMerchantID("2000132");
		All.setMerchantTradeNo(orderN);
		All.setMerchantTradeDate(dateStr);
		All.getPaymentType();
		All.setTotalAmount(total);
		All.setTradeDesc("Pet陪你購物");
		All.setItemName(proAll);
		// 當消費者付款完成後，綠界會將付款結果參數以幕後(Server POST)回傳到該網址。
		All.setReturnURL("http://localhost:8080/Pet/06/orderNumber");
		// 當消費者付款完成後，綠界會將付款結果參數以幕前(Client POST)回傳到該網址。
		All.setOrderResultURL("http://localhost:8080/Pet/06/orderNumber");
		All.getChoosePayment();
		All.getEncryptType();
		AllInOne allInOne = new AllInOne();
		// 自動產生型態即為form表單 傳回網頁即可執行
		String ECPAYorderHtml = allInOne.aioCheckOut(All, null);
		System.out.println("ECPAYorderHtml=" + ECPAYorderHtml);
		session.setAttribute("orderN", orderN);

		model.addAttribute("ECPAYorderHtml", ECPAYorderHtml);
		return "06/ECPay";
	}

	/**
	 * 判斷付款是否成功 如果成功更新庫存商品資料
	 */

	@RequestMapping("/orderNumber")
	public String orderNumber(HttpServletRequest request, Model model, HttpSession session, OrderNumberRequest orderRequest) throws Exception {
		String orderN = (String) session.getAttribute("orderN");

		// 確認綠界回傳資料是否正確 正確則更新訂單
		if (merchantId.equals(orderRequest.getMerchantID()) && orderRequest.getRtnCode().equals("1") && orderRequest.getRtnMsg().equals("Succeeded")
			&& orderRequest.getMerchantTradeNo().equals(orderN)) {
			// 更新商品資料庫存
			petProductDao.confirmbBuy(orderN);
			petProductDao.updateECpay(orderRequest.getTradeNo(), orderN);
			model.addAttribute("orderNumber", orderN);
			return "06/PetOrderNumber";
		} else { // 失敗回傳
			petProductDao.updateECpayErr(orderRequest.getRtnCode(), orderRequest.getTradeNo(), orderN);
			model.addAttribute("orderNumber", orderN);
			return "06/PetOrderNumberErr";
		}
	}

	/**
	 * 傳回用戶ID的所有訂單詳情
	 * 
	 * @return orderList
	 */

	@RequestMapping("/PetOrderAll")
	public String petOrderAll(Model model, HttpSession session) throws Exception {
		Object emp = session.getAttribute("LoginOK");
		if (emp == null) {
			return "redirect:/_01.memberloginPage";
		} else {
			MemberBean member = (MemberBean) session.getAttribute("LoginOK");
			String memberId = member.getMember_Id();
			System.out.println(memberId);
			List<OrderBean> orderList = petProductDao.orderAll(memberId);
			List<OrderDetailBean> orderListDetail = petProductDao.orderDetail(orderList);
			model.addAttribute("orderList", orderList);
			model.addAttribute("userName", member.getName());
			model.addAttribute("orderListDetail", orderListDetail);
			return "06/PetOrderAll";
		}
	}

	/**
	 * 得到單樣商品ID詳細資料並傳回商品詳細資料頁面
	 * 
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */

	@RequestMapping("/productDetail")
	public String petProductDetail(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		String selectPrdId = request.getParameter("selectPrdId");
		PetProductListBean productDeatail = petProductDao.findProductId(Integer.parseInt(selectPrdId));
		model.addAttribute("product", productDeatail);
		return "06/PetProductDetail";
	}

	@GetMapping("/downloadFile/{fileName:.+}")
	public ResponseEntity<Resource> downloadFile(@PathVariable String fileName, HttpServletRequest request) throws MalformedURLException {
		// logger.info("fileName:{}", fileName);
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
