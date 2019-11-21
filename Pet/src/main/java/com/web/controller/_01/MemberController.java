

package com.web.controller._01;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.web.model._01.MemberBean;
import com.web.model._01.PetBean;
import com.web.model._03.FriendBean;
import com.web.model._03.MemberData;
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

	@RequestMapping(value = "/")
	public String home(Model model) {
		model.addAttribute("MemberBean", new MemberBean());
		// 註冊會員
//		return "_01/memberinsert";
		// 會員登入
//		return "_01/memberlogin";
		
		return "index";

	}

	// 會員登入頁面
	@RequestMapping(value = "/_01.memberloginPage")
	public String memberloginPage(Model model) {
		model.addAttribute("MemberBean", new MemberBean());
		return "_01/memberlogin";
		
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
		return "index";
//		return "redirect: _01.updataMemberPage";
	}

	// 登入失敗
	@RequestMapping(value = "loginErr")
	public String loginErr() {
		return "_01/login";

	}

	// 註冊會員頁面
	@RequestMapping(value = "/_01.saveMemberPage")
	public String saveMemberPage(Model model) {
		model.addAttribute("MemberBean", new MemberBean());

		return "_01/memberinsert";
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
		return "redirect: _01.memberloginPage";
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

	// 查詢全部寵物
	public List<PetBean> queryAllPet(HttpServletRequest request, MemberBean mb) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String id = loginToken.getMember_Id();
		mb.setMember_Id(id);
		List<PetBean> list = petService.queryAllPet(mb);
		return list;

	}

	// 進入修改會員頁面
	@RequestMapping(value = "/_01.updataMemberPage")
	public String updataMemberPage(Model model) {
		model.addAttribute("MemberBean", new MemberBean());
		return "_01/memberupdate";
	}

	// 修改會員
	@RequestMapping(value = "/_01.updataMember", method = RequestMethod.POST)
	public String updataMember(MemberBean mb, HttpServletRequest request) {

		MultipartFile picture = mb.getFilImage();
		if(picture.getSize() == 0) {
			System.out.println("picture1:"+picture.getSize());
			Blob blob =null;
			mb.setMemberImage(blob);
		}else {
			System.out.println("picture2:"+picture.getSize());
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				mb.setMemberImage(blob);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SerialException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		

		memberService.updataMember(mb);
		HttpSession session = request.getSession();
		session.setAttribute("LoginOK", mb);


		return "_01/ttt";
	}
	
	String noImage = "/images/NoImage.png";
	
	//讀取會員大頭貼
	//<img width='60' height='72' src='getPicture' />
	@RequestMapping(value = "/getPicture", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletRequest request) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		Blob blob = loginToken.getMemberImage();
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
	
	@Autowired
	ServletContext context;
	
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
	
//	會員登入後台index頁
	@RequestMapping("/memberManagement")
	public String friendlist(String mid1, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("LoginOK");
		
		return "_01/memberManagement";
	}

}

