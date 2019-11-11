package com.web.controller._01;


import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.model._01.MemberBean;
import com.web.model._01.PetBean;
import com.web.service.impl._01.MemberService;
import com.web.service.impl._01.PetService;

@Controller
public class MemberController {

	MemberService memberService;

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	PetService petService;

	@Autowired
	public void setPetService(PetService petService) {
		this.petService = petService;
	}

	public MemberController() {

	}

//	@RequestMapping(value = "/")
	public String home(Model model) {
		model.addAttribute("MemberBean", new MemberBean());
		// 註冊會員
//		return "_01/memberinsert";
		// 會員登入
		return "_01/login";
//		return null;
	}

	// 會員登入
	@RequestMapping(value = "/_01.loginMember", method = RequestMethod.POST)
	public String loginMember(MemberBean memberBean, HttpServletRequest request) {
		System.out.println("qwe");
		String userId = memberBean.getMember_Id();
		System.out.println("userId:" + userId);
		String password = memberBean.getPassword();
		System.out.println("password:" + password);
		MemberBean b1 = memberService.checkIDPassword(userId, password);
		System.out.println(b1);

		if (b1 != null) {
			HttpSession session = request.getSession();
			session.setAttribute("LoginOK", b1);
			return "redirect: login";// 登入成功
		} else {
			return "forward: loginErr";// 登入失敗
		}
	}

	// 登入成功
	@RequestMapping(value = "login")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String n1 = loginToken.getName();
		System.out.println("n1:" + n1);
		return "redirect:/article";
	}

	// 登入失敗
	@RequestMapping(value = "loginErr")
	public String loginErr() {
		return "_01/login";
	}

	// 註冊會員
	@RequestMapping(value = "/_01.saveMember", method = RequestMethod.POST)
	public String saveMember(MemberBean memberBean) {
		// 判斷會員帳號是否註冊過
		boolean f1 = memberService.idExists(memberBean.getMember_Id());
		if (f1 != true) {
			memberService.saveMember(memberBean);
			return "redirect: member";// 註冊成功
		} else {
			return "forward: memberErr";// 註冊失敗
		}
	}

	// 註冊成功
	@RequestMapping(value = "member")
	public String member() {
		return "_01/ttt";
	}

	// 註冊失敗
	@RequestMapping(value = "memberErr")
	public String memberErr() {
		return "_01/memberinsert";
	}

	// 新增寵物
	@RequestMapping(value = "/_01.savePet", method = RequestMethod.POST)
	public String savePet(HttpServletRequest request, PetBean pb) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String id = loginToken.getMember_Id();
		pb.setMember_id(id);
		petService.savePet(pb);
		return "";
	}

	// 刪除寵物
	@RequestMapping(value = "/_01.deletePet", method = RequestMethod.POST)
	public String deletePet(HttpServletRequest request, PetBean pb) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String id = loginToken.getMember_Id();
		pb.setMember_id(id);
		petService.deletePet(pb);
		return "";
	}

	// 修改寵物
	@RequestMapping(value = "/_01.updataPet", method = RequestMethod.POST)
	public String updataPet(HttpServletRequest request, PetBean pb) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String id = loginToken.getMember_Id();
		pb.setMember_id(id);
		petService.updataPet(pb);

		return "_01/ttt";
	}
	
	//查詢全部寵物
	public List<PetBean> queryAllPet(HttpServletRequest request,MemberBean mb){
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String id = loginToken.getMember_Id();
		mb.setMember_Id(id);
		List<PetBean> list = petService.queryAllPet(mb);
		return list;


	}
}
