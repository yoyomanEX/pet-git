
package com.web.controller._07;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.model._01.AdminBean;
import com.web.service.impl._07.AdminService07;


//站方後台管理部分
@Controller(value = "AdminController")
public class AdminController {
	AdminService07 service;

	@Autowired
	public void setService(AdminService07 service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	//後台管理頁面
	@RequestMapping("_07/adminManagement")
	public String adminManagement(Model model) {
		AdminBean aa = new AdminBean();
		model.addAttribute("adminManagement", aa);
		return "/_07/adminManagement";
	}
	//管理員登入頁面
	@RequestMapping("/adminLogin" )
	public String adminLogin(Model model) {
		model.addAttribute("adminLogin");
		return "/_07/adminLogin";
	}
	@RequestMapping(value ="/checkAdminLogin")
	public String checkAdminIdPassword(Model model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");

		if (service.checkAdminIdPassword(id, pwd) != null) {
			model.addAttribute("adminLogin", service);
			return "redirect:/_07/adminManagement";
		} else {
			return "foward:/_07/adminLogin";
		}

	}
	
}
