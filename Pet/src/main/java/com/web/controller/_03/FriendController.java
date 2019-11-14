package com.web.controller._03;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.model._01.MemberBean;
import com.web.model._03.FriendBean;
import com.web.model._03.MemberData;
import com.web.service.impl._03.FriendService;

@Controller
public class FriendController {
	FriendService service;

	@Autowired
	public void setService(FriendService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	public FriendController() {
	}
	
	@RequestMapping("/index")
	public String test() {
		return "index";
	}

	@RequestMapping("/friendlist")
	public String friendlist(String mid1, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<String> fid = new ArrayList<String>();

		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		mid1 =mid.getMember_Id();
		System.out.println("userid:"+mid1);
		List<FriendBean> list = service.getByMId1(mid1);
//		System.out.println("list:"+list);
		for (int n = 0; n < list.size(); n++) {
			String a = list.get(n).getMid2();
			fid.add(a);
//			 System.out.println("a:"+a);
		}
		List<MemberData> fdlist = service.getMemberData(mid1,fid);
		
		model.addAttribute("friends", fdlist);
		return "_03/friendlist";
	}

	@RequestMapping("/application")
	public String applicationlist(String mid1, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<String> fid = new ArrayList<String>();

		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		mid1 = mid.getMember_Id();
		List<FriendBean> list = service.getByMId1(mid1);
//		System.out.println("list:"+list);
		for (int n = 0; n < list.size(); n++) {
			String a = list.get(n).getMid2();
			fid.add(a);
//			 System.out.println("a:"+a);
		}
		List<MemberData> fdlist = service.getMemberData(mid1,fid);
		System.out.println("status:123"+fdlist.get(0).getStatus());
		model.addAttribute("friends", fdlist);
		return "_03/application";
	}

	@RequestMapping("/waiting")
	public String waitinglist(String mid1, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<String> fid = new ArrayList<String>();

		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		mid1 = mid.getMember_Id();

		List<FriendBean> list = service.getByMId1(mid1);
//		System.out.println("list:"+list);
		for (int n = 0; n < list.size(); n++) {
			String a = list.get(n).getMid2();
			fid.add(a);
//			 System.out.println("a:"+a);
		}
		List<MemberData> fdlist = service.getMemberData(mid1,fid);

		model.addAttribute("friends", fdlist);
		return "_03/waiting";
	}

	@RequestMapping(value = "/select", params = { "friendid" })
	public String selectByFriendId(Model model, @RequestParam(value = "friendid") String mid) {
		List<MemberBean> list = service.getByUserId(mid);
		model.addAttribute("frienddata", list);
		return "_03/selectmember";
	}

	@RequestMapping(value = "/add", params = { "friendid" })
	public String addFriendById(FriendBean fb, String userid, HttpServletRequest request,
			@RequestParam(value = "friendid") String friendid) {
		HttpSession session = request.getSession();
		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		userid = mid.getMember_Id();
		fb.setMid1(userid);
		fb.setMid2(friendid);
		service.add(fb);
		return "redirect:/application";
	}

	@RequestMapping(value = "/cancelapplication", params = { "friendid" })
	public String cancelApplicationById(String userid, HttpServletRequest request,
			@RequestParam(value = "friendid") String friendid) {
		HttpSession session = request.getSession();
		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		userid = mid.getMember_Id();
		service.deleteByMid(userid, friendid);
		return "redirect:/waiting";
	}
	
	@RequestMapping(value = "/newfriend", params = { "friendid" })
	public String getNewFriend(String userid, HttpServletRequest request,
			@RequestParam(value = "friendid") String friendid) {
		HttpSession session = request.getSession();
		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		userid = mid.getMember_Id();
		service.updateUserFrById(userid, friendid);
		return "redirect:/friendlist";
	}
	@RequestMapping("/friends")
	@ResponseBody
	public List<MemberData> friend(String mid1, Model model, HttpServletRequest request){
	HttpSession session = request.getSession();
	List<String> fid = new ArrayList<String>();

	MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
	mid1 = mid.getMember_Id();
	System.out.println("userid:"+mid1);
	List<FriendBean> list = service.getByMId1(mid1);
//	System.out.println("list:"+list);
	for (int n = 0; n < list.size(); n++) {
		String a = list.get(n).getMid2();
		fid.add(a);
//		 System.out.println("a:"+a);
	}
	List<MemberData> fdlist = service.getMemberData(mid1,fid);
	return fdlist;
}
	}
