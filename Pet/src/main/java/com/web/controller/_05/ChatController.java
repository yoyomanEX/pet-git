package com.web.controller._05;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.model._01.MemberBean;
import com.web.service.impl._03.FriendService;
@Controller
public class ChatController {
	FriendService friendService;
	@Autowired
	public void setService(FriendService friendService) {
		this.friendService = friendService;
	}


	 @RequestMapping(value = "dogroom")
	 public String dogroom(MemberBean memberBean,HttpServletRequest request,Model model) {
	  HttpSession session = request.getSession();
	  
	  session.setAttribute("name", memberBean.getName());
	  session.setAttribute("room", memberBean.getTel());
	//  MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
	  return "_05/dogroom";
	 }
	 @RequestMapping(value = "catroom")
	 public String catroom(MemberBean memberBean,HttpServletRequest request,Model model) {
	  HttpSession session = request.getSession();
	  
	  session.setAttribute("name", memberBean.getName());
	  session.setAttribute("room", memberBean.getTel());
	//  MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
	  return "_05/catroom";
	 }
	 @RequestMapping(value = "petroom")
	 public String prtroom(MemberBean memberBean,HttpServletRequest request,Model model) {
	  HttpSession session = request.getSession();
	  
	  session.setAttribute("name", memberBean.getName());
	  session.setAttribute("room", memberBean.getTel());
	//  MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
	  return "_05/petroom";
	 }
	 
	 @RequestMapping(value = "onebyonechat",params = {"friendid"})
	 public String onebyonechat(MemberBean memberBean,HttpServletRequest request,Model model,@RequestParam(value ="friendid" ) String fid) {
	  HttpSession session = request.getSession();
	  MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
	  System.out.println(fid);
	  List<MemberBean> friendData = friendService.getName(fid);
	  System.out.println("11 : " + friendData.get(0));
	//  String friendName = friendData.get(0).getName();
	  session.setAttribute("name", mid.getName());
	  session.setAttribute("friends", friendData.get(0));
	  model.addAttribute("LoginOK", session.getAttribute("LoginOK"));
	  model.addAttribute("name", session.getAttribute("name"));
	  model.addAttribute("friends", session.getAttribute("friends"));
	//  MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
	  return "_05/onebyonechat";
	 }

}
