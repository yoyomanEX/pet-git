package com.web.controller._01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.model._01.CompanyBean;
import com.web.service.impl._01.CompanyService;

@Controller
public class CompanyController {
	CompanyService companyService;

	@Autowired
	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}
	
	public CompanyController() {
		
	}

	@RequestMapping(value = "/")
	public String home(Model model) {
		model.addAttribute("CompanyBean", new CompanyBean());
		// 註冊廠商
		return "_01/companyinsert";
		// 廠商登入
//		return "_01/companylogin";
//		return null;
	}

	// 廠商登入
	@RequestMapping(value = "/_01.loginCompany", method = RequestMethod.POST)
	public String loginMember(CompanyBean companyBean, HttpServletRequest request) {
		System.out.println("qwe");
		String userId = companyBean.getCompany_id();
		System.out.println("userId:" + userId);
		String password = companyBean.getCompany_password();
		System.out.println("password:" + password);
		CompanyBean c1 = companyService.checkIDPassword(userId, password);
		System.out.println(c1);

		if (c1 != null) {
			HttpSession session = request.getSession();
			session.setAttribute("CompanyLoginOK", c1);
			return "redirect: companylogin";// 登入成功
		} else {
			return "forward: companyloginErr";// 登入失敗
		}
	}

	// 登入成功
	@RequestMapping(value = "companylogin")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CompanyBean loginToken = (CompanyBean) session.getAttribute("CompanyLoginOK");
		String n1 = loginToken.getCompany_name();
		System.out.println("n1:" + n1);
		return "_01/ttt";
	}

	// 登入失敗
	@RequestMapping(value = "companyloginErr")
	public String loginErr() {
		return "_01/companylogin";
	}

	// 註冊廠商
	@RequestMapping(value = "/_01.saveCompany", method = RequestMethod.POST)
	public String saveCompany(CompanyBean companyBean) {
		// 判斷廠商帳號是否註冊過
		boolean f1 = companyService.idExists(companyBean.getCompany_id());
		if (f1 != true) {
			companyService.saveCompany(companyBean);
			return "redirect: company";// 註冊成功
		} else {
			return "forward: companyErr";// 註冊失敗
		}
	}

	// 註冊成功
	@RequestMapping(value = "company")
	public String company() {
		return "_01/ttt";
	}

	// 註冊失敗
	@RequestMapping(value = "companyErr")
	public String companyErr() {
		return "_01/companyinsert";
	}

}
