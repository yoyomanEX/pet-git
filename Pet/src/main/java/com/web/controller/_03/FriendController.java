package com.web.controller._03;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.model._01.MemberBean;
import com.web.model._02.ArticleBean;
import com.web.model._03.FriendBean;
import com.web.model._03.MemberData;
import com.web.model._03.MyBlogBean;
import com.web.model._03.NoticeBean;
import com.web.service.impl._01.MemberService;
import com.web.service.impl._02.ArticleService;
import com.web.service.impl._03.FriendService;
import com.web.service.impl._03.MyBlogService;
import com.web.service.impl._03.NoticeService;

@Controller
public class FriendController {
	FriendService service;

	@Autowired
	public void setService(FriendService service) {
		this.service = service;
	}

	ArticleService Artservice;

	@Autowired
	public void setArtService(ArticleService Artservice) {
		this.Artservice = Artservice;
	}
	
	NoticeService Noticeservice;

	@Autowired
	public void setArtService(NoticeService Noticeservice) {
		this.Noticeservice = Noticeservice;
	}
	
	MyBlogService Myblogservice;
	
	@Autowired
	public void setMyBlogService(MyBlogService Myblogservice) {
		this.Myblogservice = Myblogservice;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	public FriendController() {
	}


	@RequestMapping("/404")
	public String test() {
		return "_03/404";
	}

	@RequestMapping(value = "/memberblog/{member_Id}")
	public String getProductsByCategory(@PathVariable("member_Id") String member_Id, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");

		String mid1 = mid.getMember_Id();
		MyBlogBean mbb=new MyBlogBean();
		mbb.setUserid(member_Id);
		mbb.setOtherid(mid1);
		Myblogservice.comehome(mbb);
		model.addAttribute("people",member_Id);
		List<ArticleBean> art = Artservice.getArticlesByMemberNo2(member_Id);
		model.addAttribute("arts", art);

		List<ArticleBean> arts = Artservice.getArticleByDate(member_Id);
		model.addAttribute("artss", arts);

		List<ArticleBean> artss = Artservice.getArticlelikeByMember(member_Id);
		model.addAttribute("artsss", arts);
		
		return "_03/memberblog";
	}
	
//	@RequestMapping(value = "texttt123")
//	public String loginErr() {
//		return "_03/memberblog";
//
//	}

	@RequestMapping("/friendlist")
	public String friendlist(String mid1, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<String> fid = new ArrayList<String>();

		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		mid1 = mid.getMember_Id();
		System.out.println("userid:" + mid1);
		List<FriendBean> list = service.getByMId1(mid1);
//		System.out.println("list:"+list);
		for (int n = 0; n < list.size(); n++) {
			String a = list.get(n).getMid2();
			fid.add(a);
//			 System.out.println("a:"+a);
		}
		List<MemberData> fdlist = service.getMemberData(mid1, fid);

		model.addAttribute("friends", fdlist);
		return "_03/friendlist";
	}
	@RequestMapping("/friendlist2")
	@ResponseBody
	public List<MemberData> friendlist2(String mid1, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<String> fid = new ArrayList<String>();

		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		mid1 = mid.getMember_Id();
		System.out.println("userid:" + mid1);
		List<FriendBean> list = service.getByMId1(mid1);
//		System.out.println("list:"+list);
		for (int n = 0; n < list.size(); n++) {
			String a = list.get(n).getMid2();
			fid.add(a);
//			 System.out.println("a:"+a);
		}
		List<MemberData> fdlist = service.getMemberData(mid1, fid);
		return fdlist;
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
		List<MemberData> fdlist = service.getMemberData(mid1, fid);
		model.addAttribute("friends", fdlist);
		return "_03/application";
	}

	@RequestMapping("/waiting")
	public String waitinglist(String mid1, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<String> fid = new ArrayList<String>();

		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		mid1 = mid.getMember_Id();
		Noticeservice.deleteFrStarusByUser(mid1);
		List<FriendBean> list = service.getByMId1(mid1);
//		System.out.println("list:"+list);
		for (int n = 0; n < list.size(); n++) {
			String a = list.get(n).getMid2();
			fid.add(a);
//			 System.out.println("a:"+a);
		}
		List<MemberData> fdlist = service.getMemberData(mid1, fid);

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
	public String addFriendById(NoticeBean nb, FriendBean fb, String userid, HttpServletRequest request,
			@RequestParam(value = "friendid") String friendid) {
		HttpSession session = request.getSession();
		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		userid = mid.getMember_Id();
		fb.setMid1(userid);
		fb.setMid2(friendid);
		service.add(fb);
		nb.setUserid(friendid);
		nb.setOtherid(userid);
		Noticeservice.addFriendNotice(nb);
		return "redirect:/application";
	}

	@RequestMapping(value = "/cancelapplication", params = { "friendid" })
	public String cancelApplicationById(String userid, HttpServletRequest request,
			@RequestParam(value = "friendid") String friendid) {
		HttpSession session = request.getSession();
		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		userid = mid.getMember_Id();
		service.deleteByMid(userid, friendid);
		Noticeservice.deleteFrStarusByUser(userid);
		return "redirect:/application";
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
	public List<MemberData> friend(String mid1, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<String> fid = new ArrayList<String>();

		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		mid1 = mid.getMember_Id();
		System.out.println("userid:" + mid1);
		List<FriendBean> list = service.getByMId1(mid1);
//	System.out.println("list:"+list);
		for (int n = 0; n < list.size(); n++) {
			String a = list.get(n).getMid2();
			fid.add(a);
//		 System.out.println("a:"+a);
		}
		List<MemberData> fdlist = service.getMemberData(mid1, fid);
		return fdlist;
	}

	@RequestMapping("/notice")
	@ResponseBody
	public List<NoticeBean> notice(String mid1, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean mid = (MemberBean) session.getAttribute("LoginOK");
		mid1 = mid.getMember_Id();
		List<NoticeBean> list = Noticeservice.findStatusByUser(mid1);
		return list;
	}
	
	
	String noImage = "/images/NoImage.png";
	
	@RequestMapping(value = "/getMbPicture/{no}")
	public ResponseEntity<byte[]> getPicture(HttpServletRequest reponse, @PathVariable String no) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		List<MemberBean> loginToken = service.getByUserId(no);
		Blob blob = loginToken.get(0).getMemberImage();
		if(blob!=null) {
			body = blobToByteArray(blob);
			
		}else {
			String path = null;
			path = noImage;
			body = fileToByteArray(path);
			
		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		return re;
	}
	private byte[] fileToByteArray(String path) {
		byte[] result = null;
		try (InputStream is = context.getResourceAsStream(path);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

}