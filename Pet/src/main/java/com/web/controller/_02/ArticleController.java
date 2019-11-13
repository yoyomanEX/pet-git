package com.web.controller._02;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.web.model._01.MemberBean;
import com.web.model._02.ArticleBean;
import com.web.model._02.LikeCountBean;
import com.web.model._02.ReplyBean;
import com.web.model._02.ReportBean;
import com.web.service.impl._02.ArticleService;
import com.web.util.JSONFileUpload;

@Controller
public class ArticleController {

	ArticleService service;

	@Autowired
	public void setService(ArticleService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	
//	@RequestMapping("/")
	public String petIndex() {
		return "index";

	}
	
	// 管理者後台，顯示所有會員的發文@RequestMapping("/adminarticle")

//	@RequestMapping("/")   
	public String list(Model model, HttpServletRequest request) {
		List<ArticleBean> art = service.getAll();

//		System.out.println(art);

		model.addAttribute("arts", art);
//		return "_02/adminarticle";
//		return "_02/test";
		return "_02/admin_article";
	}

	@RequestMapping("/article") // 後台只顯示自己的發文
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

	// 不管有沒有登入都可以看到個人頁面 ，差在是否可以編輯 ， 即登入才能看到自己的後台

	@RequestMapping("/blogIndex")
	public String articleBlog(Model model, HttpServletRequest request) {
		List<ArticleBean> art = service.getAll();

//		System.out.println(art);

		model.addAttribute("arts", art);
		return "_02/blogIndex";
	}

	@RequestMapping("/myblog")
	public String myblog(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
//		System.out.println(loginToken);

		String member = loginToken.getMember_Id();
		List<ArticleBean> art = service.getArticlesByMemberNo(member);

		model.addAttribute("arts", art);
		return "_02/myblog";
	}

	@RequestMapping("/postblog")
	public String getPostblogById(@RequestParam("id") Integer no, Model model, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
//		String member = loginToken.getMember_Id();
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

//	@RequestMapping("/GetDelete2")
//	public String getDelete(Model model) {
//		List<ArticleBean> art = service.getAll();
//		model.addAttribute("arts", art);
//
//		return "_02/article";
//	}

	@RequestMapping("/blogInsert")
	public void blogInsert(@RequestParam("upload") MultipartFile upload, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String ext = context.getMimeType(upload.getOriginalFilename());
		ext = ext.substring(6);
		Date date = new Date();
		String filename = String.valueOf(date.getTime() + "." + ext);

		InputStream in = upload.getInputStream();
		String basePath = "C:\\Pet\\apache-tomcat-9.0.22\\imgUpload\\";
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
		String basePath = "C:\\Pet\\apache-tomcat-9.0.22\\imgUpload\\";
		File folder = new File(basePath);
		model.addAttribute("files", folder.listFiles());
		model.addAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));

		return "_02/browsefile";
	}

	@RequestMapping(value = "/addArticle", method = RequestMethod.GET)
	public String getAddNewArticle(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		ArticleBean bean = new ArticleBean();
		model.addAttribute("ArticleBean", bean);
		return "_02/addArticle";
	}

	@RequestMapping(value = "/addArticle", method = RequestMethod.POST)
	public String processAddNewArticle(@ModelAttribute("ArticleBean") ArticleBean bean, BindingResult result,
			Model model, HttpServletRequest request) throws ParseException, java.text.ParseException {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = loginToken.getMember_Id();
		HashMap<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrMsg", errorMessage);

		String no = request.getParameter("no");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
//		String postTime = request.getParameter("postTime");

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

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
			bean.setLikeCount(0);

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

//	@RequestMapping(value = "/addArticle2")
//	public String processAddNewArticleAll(Model model) {
//		List<ArticleBean> art = service.getAll();
//		model.addAttribute("arts", art);
//		return "_02/article";
//	}

	@RequestMapping(value = "/editArticle")
	public String getEditNewArticle(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");

		String no = request.getParameter("no");
//		ArticleBean bean = new ArticleBean();
//		bean.setNo(Integer.parseInt(no));
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

//		SimpleDateFormat ssdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		bean.setPostTimeString(ssdf.format(bean.getPostTime()));

//		SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss[.fffffffff]");
//		String time = df.format(new Date());
//      Timestamp ts = Timestamp.valueOf(time);
//		Timestamp ts = new Timestamp(System.currentTimeMillis());

//		bean.setPostTime(ts);

		service.editArticle(bean, Integer.parseInt(no));

//		List<ArticleBean> art = service.getAll();
//		model.addAttribute("arts", art);

		List<ArticleBean> art = service.getArticlesByMemberNo(member);
		model.addAttribute("arts", art);

		return "redirect:/article";

	}

	@RequestMapping(value = "/findBySearch")
	public String processFindByArticle(Model model, HttpServletRequest request) {

		String title = request.getParameter("title");

		List<ArticleBean> title1 = service.getfindBy(title);

		model.addAttribute("arts", title1);

		return "_02/searchArticle";

	}

	@RequestMapping(value = "/findBySearchblog")
	public String processFindByArticleblog(Model model, HttpServletRequest request) {

		String title = request.getParameter("title");

		List<ArticleBean> title1 = service.getfindBy(title);

		model.addAttribute("arts", title1);

		return "_02/blogIndex";

	}

	@RequestMapping(value = "/addReplyblog")
	public String processAddNewReply(@RequestParam("id") Integer no, Model model,
			@ModelAttribute("ReplyBean") ReplyBean rb, HttpServletRequest request, HttpSession session)
			throws ParseException {

//		System.out.println("no=" + no);
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
			String AuthorSS = (loginToken.getMember_Id());

			String content = request.getParameter("content");

//		rb.setMemberId(member);
			rb.setMemberId(AuthorSS);
			rb.setPostTime(new Date());
			rb.setContent(content);
			rb.setArticle_no(Integer.parseInt(ArticleNoS));

			service.addReply(rb);

			List<ReplyBean> art = service.getReplysByArticle(no);
			model.addAttribute("arts", art);

			return "redirect:/postblog?id=" + ArticleNoS;

		}

	}

	@RequestMapping(value = "/addReportblog")
	public String processAddReportForm(@ModelAttribute("ReportBean") ReportBean rb, @RequestParam("rpid") Integer no,
			HttpServletRequest request, HttpSession session, Model model) throws ParseException {
//		System.out.println("no=" + no);

		ArticleBean ab = service.getArticleById(no);
		System.out.println("ab=" + ab);

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

//	@RequestMapping(value = "/articlelike", method = RequestMethod.GET)
//	public String getArticleById(@RequestParam("id") Integer no, Model model,HttpServletRequest request,HttpSession session) {
//		session = request.getSession();
//		ArticleBean ab = service.getArticleById(no);
//		ReplyBean rb = new ReplyBean();
//		List<ReplyBean> list = service.getReplysByArticle(no);
//		LikeCountBean lb = new LikeCountBean();
//		
//		model.addAttribute("ArticleBean", ab);
//		model.addAttribute("Reply", rb);
//		model.addAttribute("Replys", list);
//		model.addAttribute("LikeCountBean", lb);
//		model.addAttribute("Article", service.getArticleById(no));
//		
//		String ArticleNoS =Integer.toString(ab.getNo());
//		
//		return "redirect:/postblog?id=" + ArticleNoS;
//	}
//	
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

//		model.addAttribute("id", no);
		return "redirect:/postblog?id=" + ArticleNoS;
	}
	}
}
