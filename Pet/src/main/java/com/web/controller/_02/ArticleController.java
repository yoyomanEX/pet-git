package com.web.controller._02;

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
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.xml.ws.Response;

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
			bean.setReport(false);
			bean.setLikeCount(0);
			bean.setAvailable(true);
			
			MultipartFile articleImage = bean.getArticleImage();
			String originalFilename = articleImage.getOriginalFilename();
			bean.setFileName(originalFilename);
			
			// 建立Blob物件，交由 Hibernate 寫入資料庫
			if (articleImage != null && !articleImage.isEmpty()) {
				try {
					byte[] b = articleImage.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setCoverImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}

			service.addArticle(bean);
			String rootDirectory = context.getRealPath("/");
			String ext = "";
			if (!originalFilename.isEmpty()) {

				ext = originalFilename.substring(originalFilename.lastIndexOf(".")); // 若為空值會顯示-1...exception
//			String rootDirectory = context.getRealPath("/");
				try {
					File imageFolder = new File(rootDirectory, "images");
					if (!imageFolder.exists())
						imageFolder.mkdirs();
					File file = new File(imageFolder, bean.getNo() + ext);
					articleImage.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			} 
//			List<ArticleBean> art = service.getAll();
//			model.addAttribute("arts", art);
//			return "_02/article";
//			return "redirect:" + request.getContextPath() + "/_02/article";
			return "redirect:/article";
		} else {

			return "_02/addArticle";
		}

	}
	
	@RequestMapping(value = "/getPicture/{no}")
	public ResponseEntity<byte[]> getPicture(HttpServletRequest reponse, @PathVariable Integer no) {
//		System.out.println("picture=" + no);
		String filePath = "/resources/img/blog-img/lp1.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ArticleBean bean = service.getArticleById(no);
		if (bean != null) {
			Blob blob = bean.getCoverImage();
			filename = bean.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("Controller的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

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
		String report = request.getParameter("message");
		String LikeButton = request.getParameter("like");
		String LockButton = request.getParameter("lock");
		

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
		bean.setReport(Boolean.parseBoolean(report));
		bean.setLikeCount(Integer.parseInt(LikeButton));
		bean.setAvailable(Boolean.parseBoolean(LockButton));
		

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
//		System.out.println("ab=" + ab);

		String ArticleNoS = Integer.toString(ab.getNo());

		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String member = (loginToken.getMember_Id());
		String content = request.getParameter("message");
		rb.setContent(content);
		rb.setMemberId(member);
		rb.setPostTime(new Date());
		rb.setArticle_no(Integer.parseInt(ArticleNoS));
//		System.out.println("rb=" + rb);

		ab.setReport(true); // true=1;false=0

		service.addReport(rb);
//		System.out.println("getreport" + ab.getReport());
		service.editArticle(ab, no);

//		model.addAttribute("ReportBean", rb);   //檢舉人看到自己的檢舉內容
//		model.addAttribute("ArticleBean", ab);

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
//			System.out.println("member=" + member);

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

//站方文章後台adminarticle
	@RequestMapping("/adminarticle")
	public String list(Model model, HttpServletRequest request) {
		List<ArticleBean> art = service.getAll();

		model.addAttribute("arts", art);
//		System.out.println(art);
		return "_02/admin_article";
	}

	@RequestMapping(value="/adminreport",produces="application/json")
	public @ResponseBody ReportBean adminreport(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		request.setCharacterEncoding("UTF-8");
		response.getCharacterEncoding();
//		ArticleBean no = (ArticleBean) model.getAttribute("arts");
	    String reportno = request.getParameter("reportno");
		System.out.println("reportnoreportno=" + reportno);
	
		ReportBean rb = service.getReportByArticle(Integer.parseInt(reportno));
        System.out.println("rbrb=" +rb );
        
        HttpSession session = request.getSession();
		session.setAttribute("rbs", rb);
		
//        model.addAttribute("rbs", rb);
		
        return rb;
		
	}
	
	@RequestMapping(value = "/adminlockarticle")
	public String processAddLockForm(@RequestParam("no") Integer no,Model model,HttpServletRequest request,HttpSession session) {
		System.out.println("lockno=" + no);
		ArticleBean ab = service.getArticleById(no);
	
		String LockButton = request.getParameter("lock");
	
		if ("lock".equals(LockButton)&& ab.getAvailable() == true) {
			
            ab.setAvailable(false);
            service.editArticle(ab, no);
            
        } else if ("lock".equals(LockButton)&&ab.getAvailable() == false) {
        	
            ab.setAvailable(true);
            service.editArticle(ab, no);
        }
		
		return "redirect:/adminarticle";
	}
}
