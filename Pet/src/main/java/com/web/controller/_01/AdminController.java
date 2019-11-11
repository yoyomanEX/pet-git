package com.web.controller._01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.model._01.AdminBean;
import com.web.service.impl._01.AdminService;

@Controller
public class AdminController {
	AdminService adminService;

	@Autowired
	public void setMemberService(AdminService adminService) {
		this.adminService = adminService;
	}

//	@RequestMapping(value = "/")
	public String home(Model model) {
		model.addAttribute("AdminBean", new AdminBean());
		// 註冊管理員
//		return "_01/admininsert";
		// 管理員登入
		return "_01/adminlogin";
//		return null;
	}

	// 管理員登入
	@RequestMapping(value = "/_01.loginAdmin", method = RequestMethod.POST)
	public String loginAdmin(AdminBean adminBean, HttpServletRequest request) {
		System.out.println("qwe");
		String userId = adminBean.getAdmin_Id();
		System.out.println("userId:" + userId);
		String password = adminBean.getPassword();
		System.out.println("password:" + password);
		AdminBean a1 = adminService.checkIDPassword(userId, password);
		System.out.println(a1);

		if (a1 != null) {
			HttpSession session = request.getSession();
			session.setAttribute("AdminLoginOK", a1);
			return "redirect: adminlogin";// 登入成功
		} else {
			return "forward: adminloginErr";// 登入失敗
		}
	}

	// 登入成功
	@RequestMapping(value = "adminlogin")
	public String adminlogin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		AdminBean loginToken = (AdminBean) session.getAttribute("AdminLoginOK");
		String n1 = loginToken.getName();
		System.out.println("n1:" + n1);
		return "_01/ttt";
	}

	// 登入失敗
	@RequestMapping(value = "adminloginErr")
	public String adminloginErr() {

		return "_01/adminlogin";

	}

	// 註冊管理員
	@RequestMapping(value = "/_01.saveAdmin", method = RequestMethod.POST)
	public String saveAdmin(AdminBean adminBean) {
		// 判斷管理員帳號是否註冊過
		boolean f1 = adminService.idExists(adminBean.getAdmin_Id());
		if (f1 != true) {
			adminService.saveAdmin(adminBean);
			return "redirect: admin";// 註冊成功
		} else {
			return "forward: adminErr";// 註冊失敗
		}
	}

	// 註冊成功
	@RequestMapping(value = "admin")
	public String admin() {
		return "_01/ttt";
	}

	// 註冊失敗
	@RequestMapping(value = "adminErr")
	public String adminErr() {
		return "_01/admininsert";
	}

	// 進入修改管理員頁面
	@RequestMapping(value = "/_01.updataAdminPage")
	public String updataAdminPage() {

		return "_01/login";
	}

	// 修改管理員
	@RequestMapping(value = "/_01.updataAdmin", method = RequestMethod.POST)
	public String updataAdmin(AdminBean ab) {
		adminService.updataAdmin(ab);

		return "_01/ttt";
	}
}
