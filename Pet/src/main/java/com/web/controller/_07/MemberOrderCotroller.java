package com.web.controller._07;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.model._07.MemberOrderBean;

import com.web.model._07.MemberOrderDetailBean;
import com.web.service.impl._07.MemberOrderDetailService;
import com.web.service.impl._07.MemberOrderService;


@Controller
public class MemberOrderCotroller {

	Gson gson;

	public MemberOrderCotroller() {
		GsonBuilder builder = new GsonBuilder().setDateFormat("yyyy-MM-dd");
		gson = builder.create();
	}

	MemberOrderDetailService detailService;
	MemberOrderService service;

	@Autowired
	public void setService(MemberOrderService service) {
		this.service = service;
	}

	@Autowired
	public void setDetailService(MemberOrderDetailService detailService) {
		this.detailService = detailService;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	@RequestMapping("/orderManagement")
	public String companyProductTransaction() {
		return "/_07/companyOrderManagement";
	}

	@RequestMapping("/orderUnprocessed")
	public String companyManagement(Model model, HttpServletRequest request) {

		return "/_07/companyOrderUnprocessed";
	}

	@RequestMapping("/queryOrder")
	public String queryOrder(Model model) {
		return "/_07/companyOrderQuery";
	}

	// 搜尋全部的訂單
	@RequestMapping("/queryOrder1")
	public String queryOrder1(Model model, HttpServletRequest request) throws ParseException {
		String s1 = request.getParameter("status");
		Integer status1 = Integer.parseInt(s1);

		String company_id = request.getParameter("company_id");
		System.out.println(company_id);
		String startdate = request.getParameter("startdate") + " 00:00:00";
		String enddate = request.getParameter("enddate") + " 23:59:59";
		List<MemberOrderBean> list = service.queryAllOrderByStatus(company_id, startdate, enddate, status1);
		model.addAttribute("queryOrder", list);
		return "/_07/companyOrderQuery";
	}

	// 搜尋未處理訂單
	@RequestMapping("/unprocessedOrder")
	public String unprocessedOrder(Model model, HttpServletRequest request) throws ParseException {

		String company_id = request.getParameter("company_id");
		String s1 = request.getParameter("status");
		Integer status = Integer.parseInt(s1);

		MemberOrderBean bean = new MemberOrderBean();
		bean.setCompany_id(company_id);

		bean.setStatus(status);
		List<MemberOrderBean> list = service.queryUnprocessedOrder(bean);

		MemberOrderDetailBean detailBean = new MemberOrderDetailBean();
		detailBean.setCompany_id(company_id);

		List<MemberOrderDetailBean> list1 = detailService.queryAllOrder(detailBean);
		System.out.println("detailBean=" + list1);

		model.addAttribute("unprocessedOrder", list);
		model.addAttribute("orderDetail", list1);

		return "/_07/companyOrderUnprocessed";
	}

	// 搜尋未處理訂單
	@RequestMapping("/processed")
	public String processed(Model model, HttpServletRequest request) throws ParseException {
		String company_id = request.getParameter("company_id");
		String o1 = request.getParameter("order_id");
		Long order_id = Long.parseLong(o1);
		String s1 = request.getParameter("status");
		Integer status = Integer.parseInt(s1);

		MemberOrderBean bean = new MemberOrderBean();
		bean.setCompany_id(company_id);
		bean.setStatus(status);
		bean.setOrder_id(order_id);

		if (status == 1) {
			service.processedUnshippedOrder(bean);

			List<MemberOrderBean> list = service.queryUnprocessedOrder(bean);
			System.out.println("unprocessedOrder=" + list);

			MemberOrderDetailBean detailBean = new MemberOrderDetailBean();
			detailBean.setCompany_id(company_id);

			List<MemberOrderDetailBean> list1 = detailService.queryAllOrder(detailBean);
			System.out.println("detailBean=" + list1);
			model.addAttribute("unprocessedOrder", list);
			model.addAttribute("orderDetail", list1);
			return "/_07/companyOrderUnprocessed";
		} else if (status == 2) {
		}
		return s1;

	}

	// 訂單改已出貨
	@RequestMapping("/changeToShipped")
	public String shipped(Model model, HttpServletRequest request) throws ParseException {
		Timestamp time = new Timestamp(System.currentTimeMillis());// 獲取系統當前時間
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		String timeStr = df.format(time);
		time = Timestamp.valueOf(timeStr);
		System.out.println(time);// 2017-05-06 15:54:21.0

		String company_id = request.getParameter("company_id");
		String o1 = request.getParameter("order_id");
		Long order_id = Long.parseLong(o1);
		String s1 = request.getParameter("status");
		Integer status = Integer.parseInt(s1);
		MemberOrderBean bean = new MemberOrderBean();
		bean.setCompany_id(company_id);
		bean.setStatus(status);
		bean.setOrder_id(order_id);
		bean.setShip_date(time);
		service.processedShippedOrder(bean);

		List<MemberOrderBean> list = service.queryUnshippedOrder(bean);

		MemberOrderDetailBean detailBean = new MemberOrderDetailBean();
		detailBean.setCompany_id(company_id);

		List<MemberOrderDetailBean> list1 = detailService.queryAllOrder(detailBean);
		System.out.println("detailBean=" + list1);

		model.addAttribute("unshippedOrder", list);
		model.addAttribute("orderDetail", list1);
		return "_07/companyOrderUnshipped";

	}

	// 訂單明細
	@RequestMapping("/detailOrder")
	public String detailOrder(Model model, HttpServletRequest request) throws ParseException {

		String company_id = request.getParameter("company_id");
		String s1 = request.getParameter("status");
		Integer status = Integer.parseInt(s1);

		MemberOrderBean bean = new MemberOrderBean();
		bean.setCompany_id(company_id);
		bean.setStatus(status);
		List<MemberOrderBean> list = service.queryUnprocessedOrder(bean);

		model.addAttribute("unprocessedOrder", list);

		return "/_07/companyOrderUnprocessed";
	}

	// 搜尋未出貨訂單
	@RequestMapping("/unshippedOrder")
	public String unshippedOrder(Model model, HttpServletRequest request) throws ParseException {
		String company_id = request.getParameter("company_id");
		String s1 = request.getParameter("status");
		Integer status = Integer.parseInt(s1);

		MemberOrderBean bean = new MemberOrderBean();
		bean.setCompany_id(company_id);
		bean.setStatus(status);

		List<MemberOrderBean> list = service.queryUnshippedOrder(bean);
		model.addAttribute("unshippedOrder", list);

		return "/_07/companyOrderUnshipped";
	}

	// 搜尋已出貨訂單
	@RequestMapping("/shippedOrder")
	public String shippedOrder(Model model, HttpServletRequest request) throws ParseException {
		String company_id = request.getParameter("company_id");
		String s1 = request.getParameter("status");
		Integer status = Integer.parseInt(s1);

		MemberOrderBean bean = new MemberOrderBean();
		bean.setCompany_id(company_id);
		bean.setStatus(status);

		List<MemberOrderBean> list = service.queryshippedOrder(bean);
		model.addAttribute("shippedOrder", list);

		return "_07/companyOrderShipped";
	}

	// AJAX搜尋訂單
	@RequestMapping("/queryOrderByStatus")
	public void queryAllOrderByStatus(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String company_id = request.getParameter("key3");
		System.out.println(company_id);
		String startdate = request.getParameter("key1") + " 00:00:00";
		String enddate = request.getParameter("key2") + " 23:59:59";

		String s1 = request.getParameter("key4");
		Integer status = Integer.parseInt(s1);

		List<MemberOrderBean> queryAllOrderByStatus = service.queryAllOrderByStatus(company_id, startdate, enddate,
				status);
		System.out.println("You called===>queryAllOrderByStatus");
		Gson gson = new Gson();
		String json3 = gson.toJson(queryAllOrderByStatus);
		response.getWriter().print(json3);
		System.out.println("You called json的值= status==3: " + json3);

	}

	// AJAX搜尋訂單明細
	@RequestMapping("/queryDetail")
	public void queryDetail(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String order_id = request.getParameter("key1");
		Long o1 = Long.parseLong(order_id);
		System.out.println(o1);
		MemberOrderDetailBean bean = new MemberOrderDetailBean();
		bean.setOrder_id(o1);

		ArrayList<MemberOrderDetailBean> list = detailService.queryByOrderId(bean);
		System.out.println("You called===> queryDetail");
		Gson gson = new Gson();
		String json = gson.toJson(list);
		System.out.println("訂單明細" + json);
		response.getWriter().print(json);
		
	}

	@RequestMapping("/companyOrderCharts")
	public String companyOrderCharts() {
		return "/_07/companyOrderCharts";
	}

	@RequestMapping(value = "/companyOrderAmount", produces = "application/json")
	public @ResponseBody ArrayList<MemberOrderDetailBean> companyOrderAmount(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String company_id = request.getParameter("key3");
		String startdate = request.getParameter("key1") + " 00:00:00";
		String enddate = request.getParameter("key2") + " 23:59:59";

		ArrayList<MemberOrderDetailBean> list = detailService.queryOrderProductTotalAmount(startdate, enddate,
				company_id);

		System.out.println("list====> " + list);
		HttpSession session = request.getSession();
		session.setAttribute("list", list);

		return list;

	}

	// URL為 /members, 搭配 GET方法可以傳回所有紀錄。
	// produces屬性說明產生之資料的格式: produces = "application/vnd.ms-excel"
	// 本方法可以Excel格式傳回所有Member紀錄
//	@RequestMapping(value = "/companyOrderList", method = RequestMethod.GET, produces = "application/vnd.ms-excel")
//	public String queryyOrderListExcel(Model model, HttpServletRequest request,HttpServletResponse response) throws IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		List<MemberOrderBean> orderList = service.queryAllOrder();
//		System.out.println("test excel="+orderList);
//		model.addAttribute("orderCharts", orderList);
//		return "_07/showOrders";
//	}
	@RequestMapping(value = "/companyOrderList1", method = RequestMethod.GET, produces = "application/vnd.ms-excel")
	public String queryyOrderListExcel1(Model model, HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String company_id = request.getParameter("company_id");
		System.out.println(company_id);
		String startdate = request.getParameter("startdate") + " 00:00:00";
		String enddate = request.getParameter("enddate") + " 23:59:59";

		
		ArrayList<Map> orderList = service.queryOrderChartsList(startdate, enddate, company_id);
		System.out.println("test excel="+orderList);
		model.addAttribute("orderCharts", orderList);
		
		return "_07/showOrders";
		
	}
	
//	// URL為 /members, 搭配 GET方法可以傳回所有紀錄。
//		// produces屬性說明產生之資料的格式: produces = "application/pdf"
//		// 本方法可以 PDF格式傳回所有Member紀錄
//		@RequestMapping(value = "/companyOrderList2", method = RequestMethod.GET, 
//				produces = "application/pdf")
//		public String queryAllMembersPDF(Model model,HttpServletRequest request,HttpServletResponse response) {
//			String company_id = request.getParameter("company_id");
//			System.out.println(company_id);
//			String startdate = request.getParameter("startdate") + " 00:00:00";
//			String enddate = request.getParameter("enddate") + " 23:59:59";
//
//			
//			ArrayList<MemberOrderBean> orderList = service.queryOrderChartsList(startdate, enddate, company_id);
//			System.out.println("test pdf="+orderList);
//			model.addAttribute("orderChartsPdf", orderList);
//			
//			return "_07/showOrders";
//		}

}
