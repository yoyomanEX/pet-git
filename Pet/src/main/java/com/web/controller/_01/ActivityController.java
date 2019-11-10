package com.web.controller._01;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.model._01.ActivityPeopleBean;
import com.web.model._01.AdminBean;
import com.web.model._01.MemberBean;
import com.web.model._01.PetActivityBean;
import com.web.service.impl._01.ActivityPeopleService;
import com.web.service.impl._01.PetActivityService;

@Controller
public class ActivityController {
	PetActivityService petActivityService;
	
	@Autowired
	public void setPetActivityService(PetActivityService petActivityService) {
		this.petActivityService = petActivityService;
	}
	
	ActivityPeopleService activityPeopleService;
	
	@Autowired
	public void setActivityPeopleService(ActivityPeopleService activityPeopleService) {
		this.activityPeopleService = activityPeopleService;
	}
	
	//新增活動
	@RequestMapping(value = "/_01.savePetActivity", method = RequestMethod.POST)
	public String savePetActivity(HttpServletRequest request,PetActivityBean pab) {
		HttpSession session = request.getSession();
		AdminBean loginToken = (AdminBean) session.getAttribute("AdminLoginOK");
		String id = loginToken.getAdmin_Id();
		pab.setAdmin_Id(id);
		petActivityService.savePetActivity(pab);
		System.out.println("987654321");
		return "";
	}
	//刪除活動
	@RequestMapping(value = "/_01.deletePetActivity", method = RequestMethod.POST)
	public String deletePetActivity(PetActivityBean pab) {
		petActivityService.deletePetActivity(pab);
		return "_01/ttt";
	}
	//修改活動
	@RequestMapping(value = "/_01.updataActivity", method = RequestMethod.POST)
	public String updataActivity(PetActivityBean pab) {
		petActivityService.updataActivity(pab);
		return "_01/ttt";
	}
	//查詢管理員新增的活動
	@RequestMapping(value="/_01.queryAdminPetActivity",method = RequestMethod.GET
			,produces="application/json")
	public @ResponseBody List<PetActivityBean> queryAdminPetActivity(HttpServletRequest request){
		HttpSession session = request.getSession();
		AdminBean loginToken = (AdminBean) session.getAttribute("AdminLoginOK");
		List<PetActivityBean> list=petActivityService.queryAdminPetActivity(loginToken);
		return list;
	}
	//查詢會員參加的活動
	@RequestMapping(value="/_01.queryMemberPetActivity",method = RequestMethod.GET
			,produces="application/json")
	public @ResponseBody List<PetActivityBean> queryMemberPetActivity(HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		String id = loginToken.getMember_Id();
		List<ActivityPeopleBean> list = activityPeopleService.queryMemberActivity(id);
		List<PetActivityBean> list2=petActivityService.queryMemberPetActivity(list);
		return list2;
	}
	//查詢全部活動
	@RequestMapping(value="/_01.queryAllPetActivity",method = RequestMethod.GET
			,produces="application/json")
	public @ResponseBody List<PetActivityBean> queryAllPetActivity(){
		List<PetActivityBean> list=petActivityService.queryAllPetActivity();
		return list;
	}
	
	//參加活動
	@RequestMapping(value = "/_01.saveActivityPeople", method = RequestMethod.POST)
	public String saveActivityPeople(ActivityPeopleBean apb) {
		activityPeopleService.saveActivityPeople(apb);
		return "_01/ttt";
	}
	//取消已參加的活動
	@RequestMapping(value = "/_01.deleteActivityPeople", method = RequestMethod.POST)
	public String deleteActivityPeople(ActivityPeopleBean apb) {
		activityPeopleService.deleteActivityPeople(apb);
		return "_01/ttt";
	}
	
	//查詢參加活動的會員
	@RequestMapping(value="/_01.queryActivityPeople",method = RequestMethod.GET
			,produces="application/json")
	public @ResponseBody List<ActivityPeopleBean> queryActivityPeople(Integer id){
		List<ActivityPeopleBean> list=activityPeopleService.queryActivityPeople(id);
		return list;
	}
}
