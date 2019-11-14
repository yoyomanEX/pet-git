package com.web.controller._07;


import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.BodyBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.model._01.CompanyBean;
import com.web.model._07.CompanyProductBean;

import com.web.service.impl._07.CompanyProductService07;

//廠商端操作後台的商品管理
@Controller(value = "CompanyProductController")
public class CompanyProductController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	CompanyProductService07 service;

	@Autowired
	public void setService(CompanyProductService07 service) {
		this.service = service;
	}

	ServletContext context;
	

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	

	// 廠商後台新增商品1
	@RequestMapping("/companyProductInsert1")
	public String companyProductInsert1(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("CompanyLoginOK");
		return "/_07/companyProductInsert";
	}

	// 廠商後台新增商品2
	@RequestMapping("/companyProductInsert2")
	public String companyProductInsert2(Model model, HttpServletRequest request,@RequestParam("file") MultipartFile file1) throws IOException {
		HttpSession session = request.getSession();
		session.getAttribute("CompanyLoginOK");
		
		String product_name = request.getParameter("product_name");
		String price = request.getParameter("price");
		Integer pr1 = Integer.parseInt(price);
		String amount = request.getParameter("amount");
		Integer amount1 = Integer.parseInt(amount);
		String company_id = request.getParameter("company_id");
		String status = request.getParameter("status");
		Integer status1 = Integer.parseInt(status);
		String describe = request.getParameter("describe");
		String category = request.getParameter("category");
		Integer category1 = Integer.parseInt(category);
	
		CompanyProductBean bean = new CompanyProductBean();
		bean.setProduct_name(product_name);
		bean.setPrice(pr1);
		bean.setAmount(amount1);
		bean.setCompany_id(company_id);
		bean.setDescribe(describe);
		bean.setStatus(status1);
		bean.setCategory(category1);

		service.addProduct(bean);
		if(!file1.isEmpty()) {
			byte[] byte1 = file1.getBytes();
			Path path = Paths.get("z"+bean.getProduct_id()+".jpg");
			Files.write(path, byte1);
		}
		System.out.println("抓到的商品編號："+bean.getProduct_id());//測試有沒有抓到商品編號
		return "redirect:/ProductQueryAll";
	}
	
	@RequestMapping("/ProductQueryAll")
	public String processCompanyProductInsert2(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		CompanyBean loginToken = (CompanyBean) session.getAttribute("CompanyLoginOK");
		loginToken.getCompany_id();

		CompanyProductBean bean = new CompanyProductBean();
		bean.setCompany_id(loginToken.getCompany_id());
		
		
		List<CompanyProductBean> list = service.queryAllProduct(bean);
		model.addAttribute("allProduct", list);
		return "/_07/companyProductQueryAll";
	}
	
	@GetMapping("/downloadFile/{fileName:.+}")
	 public ResponseEntity<Resource> downloadFile(@PathVariable String fileName, HttpServletRequest request)
	   throws MalformedURLException {
	  logger.info("fileName:{}", fileName);
	  ResourcePatternResolver rpr = new PathMatchingResourcePatternResolver();
	  Resource rs = rpr.getResource("file:/C:/petuse/" + fileName);
	  if (!rs.exists()) {
	   rs = rpr.getResource("file:/C:/petuse/noImg.jpg");
	  }

	  // Try to determine file's content type
	  // 嘗試確定文件的內容類型
	  String contentType = null;
	  try {
	   contentType = request.getServletContext().getMimeType(rs.getFile().getAbsolutePath());
	  } catch (IOException ex) {
	   logger.info("Could not determine file type.");
	  }

	  // Fallback to the default content type if type could not be determined
	  // 如果無法確定類型，則回退到默認內容類型
	  if (contentType == null) {
	   contentType = "application/octet-stream";
	  }

	  BodyBuilder builder = ResponseEntity.ok();//回傳給網頁的工具
	  builder.contentType(MediaType.parseMediaType(contentType));
	  // header是告知瀏覽器該圖片資料
	  builder.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + rs.getFilename() + "\"");
	  // body是秀在網頁上給使用者看的部分
	  ResponseEntity<Resource> resp = builder.body(rs);
	  return resp;
	 }
	
	
	
	
	
	// 廠商後台依商品編號刪除商品
	@RequestMapping("/companyProductDeleteByProductId")
	public String companyProductDeleteByProductId(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("CompanyLoginOK");
		String product_id = request.getParameter("product_id");
		Integer p1 = Integer.parseInt(product_id);
		CompanyProductBean bean = new CompanyProductBean();
		bean.setProduct_id(p1);
		service.deleteProduct(bean);

		
		List<CompanyProductBean> list = service.queryAllProduct(bean);
		model.addAttribute("allProduct", list);
		return "/_07/companyProductQueryAll";
	}

	// 廠商後台修改商品1 撈出單筆紀錄修改
	@RequestMapping("/companyProductUpdate1")
	public String companyProductUpdate1(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("CompanyLoginOK");
		String company_id = request.getParameter("company_id");
		String product_id = request.getParameter("product_id");
		Integer p1 = Integer.parseInt(product_id);
		CompanyProductBean bean = new CompanyProductBean();
		bean.setProduct_id(p1);
		bean.setCompany_id(company_id);
		service.querybyProductId(bean);
		model.addAttribute("product_id", bean);
		return "/_07/companyProductUpdate";
	}

	// 廠商後台修改商品2 將修改的資料存入DB 並秀出全部商品
	@RequestMapping("/companyProductUpdate2")
	public String companyProductUpdate2(Model model, HttpServletRequest request,@RequestParam("file") MultipartFile file1) throws IOException {
		HttpSession session = request.getSession();
		session.getAttribute("CompanyLoginOK");
		String product_id = request.getParameter("product_id");
		Integer product1 = Integer.parseInt(product_id);
		String product_name = request.getParameter("product_name");
		String price = request.getParameter("price");
		Integer pr1 = Integer.parseInt(price);
		String amount = request.getParameter("amount");
		Integer amount1 = Integer.parseInt(amount);
		String company_id = request.getParameter("company_id");
		String describe = request.getParameter("describe");

		CompanyProductBean bean = new CompanyProductBean();
		bean.setProduct_id(product1);
		bean.setProduct_name(product_name);
		bean.setPrice(pr1);
		bean.setAmount(amount1);
		bean.setCompany_id(company_id);
		bean.setDescribe(describe);
		
		if(!file1.isEmpty()) {
			byte[] byte1 = file1.getBytes();
			Path path = Paths.get("C:\\petuse\\"+bean.getProduct_id()+".jpg");
			Files.write(path, byte1);		
		}
		System.out.println("有沒有檔名"+bean.getProduct_id());
		service.updateProduct(bean, product1);
		return "redirect:/ProductQueryAll1";
	}
		@RequestMapping("/ProductQueryAll1")
		public String processCompanyProductUpdate2(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		CompanyBean loginToken = (CompanyBean) session.getAttribute("CompanyLoginOK");
		loginToken.getCompany_id();	
			
		CompanyProductBean bean = new CompanyProductBean();
		bean.setCompany_id(loginToken.getCompany_id());
		
		List<CompanyProductBean> list = service.queryAllProduct(bean);
		model.addAttribute("allProduct", list);
		return "/_07/companyProductQueryAll";
	}
	
	// 商品模糊查詢
	@RequestMapping("/companyProductQueryByName")
	public String companyProductInsert1(Model moddel, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("CompanyLoginOK");
		String product_name = request.getParameter("product_name");
		CompanyProductBean bean = new CompanyProductBean();
		bean.setProduct_name(product_name);
		List<CompanyProductBean> list = service.fuzzyQueryByProductName(bean);
		moddel.addAttribute("allProduct", list);
		return "/_07/companyProductQueryByProductName";
	}
	// 廠商後台查詢全部商品
		@RequestMapping("/companyProductQueryAll")
		public String companyProductQueryAll(Model model,HttpServletRequest request) {
			HttpSession session = request.getSession();
			session.getAttribute("CompanyLoginOK");
			String company_id = request.getParameter("company_id");
			
			CompanyProductBean bean = new CompanyProductBean();
			bean.setCompany_id(company_id);
			List<CompanyProductBean> list = service.queryAllProduct(bean);
			model.addAttribute("allProduct", list);
			return "/_07/companyProductQueryAll";
		}

	// 商品狀態→下架
	@RequestMapping("/nonSaleProduct")
	public String nonSaleProduct(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("CompanyLoginOK");
		String company_id = request.getParameter("company_id");
		String product_id = request.getParameter("product_id");
		Integer product_id1 = Integer.parseInt(product_id);
		String status = request.getParameter("status");
		Integer status1 = Integer.parseInt(status);

		CompanyProductBean bean = new CompanyProductBean();
		bean.setProduct_id(product_id1);
		bean.setStatus(status1);
		bean.setCompany_id(company_id);

		service.nonSaleByProductId(bean);
		
		List<CompanyProductBean> list = service.queryAllProduct(bean);
		model.addAttribute("allProduct", list);
		return "/_07/companyProductQueryAll";
	}
	// 下架商品列表
	@RequestMapping("/nonSaleProductList")
	public String nonSaleProductList(Model moddel, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("CompanyLoginOK");
		String company_id = request.getParameter("company_id");
		
		CompanyProductBean bean = new CompanyProductBean();
		bean.setCompany_id(company_id);
		
		List<CompanyProductBean> list = service.nonSaleProduct(bean);
		moddel.addAttribute("nonSaleProduct", list);
		return "/_07/companyNonSaleProductList";
	}

	//商品狀態→上架
	@RequestMapping("/onSaleProduct")
	public String onSaleProduct(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("CompanyLoginOK");
		String company_id = request.getParameter("company_id");
		String product_id = request.getParameter("product_id");
		Integer product_id1 = Integer.parseInt(product_id);
		String status = request.getParameter("status");
		Integer status1 = Integer.parseInt(status);

		CompanyProductBean bean = new CompanyProductBean();
		bean.setProduct_id(product_id1);
		bean.setStatus(status1);
		bean.setCompany_id(company_id);
		service.onSaleByProductId(bean);
		List<CompanyProductBean> list = service.nonSaleProduct(bean);
		model.addAttribute("nonSaleProduct", list);
		return "/_07/companyNonSaleProductList";
	}
	
	



	
	
}
