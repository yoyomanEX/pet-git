package com.web.controller._01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.model._01.MemberBean;
import com.web.service.impl._01.MemberService;

@Controller
public class MemberController {
	
	MemberService memberService;
	
	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public MemberController() {
		
	}
	
	@RequestMapping(value = "/")
	public String home(Model model) {
		model.addAttribute("MemberBean", new MemberBean());
//		return "_01/memberinsert";
		return "_01/login";
//		return null;
//		return "_02/adminarticle";
	}
	
	@RequestMapping(value = "/_01.loginMember", method = RequestMethod.POST)
	public String loginMember(MemberBean memberBean,HttpServletRequest request ) {
		System.out.println("qwe");
		String userId = memberBean.getMember_Id();
		System.out.println("userId:"+userId);
		String password = memberBean.getPassword();
		System.out.println("password:"+password);
		MemberBean b1 = memberService.checkIDPassword(userId, password);
		System.out.println(b1);
		
		HttpSession session = request.getSession();
		session.setAttribute("LoginOK", b1);
		return "redirect: login";
	}
	
	@RequestMapping(value = "login")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String n1 = loginToken.getName();
		System.out.println("n1:"+n1);
		return "redirect:/article";

		
	}
	
	@RequestMapping(value = "/_01.saveMember", method = RequestMethod.POST)
	public String saveMember(MemberBean memberBean) {
		memberService.saveMember(memberBean);
		return "redirect: member";
	}
	
	@RequestMapping(value = "member")
	public String member() {
		return "_01/ttt";
	}

}
