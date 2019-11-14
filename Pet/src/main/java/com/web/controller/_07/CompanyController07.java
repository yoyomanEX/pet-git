package com.web.controller._07;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.web.model._01.CompanyBean;
import com.web.service.impl._07.CompanyService07;



//廠商後台相關登入頁面
@Controller(value = "CompanyController")
public class CompanyController07 {

	CompanyService07 service;

	@Autowired
	public void setService(CompanyService07 service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	// (站方)廠商管理
	@RequestMapping("/adminCompanyManagement")
	public String companyManagement(Model model) {
		model.addAttribute("adminCompanyManagement");
		return "/_07/adminCompanyManagement";
	}

	

	// 廠商登入頁面
	@RequestMapping(value = "/companyLogin")
	public String companyLoginWeb(Model model) {
		model.addAttribute("companyLogin");
		return "/_07/companyLogin";
	}

	// 確認廠商帳號密碼
	@RequestMapping(value = "/checkCompanyLogin")
	public String checkCompanyIdPassword(Model model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");

		if (service.checkCompanyIdPassword(id, pwd) != null) {
			model.addAttribute("companyLogin", service);
			return "redirect:/CompanyManagement";
		}
		return "/_07/companyLogin";
	}
	@RequestMapping("/CompanyManagement")
	public String processCheckCompanyIdPassword(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CompanyBean loginToken = (CompanyBean) session.getAttribute("CompanyLoginOK");
		loginToken.getCompany_id();
		return "/_07/companyManagement";	
	}
	
	
	// 廠商申請表格
	@RequestMapping("/companyApplyFor1")
	public String companyApplyFor1() {
		return "/_07/companyApplyFor";
	}

	// 新增廠商資料(待審核)
	@RequestMapping("/companyApplyFor2")
	public String companyApplyFor2(Model model, HttpServletRequest request) {
		String company_id = request.getParameter("company_id");
		String company_name = request.getParameter("company_name");
		String company_password = request.getParameter("company_password");
		String company_add = request.getParameter("company_add");
		String company_tel = request.getParameter("company_tel");
		String company_email = request.getParameter("company_email");
		String contact_name = request.getParameter("contact_name");
		String status = request.getParameter("status");
		Integer status1 = Integer.parseInt(status);

		if (!company_id.isEmpty() && !company_name.isEmpty() && !company_password.isEmpty() && !company_add.isEmpty()
				&& !company_tel.isEmpty() && !company_email.isEmpty() && !contact_name.isEmpty()
				&& !contact_name.isEmpty()) {
			CompanyBean bean = new CompanyBean();
			bean.setCompany_id(company_id);
			bean.setCompany_password(company_password);
			bean.setCompany_name(company_name);
			bean.setCompany_add(company_add);
			bean.setCompany_tel(company_tel);
			bean.setCompany_email(company_email);
			bean.setContact_name(contact_name);
			bean.setStatus(status1);

			service.addCompany(bean);
//			model.addAttribute("allProduct", bean);
			return "redirect:/companyInfoPendingReview";
		} else {
			return "/_07/companyApplyFor";
		}
	}
	
	@RequestMapping("/companyInfoPendingReview")
	public String processCompanyApplyFor2() {
		return "/_07/companyInfoPendingReview";
	}

	// (站方)待審核廠商
	@RequestMapping("/reviewCompany")
	public void ReviewCompany(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		List<CompanyBean> list = service.reviewCompany();
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.getWriter().print(json);
		System.out.println("廠商資料"+json);
	}
	// (站方)審核過廠商列表
		@RequestMapping("/adminCompanyList")
		public void companyList(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			List<CompanyBean> list = service.queryAllCompany();
			
			Gson gson = new Gson();
			String data = gson.toJson(list);
			response.getWriter().print(data);
			System.out.println("上架廠商列表="+data);
	
		}
		// (站方)下架廠商列表
		@RequestMapping(value = "/obtainedCompany")
		public void obtainedCompany(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			List<CompanyBean> list = service.obtainedCompany();
			Gson gson = new Gson();
			String json = gson.toJson(list);
			response.getWriter().print(json);
			System.out.println("下架廠商列表="+json);
			
		}
		
		// (站方)下架廠商列表
				@RequestMapping(value = "/rejectCompany")
				public void rejectCompany(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
					request.setCharacterEncoding("UTF-8");
					response.setContentType("text/html;charset=UTF-8");
					
					List<CompanyBean> list = service.rejectCompany();
					Gson gson = new Gson();
					String json = gson.toJson(list);
					response.getWriter().print(json);
					System.out.println("下架廠商列表="+json);
					
				}
		
		

	// (站方)廠商狀態變更(拒絕申請)
	@RequestMapping("/rejectByCompanyId")
	public void rejectByCompanyId(Model model, HttpServletRequest request) {
		String company_id = request.getParameter("key1");
		String status = request.getParameter("key2");
		Integer status1 = Integer.parseInt(status);

		CompanyBean bean = new CompanyBean();
		bean.setCompany_id(company_id);
		bean.setStatus(status1);

		service.rejectByCompanyId(bean);
		
	}

	// (站方)廠商狀態變更(接受申請)
	@RequestMapping("/acceptByCompanyId")
	public void acceptByCompanyId(Model model, HttpServletRequest request) {
		String company_id = request.getParameter("key1");
		String status = request.getParameter("key2");
		Integer status1 = Integer.parseInt(status);

		CompanyBean bean = new CompanyBean();
		bean.setCompany_id(company_id);
		bean.setStatus(status1);

		service.acceptByCompanyId(bean);
	//	service.reviewCompany();
//		model.addAttribute("checkCompany", list);
//		return "/_07/adminCheckCompany";
	}

	// (站方)廠商狀態變更(下架廠商)
	@RequestMapping("/obtainedByCompanyId")
	public void obtainedByCompanyId(Model model, HttpServletRequest request) {
		String company_id = request.getParameter("key1");
		String status = request.getParameter("key2");
		Integer status1 = Integer.parseInt(status);

		CompanyBean bean = new CompanyBean();
		bean.setCompany_id(company_id);
		bean.setStatus(status1);
		service.obtainedByCompanyId(bean);
		
	}

	
	// (站方)廠商狀態變更(上架廠商)
	@RequestMapping("/acceptByCompanyId1")
	public void acceptByCompanyId1(Model model, HttpServletRequest request) {
		String company_id = request.getParameter("key1");
		String status = request.getParameter("key2");
		Integer status1 = Integer.parseInt(status);

		CompanyBean bean = new CompanyBean();
		bean.setCompany_id(company_id);
		bean.setStatus(status1);

		service.acceptByCompanyId(bean);
		
	
	}

}
