package com.web.controller._02;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.web.model._01.MemberBean;
import com.web.model._02.ArticleBean;
import com.web.model._02.LikeCountBean;
import com.web.model._02.ReplyBean;
import com.web.model._02.ReportBean;
import com.web.model._02.StyleBean;
import com.web.model._03.MyBlogBean;
import com.web.model._03.NoticeBean;
import com.web.model._07.MemberOrderBean;
import com.web.service.impl._02.ArticleService;
import com.web.service.impl._03.MyBlogService;
import com.web.service.impl._03.NoticeService;
import com.web.util.JSONFileUpload;

@Controller
public class ArticleController {

	ArticleService service;

	@Autowired
	public void setService(ArticleService service) {
		this.service = service;
	}
	
	MyBlogService myblogservice;
	@Autowired
	public void setMyBlogService(MyBlogService myblogservice) {
		this.myblogservice = myblogservice;
	}
	
	NoticeService Noticeservice;
	@Autowired
	public void setNoticeService(NoticeService Noticeservice) {
		this.Noticeservice = Noticeservice;
	}
	
	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

//會員文章後台
	@RequestMapping("/article")
	public String testlist(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
//		System.out.println(loginToken);
		String member = loginToken.getMember_Id();
		List<ArticleBean> art = service.getArticlesByMemberNo(member);
//		System.out.println(art);
		model.addAttribute("arts", art);
		return "_02/article";
	}

	@RequestMapping("/articlestyle")
	public String articlestyle(Model model) {
		return "_02/articlestyle";
	}

//	public String articlestyle1(Model model, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
//		String style1Button = request.getParameter("style1");
//		String style2Button = request.getParameter("style2");
//		
//		if ("style1".equals(style1Button)&&loginToken.getStyle()==1){
//        	return "myblog";      	
//		}else if("style2".equals(style2Button)&&loginToken.getStyle()==2) {
//			return "myblog2";
//		}
//		return "_02/articlestyle";

//		HttpSession session = request.getSession();
//		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
//		loginToken.setStyle(1);
//        	return "_02/myblog";   
//	}

	@RequestMapping("/blogIndex")
	public String articleBlog(Model model, HttpServletRequest request) {
		List<ArticleBean> art = service.getAll();
//		System.out.println(art);
		model.addAttribute("arts", art);

		List<ArticleBean> arts = service.getArticleByLike();
		model.addAttribute("artss", arts);

		return "_02/blogIndex";
	}

	@RequestMapping("/myblog")
	public String myblog(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
//		System.out.println(loginToken);
		String member = loginToken.getMember_Id();
//		System.out.println("member::"+member);
		
		List<String> visit = myblogservice.getByUser(member);
		model.addAttribute("visit", visit);
		List<ArticleBean> art = service.getArticlesByMemberNo2(member);
		model.addAttribute("arts", art);

		List<ArticleBean> arts = service.getArticleByDate(member);
		model.addAttribute("artss", arts);

		List<ArticleBean> artss = service.getArticlelikeByMember(member);
		model.addAttribute("artsss", arts);
		

		return "_02/myblog";
//		StyleBean sb = new StyleBean();
//		sb.setNo(false);
//		sb.setMemberId(member);
//        service.addStyle(sb);

//		String Style1Button = request.getParameter("style1");
//		String Style2Button = request.getParameter("style2");	
//		if ("style2".equals(Style1Button) && sb.getNo() == true) { // 0为false.myblog，1为true.myblog2 
//			sb.setNo(false);
//			sb.setMemberId(sb.getMemberId());
//			service.editStyle(sb);
//            
//		}else if ("style1".equals(Style2Button) && sb.getNo() == false) { // 0为false.myblog，1为true.myblog2
//			sb.setNo(true);
//			sb.setMemberId(sb.getMemberId());
//			service.editStyle(sb);
////		}
	}

	@RequestMapping("/myblog2")
	public String myblog2(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = loginToken.getMember_Id();
//		StyleBean sb = new StyleBean();
//		sb.setNo(true);
//		sb.setMemberId(member);
//		service.addStyle(sb);

		List<ArticleBean> art = service.getArticlesByMemberNo2(member);
		model.addAttribute("arts", art);

		List<ArticleBean> arts = service.getArticleByDate(member);
		model.addAttribute("artss", arts);

		List<ArticleBean> artss = service.getArticlelikeByMember(member);
		model.addAttribute("artsss", arts);

		return "_02/myblog2";

	}

	@RequestMapping("/getblogfood")
	public String getblogfood(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = loginToken.getMember_Id();
		ArrayList<ArticleBean> c1 = service.queryArticleByCategories1(member);
		session.setAttribute("c1", c1);
		return "_02/food";
	}

	@RequestMapping("/getblogtravel")
	public String getblogtravel(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = loginToken.getMember_Id();
		ArrayList<ArticleBean> c2 = service.queryArticleByCategories2(member);
		session.setAttribute("c2", c2);
		return "_02/travel";
	}

	@RequestMapping("/getblogbeauty")
	public String getblogbeauty(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = loginToken.getMember_Id();
		ArrayList<ArticleBean> c3 = service.queryArticleByCategories3(member);
		session.setAttribute("c3", c3);
		return "_02/beauty";
	}

	@RequestMapping("/getbloganother")
	public String getbloganother(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = loginToken.getMember_Id();
		ArrayList<ArticleBean> c4 = service.queryArticleByCategories4(member);
		session.setAttribute("c4", c4);
		return "_02/another";
	}

	@RequestMapping("/postblog")
	public String getPostblogById(@RequestParam("id") Integer no, Model model, HttpServletRequest request) {

//		List<ArticleBean> art = service.getArticlesByMemberNo(member);
		ArticleBean bean = service.getArticleById(no);
		model.addAttribute("art", bean);
//		List<ReplyBean> art = service.getAllReplys();  // 全部留言，不分文章id
		List<ReplyBean> art = service.getReplysByArticle(no);
//		System.out.println("getPostblogById =" + art);
		model.addAttribute("arts", art);

		LikeCountBean lb = new LikeCountBean();
		lb.setArticle_no(bean.getNo());
		model.addAttribute("LikeCountBean", lb);

//		HttpSession session = request.getSession();
//		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = bean.getMemberId();
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String userid = loginToken.getMember_Id();
		

		List<ArticleBean> arts = service.getArticleByDate(member);
		model.addAttribute("artss", arts);
		Noticeservice.deleteMeStatusByUser(userid,no);

		return "_02/postblog";
	}

	@RequestMapping("/GetDeleteblog")
	public String getDelete(@ModelAttribute("ArticleBean") ArticleBean bean, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");

		String no = request.getParameter("no");
//		ArticleBean bean = new ArticleBean();

		try {
			bean.setNo(Integer.parseInt(no));
			service.delete(bean);
		} catch (Exception e) {
			System.out.println("刪除過了");
		}

		List<ArticleBean> art = service.getAll();
		model.addAttribute("arts", art);

		return "redirect:/article";
	}

	@RequestMapping("/blogInsert")
	public void blogInsert(@RequestParam("upload") MultipartFile upload, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String ext = context.getMimeType(upload.getOriginalFilename());
		ext = ext.substring(6);
		Date date = new Date();
		String filename = String.valueOf(date.getTime() + "." + ext);

		InputStream in = upload.getInputStream();
		String basePath = "C:\\imgUpload\\";
		// System.out.println("basePath:" + basePath);
		File outputFilePath = new File(basePath + filename);
		// System.out.println("outputFilePath=" + outputFilePath);
		OutputStream output = new FileOutputStream(outputFilePath);
		byte[] buff = new byte[1024];
		int length;
		while ((length = in.read(buff)) != -1) {
			output.write(buff, 0, length);
		}
		output.close();
		in.close();

		Gson gson = new Gson();
		PrintWriter out = response.getWriter();

		String fileUpload = gson.toJson(new JSONFileUpload(basePath + filename));

//	        System.out.println("fileUpload => " + fileUpload);
		out.print(gson.toJson(new JSONFileUpload(basePath + filename)));
		out.flush();
		out.close();
	}

	@RequestMapping("/blogBrowse")
	public String blogBrowse(HttpServletRequest request, Model model) {
		String basePath = "C:\\imgUpload\\";
		File folder = new File(basePath);
		model.addAttribute("files", folder.listFiles());
		model.addAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));

		return "_02/browsefile";
	}

	@RequestMapping(value = "/addArticle", method = RequestMethod.GET)
	public String getAddNewArticle(Model model, HttpServletRequest request) {
		ArticleBean bean = new ArticleBean();
		model.addAttribute("ArticleBean", bean);
		return "_02/addArticle";
	}

	@RequestMapping(value = "/addArticle", method = RequestMethod.POST)
	public String processAddNewArticle(@ModelAttribute("ArticleBean") ArticleBean bean, Model model,
			HttpServletRequest request) throws ParseException, java.text.ParseException {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = loginToken.getMember_Id();
		Blob aboutme = loginToken.getMemberImage();
		HashMap<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrMsg", errorMessage);

		String no = request.getParameter("no");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
//		String postTime = request.getParameter("postTime");
		String tag = request.getParameter("tag");

		if (bean.getTitle() == null || bean.getTitle().trim().length() == 0) {
			errorMessage.put("titleNull", "請輸入標題");
		} else if (bean.getTitle().length() > 25) {
			errorMessage.put("titleOver", "字數超過25字");
		}

		if (bean.getContent() == null || bean.getContent().trim().length() == 0) {
			errorMessage.put("ContentNull", "請輸入內容");
		}

		if (errorMessage.isEmpty()) {

//			Timestamp ts = new Timestamp(System.currentTimeMillis());

			bean.setTitle(title);
			bean.setContent(content);

			// 目前時間
			Date date = new Date();
			// 設定日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// 進行轉換
			String dateString = sdf.format(date);

			bean.setPostTime(dateString);
			bean.setMemberId(member);
			bean.setReport(false);
			bean.setLikeCount(0);
			bean.setAvailable(true);
			bean.setFileName(aboutme);

			MultipartFile picture = bean.getArticleImage();
			System.out.println("picturepicture=" + picture);
			if (picture.getSize() == 0) {
				Blob blob = null;
				bean.setCoverImage(blob);
			} else {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setCoverImage(blob);
				} catch (IOException e) {
					e.printStackTrace();
				} catch (SerialException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}

			service.addArticle(bean);

//			List<ArticleBean> art = service.getAll();
//			model.addAttribute("arts", art);
//			return "_02/article";
//			return "redirect:" + request.getContextPath() + "/_02/article";
			return "redirect:/article";
		} else {

			return "_02/addArticle";
		}

	}

	@RequestMapping(value = "/getArtPicture/{no}")
	public ResponseEntity<byte[]> getPicture(HttpServletRequest reponse, @PathVariable Integer no) {
//		System.out.println("picture=" + no);

		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ArticleBean bean = service.getArticleById(no);
		Blob blob = bean.getCoverImage();
		if (blob != null) {
			body = blobToByteArray(blob);

		} else {
			String path = null;
			path = noImage;
			body = fileToByteArray(path);

		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		return re;
	}
	
	@RequestMapping(value = "/getAboutPicture/{no}")
	public ResponseEntity<byte[]> getAboutmePicture(HttpServletRequest reponse, @PathVariable Integer no) {
//		System.out.println("picture=" + no);

		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ArticleBean bean = service.getArticleById(no);
		Blob blob = bean.getFileName();
		if (blob != null) {
			body = blobToByteArray(blob);

		} else {
			String path = null;
			path = noImage;
			body = fileToByteArray(path);

		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		return re;
	}

	private byte[] toByteArray(String filepath) {
		byte[] result = null;
		try (InputStream is = context.getResourceAsStream(filepath);
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

	@RequestMapping(value = "/editArticle")
	public String getEditNewArticle(Model model, HttpServletRequest request) {
		String no = request.getParameter("no");
		ArticleBean bean = service.getArticleById(Integer.parseInt(no));
		model.addAttribute("arts", bean);

		return "_02/updateArticle";
	}

	@RequestMapping(value = "/editArticle2")
	public String processEditNewArticle(@ModelAttribute("ArticleBean") ArticleBean bean, Model model,
			HttpServletRequest request) throws ParseException, java.text.ParseException {

		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = loginToken.getMember_Id();
		String no = request.getParameter("no");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
//		String postTime = request.getParameter("postTime");
		String LikeButton = request.getParameter("like");
		String LockButton = request.getParameter("lock");
		String categories = request.getParameter("categories");

		// 目前時間
		Date date = new Date();
		// 設定日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 進行轉換
		String dateString = sdf.format(date);

		bean.setPostTime(dateString);
		bean.setTitle(title);
		bean.setContent(content);
		bean.setMemberId(member);
		bean.setLikeCount(Integer.parseInt(LikeButton));
		bean.setAvailable(Boolean.parseBoolean(LockButton));
		bean.setCategories(Integer.parseInt(categories));

//		SimpleDateFormat ssdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		bean.setPostTimeString(ssdf.format(bean.getPostTime()));

//		SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss[.fffffffff]");
//		String time = df.format(new Date());
//      Timestamp ts = Timestamp.valueOf(time);
//		Timestamp ts = new Timestamp(System.currentTimeMillis());
//		bean.setPostTime(ts);

		MultipartFile picture = bean.getArticleImage();
		System.out.println("picturepicture=" + picture);
		if (picture.getSize() == 0) {
			Blob blob = null;
			bean.setCoverImage(blob);
		} else {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setCoverImage(blob);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SerialException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		service.editArticle(bean, Integer.parseInt(no));

//		List<ArticleBean> art = service.getAll();
//		model.addAttribute("arts", art);

		List<ArticleBean> art = service.getArticlesByMemberNo(member);
		model.addAttribute("arts", art);

		return "redirect:/article";
	}

	String noImage = "/images/NoImage.png";

	@RequestMapping(value = "/getArtPicture", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletRequest request) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String no = request.getParameter("no");
		ArticleBean ab = service.getArticleById(Integer.parseInt(no));
		Blob blob = ab.getCoverImage();
		if (blob != null) {
			body = blobToByteArray(blob);

		} else {
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

	@RequestMapping(value = "/findBySearch")
	public String processFindByArticle(Model model, HttpServletRequest request) {
		String title = request.getParameter("title");
		List<ArticleBean> title1 = service.getfindBy(title);
		model.addAttribute("arts", title1);
		return "_02/searchArticle";
	}

	@RequestMapping(value = "/addReplyblog")
	public String processAddNewReply(@RequestParam("id") Integer no, Model model,
			@ModelAttribute("ReplyBean") ReplyBean rb, HttpServletRequest request, HttpSession session)
			throws ParseException {

		System.out.println("nonono=" + no);
		ArticleBean ab = service.getArticleById(no);
		model.addAttribute("art", ab);

		String ArticleNoS = Integer.toString(ab.getNo());

		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
//		System.out.println("loginToken=="+loginToken);

		HashMap<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrMsg", errorMessage);

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		if (loginToken == null) {
			errorMessage.put("sessionNull", "請先登入");

			return "redirect:/postblog?id=" + ArticleNoS;

		} else {
			
			
			Blob blob = loginToken.getMemberImage();
			rb.setReplyImage(blob);
			
			
			
			String AuthorSS = (loginToken.getMember_Id());
			String content = request.getParameter("content");

//		rb.setMemberId(member);
			rb.setMemberId(AuthorSS);
			rb.setPostTime(new Date());
			rb.setContent(content);
			rb.setArticle_no(Integer.parseInt(ArticleNoS));

			service.addReply(rb);
			session.setAttribute("reply", rb);

			List<ReplyBean> art = service.getReplysByArticle(no);
			System.out.println("artart="+art);
			model.addAttribute("arts", art);
			
			NoticeBean nb=new NoticeBean();
			nb.setOtherid(AuthorSS);
			nb.setUserid(ab.getMemberId());
			nb.setArticleid(no);
			Noticeservice.addMessageNotice(nb);
			return "redirect:/postblog?id=" + ArticleNoS;

		}

	}
	
	@RequestMapping(value = "/getReplyPicture/{no}")
	public ResponseEntity<byte[]> getReplyPicture(HttpServletRequest reponse, @PathVariable Integer no) {
//		System.out.println("picture=" + no);

		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ReplyBean rb = service.getReplyById(no);
		Blob blob = rb.getReplyImage();
		if (blob != null) {
			body = blobToByteArray(blob);

		} else {
			String path = null;
			path = noImage;
			body = fileToByteArray(path);

		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		return re;
	}




	@RequestMapping(value = "/addReportblog")
	public String processAddReportForm(@ModelAttribute("ReportBean") ReportBean rb, @RequestParam("rpid") Integer no,
			HttpServletRequest request, HttpSession session, Model model) throws ParseException {
//		System.out.println("no=" + no);

		ArticleBean ab = service.getArticleById(no);
//		System.out.println("ab=" + ab);
		String ArticleNoS = Integer.toString(ab.getNo());
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = (loginToken.getMember_Id());
		String content = request.getParameter("message");
		rb.setContent(content);
		rb.setMemberId(member);
		rb.setPostTime(new Date());
		rb.setArticle_no(Integer.parseInt(ArticleNoS));

		ab.setReport(true); // true=1;false=0

		service.addReport(rb);
//		System.out.println("getreport" + ab.getReport());
		service.editArticle(ab, no);

		model.addAttribute("ReportBean", rb);
		model.addAttribute("ArticleBean", ab);

		return "redirect:/postblog?id=" + ArticleNoS;
	}

	@RequestMapping(value = "/articlelike")
	public String getArticlelike(@RequestParam("no") Integer no, @ModelAttribute("LikeCountBean") LikeCountBean lb,
			Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
//		System.out.println("no=" + no);
		ArticleBean ab = service.getArticleById(no);
//		System.out.println("ab=" + ab);
		String ArticleNoS = Integer.toString(ab.getNo());
//		System.out.println("ArticleNoS=" + ArticleNoS);

		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");

		HashMap<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrMsg", errorMessage);

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		if (loginToken == null) {
			errorMessage.put("sessionNull", "請先登入");

			return "redirect:/postblog?id=" + ArticleNoS;

		} else {
			String member = (loginToken.getMember_Id());
			System.out.println("member=" + member);

			lb.setMemberId(member);
			lb.setArticle_no(Integer.parseInt(ArticleNoS));

			String LikeButton = request.getParameter("like");

			if ("like".equals(LikeButton) && service.getLikeByMemberAndArticle(member, no) == "null") {

				lb.setLikecount(true);
				ab.setLikeCount(ab.getLikeCount() + 1);
				if (service.getLikeNo(member, no) == null) {
					service.addCt(lb);
				} else {
					LikeCountBean lbno = service.getLikeNo(member, no);
					lb.setNo(lbno.getNo());
					service.updateCt(lb);
				}
				service.editArticle(ab, no);

			} else if ("like".equals(LikeButton) && service.getLikeByMemberAndArticle(member, no) == "true") { // -1
				LikeCountBean lbno = service.getLikeNo(member, no);
				lb.setNo(lbno.getNo());
				lb.setLikecount(null);
				ab.setLikeCount(ab.getLikeCount() - 1);
				service.updateCt(lb);
				service.editArticle(ab, no);
			}

			return "redirect:/postblog?id=" + ArticleNoS;
		}
	}

//AJAX依日期搜尋文章
	@RequestMapping("/queryArticleByDate")
	public void queryArticleByDate(Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String memderId = request.getParameter("key3");
		System.out.println("memderId=" + memderId);
		String startdate = request.getParameter("key1") + " 00:00:00";
		String enddate = request.getParameter("key2") + " 23:59:59";
		System.out.println("enddate=" + enddate);

		ArrayList<ArticleBean> queryAllArticleByDate = service.queryArticleByDate(memderId, startdate, enddate);

		Gson gson = new Gson();
		String json = gson.toJson(queryAllArticleByDate);
		response.getWriter().print(json);
//		System.out.println("json=" + queryAllArticleByDate);

	}

//站方文章後台
	@RequestMapping("/adminarticle")
	public String list(Model model, HttpServletRequest request) {
		List<ArticleBean> art = service.getAll();

		model.addAttribute("arts", art);
//			System.out.println(art);
		return "_02/admin_article";
	}

	@RequestMapping(value = "/adminreport", produces = "application/json")
	public @ResponseBody ReportBean adminreport(Model model, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {

		request.setCharacterEncoding("UTF-8");
		response.getCharacterEncoding();
//			ArticleBean no = (ArticleBean) model.getAttribute("arts");
		String reportno = request.getParameter("reportno");
//		System.out.println("reportnoreportno=" + reportno);

		ReportBean rb = service.getReportByArticle(Integer.parseInt(reportno));
//		System.out.println("rbrb=" + rb);

		HttpSession session = request.getSession();
		session.setAttribute("rbs", rb);
//	        model.addAttribute("rbs", rb);
		return rb;
	}

	@RequestMapping(value = "/adminlockarticle")
	public String processAddLockForm(@RequestParam("no") Integer no, Model model, HttpServletRequest request) {
//		System.out.println("lockno=" + no);
		ArticleBean ab = service.getArticleById(no);

		String LockButton = request.getParameter("lock");

		if ("lock".equals(LockButton) && ab.getAvailable() == true) {

			ab.setAvailable(false);
			service.editArticle(ab, no);

		} else if ("lock".equals(LockButton) && ab.getAvailable() == false) {

			ab.setAvailable(true);
			service.editArticle(ab, no);
		}
		return "redirect:/adminarticle";
	}
	
	     // URL為 /members, 搭配 GET方法可以傳回所有紀錄。
		// produces屬性說明產生之資料的格式: produces = "application/vnd.ms-excel"
		// 本方法可以Excel格式傳回所有Member紀錄
		@RequestMapping(value = "/blogXML", method = RequestMethod.GET, produces = "application/vnd.ms-excel")
		public String queryArticleExcel(Model model, HttpServletRequest request,HttpServletResponse response) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			List<ArticleBean> art = service.getAll();
			System.out.println("test excel="+art);
			model.addAttribute("artCharts", art);
			return "_02/admin_article";
		}
		
		
		@RequestMapping(value = "/deletReplyblog")
		public String getdeletReply(@RequestParam("idid") Integer no, Model model,
				@ModelAttribute("ReplyBean") ReplyBean rb, HttpServletRequest request, HttpServletResponse response,HttpSession session)
				throws ParseException, SQLException {
            System.out.println("idid::"+ no);
			ArticleBean ab = service.getArticleById(no);
			model.addAttribute("art", ab);

			String ArticleNoS = Integer.toString(ab.getNo());
			MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
			
			String commid = request.getParameter("reno");
			
			try {
			rb.setNo(Integer.parseInt(commid));
			service.DeletComm(rb);
			} catch (Exception e) {
				System.out.println("刪除過了");
			}

			return "redirect:/postblog?id=" + ArticleNoS;

		}

}
