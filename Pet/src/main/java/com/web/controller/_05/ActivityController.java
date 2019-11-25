package com.web.controller._05;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.model._01.MemberBean;
import com.web.model._05.ActivityPeopleBean;
import com.web.model._05.PetActivityBean;
import com.web.service.impl._05.ActivityPeopleService;
import com.web.service.impl._05.PetActivityService;



@Controller
public class ActivityController {
	
	PetActivityService activityService;
	ServletContext context;
	ActivityPeopleService ActivityPeople;
	
	@Autowired
	public void setActivityPeople(ActivityPeopleService activityPeople) {
		this.ActivityPeople = activityPeople;
	}
	@Autowired
	public void setPetActivityService(PetActivityService activityService) {
		this.activityService = activityService;
	}
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	//新增活動
	@RequestMapping(value = "/savePetActivity", method=RequestMethod.GET)
	public String addActivity(Model model) {
		PetActivityBean pab = new PetActivityBean();
		model.addAttribute("PetActivityBean",pab);
		return "_05/addactivity";
	}
	
	@RequestMapping(value = "/savePetActivity",method = RequestMethod.POST)
	public String savePetActivity(@ModelAttribute("PetActivityBean") PetActivityBean pab) {
		MultipartFile productImage = pab.getAimage();
		String originalFilename = productImage.getOriginalFilename();
		pab.setFileName(originalFilename);
		//  建立Blob物件，交由 Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty() ) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				pab.setActivity_image(blob);;
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		activityService.savePetActivity(pab);
	    String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists()) imageFolder.mkdirs();
			File file = new File(imageFolder, pab.getActivity_id() + ext);
			productImage.transferTo(file);
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		return "redirect:/adminallactivity";
	}
//	//刪除活動
//	@RequestMapping(value = "/_05.deletePetActivity", method = RequestMethod.POST)
//	public String deletePetActivity(PetActivityBean pab) {
//		petActivityService.deletePetActivity(pab);
//		return "";
//	}
//	//修改活動
//	@RequestMapping(value = "/_05.updataActivity", method = RequestMethod.POST)
//	public String updataActivity(PetActivityBean pab) {
//		petActivityService.updataActivity(pab);
//		return "";
//	}
//	//查詢管理員新增的活動
//	@RequestMapping(value="/_05.queryAdminPetActivity",method = RequestMethod.GET
//			,produces="application/json")
//	public @ResponseBody List<PetActivityBean> queryAdminPetActivity(HttpServletRequest request){
//		HttpSession session = request.getSession();
//		AdminBean loginToken = (AdminBean) session.getAttribute("AdminLoginOK");
//		List<PetActivityBean> list=petActivityService.queryAdminPetActivity(loginToken);
//		return list;
//	}
	//查詢會員參加的活動
	@RequestMapping(value="/memberjoinactivity")
	public String queryMemberPetActivity(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String id = loginToken.getMember_Id();
		System.out.println("恩恩"+id);
		List<ActivityPeopleBean> list = ActivityPeople.queryMemberActivity(id);
		System.out.println("西西"+list);
		List<PetActivityBean> list2=activityService.queryMemberPetActivity(list);
		System.out.println("哈哈"+list2);
		model.addAttribute("memberjoinactivity",list2);
		return "_05/memberjoinactivitys";
	}
	//會員查詢全部活動
	@RequestMapping(value="/allactivity")
	public String MemberAllActivity(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
//		MemberBean member_Id = (MemberBean) session.getAttribute("LoginOK");
		List<PetActivityBean> list1=activityService.queryAllPetActivity();
//		List<ActivityPeopleBean> list2=ActivityPeople.queryMemberActivity(member_Id.getMember_Id());
		model.addAttribute("allactivity",list1);
//		model.addAttribute("memberactivity",list2);
		return "_05/allactivity";
	}
	
	@RequestMapping(value="/adminallactivity")
	public String adminAllActivity(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
//		MemberBean member_Id = (MemberBean) session.getAttribute("LoginOK");
		List<PetActivityBean> list1=activityService.queryAllPetActivity();
//		List<ActivityPeopleBean> list2=ActivityPeople.queryMemberActivity(member_Id.getMember_Id());
		model.addAttribute("allactivity",list1);
//		model.addAttribute("memberactivity",list2);
		return "_05/adminallactivity";
	}
	
//	//參加活動
//	@RequestMapping(value = "/_05.saveActivityPeople", method = RequestMethod.POST)
//	public String saveActivityPeople(ActivityPeopleBean apb,PetActivityBean pab,MemberBean mb) {
//		ActivityPeople.saveActivityPeople(apb);
//		return "_05/allactivity";
//	}
//	//取消已參加的活動
//	@RequestMapping(value = "/_05.deleteActivityPeople", method = RequestMethod.POST)
//	public String deleteActivityPeople(ActivityPeopleBean apb) {
//		activityPeopleService.deleteActivityPeople(apb);
//		return "";
//
//	}
//	
//	//查詢參加活動的會員
//	@RequestMapping(value="/_05.queryActivityPeople",method = RequestMethod.GET
//			,produces="application/json")
//	public @ResponseBody List<ActivityPeopleBean> queryActivityPeople(Integer id){
//		List<ActivityPeopleBean> list=activityPeopleService.queryActivityPeople(id);
//		return list;
//	}
	//查詢活動圖片
	@RequestMapping(value = "/activitypicture/{activity_id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer activity_id) {
		String filePath = "/resources/img/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		PetActivityBean pab = activityService.getActivityById(activity_id);
		if (pab != null) {
			Blob blob = pab.getActivity_image();
			filename = pab.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
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
	
	@RequestMapping("/activity")
	public String getActivityById(@RequestParam("activity_id") Integer activity_id,Model model
			,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean member_Id = (MemberBean) session.getAttribute("LoginOK");
		ModelAndView mv = new ModelAndView();
		List<ActivityPeopleBean> list2=ActivityPeople.queryMemberActivity(member_Id.getMember_Id());
	    for(int i=0;i<list2.size();i++) {
	    	int a=list2.get(i).getActivity_id();
	    	if(a==activity_id) {
	    		model.addAttribute("already",1);
	    	}
	    }
//	    if (list2.contains()) {
//	    	System.out.println("帥哥金城武");
//	    	model.addAttribute("already",1);
//		}
		model.addAttribute("activity",activityService.getActivityById(activity_id));
		model.addAttribute("memberactivity",list2);
		return "_05/activity";
	}
	
	@RequestMapping("/adminactivity")
	public String getAdminActivityById(@RequestParam("activity_id") Integer activity_id,Model model
			,HttpServletRequest request) {
		HttpSession session = request.getSession();

		model.addAttribute("activity",activityService.getActivityById(activity_id));
	
		return "_05/adminactivity";
	}
	
	@RequestMapping("/memberactivity")
	public String getActivityByMemberId(@RequestParam("activity_id") Integer activity_id,Model model
			,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberBean member_Id = (MemberBean) session.getAttribute("LoginOK");
		ModelAndView mv = new ModelAndView();
		List<ActivityPeopleBean> list2=ActivityPeople.queryMemberActivity(member_Id.getMember_Id());
	    for(int i=0;i<list2.size();i++) {
	    	int a=list2.get(i).getActivity_id();
	    	if(a==activity_id) {
	    		model.addAttribute("already",1);
	    	}
	    }
//	    if (list2.contains()) {
//	    	System.out.println("帥哥金城武");
//	    	model.addAttribute("already",1);
//		}
		model.addAttribute("activity",activityService.getActivityById(activity_id));
		model.addAttribute("memberactivity",list2);
		return "_05/memberactivity";
	}
}
