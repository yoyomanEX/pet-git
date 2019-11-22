package com.web.controller._01;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.model._01.CompanyBean;
import com.web.model._01.validators.CompanyValidator;
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

//	@RequestMapping(value = "/")
	public String home(Model model) {
		model.addAttribute("CompanyBean", new CompanyBean());
		// 註冊廠商
//		return "_01/companyinsert";
		// 廠商登入
		return "_01/companylogin";
//		return null;
	}

	// 廠商登入頁面
	@RequestMapping(value = "/_01.loginCompanyPage")
	public String loginCompanyPage(Model model) {
		model.addAttribute("CompanyBean", new CompanyBean());

		// 廠商登入
		return "_01/companylogin";
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
			return "forward:/companyloginErr";// 登入失敗
		}
	}

	// 登入成功
	@RequestMapping(value = "companylogin")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CompanyBean loginToken = (CompanyBean) session.getAttribute("CompanyLoginOK");
		String n1 = loginToken.getCompany_name();
		System.out.println("n1:" + n1);

		return "/_07/companyManagementIndex";
//		return "redirect:/_01.updataCompanyPage";

	}

	// 登入失敗
	@RequestMapping(value = "companyloginErr")
	public String loginErr(@ModelAttribute("CompanyBean") CompanyBean companyBean) {
		return "_01/companylogin";
	}

	// 註冊廠商頁面
	@RequestMapping(value = "/_01.saveCompanyPage")
	public String saveCompanyPage(Model model) {
		model.addAttribute("CompanyBean", new CompanyBean());
		// 註冊廠商
		return "_01/companyinsert";
	}

	// 註冊廠商
	@RequestMapping(value = "/_01.saveCompany", method = RequestMethod.POST)
	public String saveCompany(@ModelAttribute("CompanyBean") CompanyBean companyBean, BindingResult result) {
		// 驗證註冊廠商的格式
		CompanyValidator v1 = new CompanyValidator();
		v1.validate(companyBean, result);
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "_01/companyinsert";
		}
		// 判斷廠商帳號是否註冊過
		boolean f1 = companyService.idExists(companyBean.getCompany_id());
		if (f1 != true) {
			companyService.saveCompany(companyBean);
			return "redirect: company";// 註冊成功
		} else {
			return "forward:/companyErr";// 註冊失敗
		}
	}

	// 註冊成功
	@RequestMapping(value = "company")
	public String company() {
		return "redirect: _01.loginCompanyPage";
	}

	// 註冊失敗
	@RequestMapping(value = "companyErr")
	public String companyErr(@ModelAttribute("CompanyBean") CompanyBean companyBean) {
		return "_01/companyinsert";
	}

	// 進入修改廠商頁面
	@RequestMapping(value = "/_01.updataCompanyPage")
	public String updataCompanyPage(Model model) {
		model.addAttribute("CompanyBean", new CompanyBean());
		return "_01/companyupdate";
	}

	// 修改廠商
	@RequestMapping(value = "/_01.updataCompany", method = RequestMethod.POST)
	public String updataCompany(@ModelAttribute("CompanyBean") CompanyBean cb, HttpServletRequest request, BindingResult result) {
		// 驗證註冊廠商的格式
		CompanyValidator v1 = new CompanyValidator();
		v1.validate(cb, result);
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "_01/companyupdate";
		}
		companyService.updataCompany(cb);
		HttpSession session = request.getSession();
		session.setAttribute("CompanyLoginOK", cb);
		return "_01/ttt";

	}
	//廠商登出
	@RequestMapping(value = "/_01.getCompanyLogout")
	public String getCompanyLogout(Model model, HttpServletRequest request) {
		model.addAttribute("CompanyBean", new CompanyBean());
		HttpSession session = request.getSession();
		session.invalidate();
		return "_01/companylogin";
	}

}
