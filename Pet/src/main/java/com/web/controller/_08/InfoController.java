package com.web.controller._08;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.model._08.info.HospitalBean;
import com.web.model._08.info.HotelBean;
import com.web.model._08.info.RestaurantBean;
import com.web.service.impl._08.info.HospitalService;
import com.web.service.impl._08.info.HotelService;
import com.web.service.impl._08.info.RestaurantService;

@Controller
@RequestMapping(value = "_08")
public class InfoController {
	HospitalService hosService;
	HotelService hotService;
	RestaurantService resService;

	@Autowired
	public void setHosService(HospitalService hosService) {
		this.hosService = hosService;
	}

	@Autowired
	public void setHotService(HotelService hotService) {
		this.hotService = hotService;
	}

	@Autowired
	public void setResService(RestaurantService resService) {
		this.resService = resService;
	}

//------	Hospital Table Controller Start		-----//

	// URL為 /hospitals, 搭配 GET方法可以傳回所有hospital紀錄。
	// produces屬性說明產生之資料的格式: produces ="text/html"
	// 本方法可以html格式傳回所有Hospital紀錄
	@RequestMapping(value = "/hospitals", method = RequestMethod.GET, produces = "text/html")
	public String queryAllHospitals(Model model, HttpServletRequest req) {
		List<HospitalBean> hospitals = hosService.qryAllHospital();
		model.addAttribute("allHospitals", hospitals);
		return "_08/hospitals";
	}
//	@RequestMapping(value = "/qryHosByName/{hospital_name}", method = RequestMethod.POST , produces = "text/html")
//	public String getHospitalByName(@PathVariable String name, Model model, HttpServletRequest req) {
//		List<HospitalBean> hospitals = hosService.qryHosByName(name);
//		model.addAttribute("hosName", hospitals);
//		return "redirect: " + req.getContextPath() + "/08/showHospitals";
//	}

	// URL為 /hospitals, 搭配 GET方法可以傳回所有hospital紀錄。
	// produces屬性說明產生之資料的格式: produces ="text/html"
	// 本方法可以html格式傳回所有Hospital紀錄
	@RequestMapping(value = "/hospitalsFront", method = RequestMethod.GET, produces = "text/html")
	public String qryHospitalsFront(Model model, HttpServletRequest req) {
		List<HospitalBean> hospitals = hosService.qryAllHospital();
		model.addAttribute("allHospitals", hospitals);
		return "_08/showHospitals";
	}

	// URL為 /hospitals, 搭配 GET方法可以傳回所有hospital紀錄。
	// produces屬性說明產生之資料的格式: produces ="text/html"
	// 本方法可以html格式傳回所有Hospital紀錄
	@RequestMapping(value = "/hospitalsFront2", method = RequestMethod.GET, produces = "text/html")
	public String qryAllHospitalsFront(Model model, HttpServletRequest req) {
//		List<HospitalBean> hospitals = hosService.qryAllHospital();
//		model.addAttribute("allHospitals", hospitals);
		return "_08/showHospitals";
	}
//	// 以HTML格式顯示單筆Hospital資料
//		@RequestMapping(value = "/hospitals_name", method = RequestMethod.GET, produces = "text/html")
//		public String getHospitalByName(@PathVariable String name, Model model) {
////			HospitalBean hosBean = hosService.qryHosByName(name);
////			model.addAttribute(hosBean);
////			return "_08/displayHospital";
//		}
//	

	// 送回可以新增hospital資料的空白表單
	@RequestMapping(value = "/getEmptyHospitalForm", method = RequestMethod.GET)
	public String inputBlank(Model model) {
		model.addAttribute("hospital", new HospitalBean());
		return "_08/addHospital";
	}

	// URL為 /hospitals, 搭配 POST方法可以新增一筆紀錄
	// 儲存瀏覽器送來的hospital資料
	@RequestMapping(value = "/hospitals", method = RequestMethod.POST)
	public String saveHospital(HospitalBean hosBean) {
		hosService.insertHospital(hosBean);
		return "redirect: hospitals";
	}

	// 以JSON格式顯示單筆hospital資料
	@RequestMapping(value = "hospitals/{hosId}.json", method = RequestMethod.GET, produces = "application/json")
	public String displayHospitalJSON(@PathVariable Integer hosId, Model model) {
		HospitalBean hosBean = hosService.qryHospitalById(hosId);
		model.addAttribute(hosBean);
		return "_08/displayHospital";
	}

	// consumes屬性說明產生之資料的格式: consumes = "application/json"
	// 本方法可將json格式的輸入資料，並將其轉換為Member物件
	@RequestMapping(value = "/hospitals", method = RequestMethod.POST, consumes = "application/json")
	public String saveHospital2(@RequestBody HospitalBean hosBean) {
		System.out.println("consumes = application/json, 1030-POST");
		hosService.insertHospital(hosBean);
		return "redirect: hospitals";
	}

	// URL為 /hospitals, 搭配 GET方法可以傳回所有會員紀錄。
	// produces屬性說明產生之資料的格式: produces = "application/json"
	// 本方法可以JSON格式傳回所有Member紀錄
	@RequestMapping(value = "/hospitals", method = RequestMethod.GET, produces = "application/json")
	public String queryAllHospitalsJSON(Model model, HttpServletRequest req) {
		System.out.println("GET, application/json");
		List<HospitalBean> hospitals = hosService.qryAllHospital();
		model.addAttribute("allHospitals", hospitals);
		return "__08/hospitals";
	}

	// 以HTML格式顯示單筆Hospital資料
	@RequestMapping(value = "hospitals/{hosId}.html", method = RequestMethod.GET, produces = "text/html")
	public String getHospitalById(@PathVariable Integer hosId, Model model) {
		HospitalBean hosBean = hosService.qryHospitalById(hosId);
		model.addAttribute(hosBean);
		return "_08/displayHospital";
	}

	// 顯示單筆hospital資料，然後導向更新畫面
	@RequestMapping(value = "/hospitals/{hosId}", method = RequestMethod.GET)
	public String findHospital(@PathVariable Integer hosId, Model model) {
		HospitalBean hosBean = hosService.qryHospitalById(hosId);
		model.addAttribute(hosBean);
		return "_08/updateHospitals";
	}

	// 修改單筆hospital資料
	@RequestMapping(value = "/hospitals/{hosId}", method = RequestMethod.POST)
	public String updateHospital(@PathVariable Integer hosId, HospitalBean hosBean, HttpServletRequest req) {
		hosService.updateHospital(hosBean, hosId);
		return "redirect: " + req.getContextPath() + "/_08/hospitals";
	}

	// 刪除單筆hospital資料
	@RequestMapping(value = "/hospitals/{hosId}", method = RequestMethod.DELETE)
	public String deleteHospital(HospitalBean hosBean, Model model, HttpServletRequest req) {
		hosService.deleteHospital(hosBean);
		return "redirect: " + req.getContextPath() + "/_08/hospitals";
	}

//------	Hospital Table Controller End	-----//

//------	Hotel Table Controller Start	-----//

	// URL為 /hotels, 搭配 GET方法可以傳回所有hotel紀錄。
	// produces屬性說明產生之資料的格式: produces = "application/json"
	// 本方法可以JSON格式傳回所有hotels紀錄
	@RequestMapping(value = "/hotels", method = RequestMethod.GET, produces = "application/json")
	public String queryAllHotelJSON(Model model, HttpServletRequest req) {
		System.out.println("GET, application/json");
		List<HotelBean> hotels = hotService.qryAllHotel();
		model.addAttribute("allHotels", hotels);
		return "_08/hotels";
	}

	// URL為 /hotels, 搭配 GET方法可以傳回所有hotels紀錄。
	// produces屬性說明產生之資料的格式: produces ="text/html"
	// 本方法可以html格式傳回所有hotels紀錄
	@RequestMapping(value = "/hotels", method = RequestMethod.GET, produces = "text/html")
	public String queryAllHotelJSP(Model model, HttpServletRequest req) {
		List<HotelBean> hotels = hotService.qryAllHotel();
		model.addAttribute("allHotels", hotels);
		return "_08/hotels";
	}

	// URL為 /hotels, 搭配 GET方法可以傳回所有hotels紀錄。
	// produces屬性說明產生之資料的格式: produces ="text/html"
	// 本方法可以html格式傳回所有hotels紀錄
	@RequestMapping(value = "/hotelsFront", method = RequestMethod.GET, produces = "text/html")
	public String queryAllHotelFront(Model model, HttpServletRequest req) {
		List<HotelBean> hotels = hotService.qryAllHotel();
		model.addAttribute("allHotels", hotels);
		return "_08/showHotels";
	}
	@RequestMapping(value = "/hotelsFront2", method = RequestMethod.GET, produces = "text/html")
	public String queryAllHotelFront2(Model model, HttpServletRequest req) {
//		List<HotelBean> hotels = hotService.qryAllHotel();
//		model.addAttribute("allHotels", hotels);
		return "_08/showHotels";
	}

	// 送回可以新增hotel資料的空白表單
	@RequestMapping(value = "/getEmptyHotelForm", method = RequestMethod.GET)
	public String inputHotel(Model model) {
		model.addAttribute("hotel", new HotelBean());
		return "_08/addHotel";
	}

	// URL為 /hotels, 搭配 POST方法可以新增一筆紀錄
	// 儲存瀏覽器送來的hotels資料
	@RequestMapping(value = "/hotels", method = RequestMethod.POST)
	public String saveHotel1(HotelBean hotBean) {
		hotService.insertHotel(hotBean);
		return "redirect: hotels";
	}

	// consumes屬性說明產生之資料的格式: consumes = "application/json"
	// 本方法可將json格式的輸入資料，並將其轉換為hotel物件
	@RequestMapping(value = "/hotels", method = RequestMethod.POST, consumes = "application/json")
	public String saveHotel2(@RequestBody HotelBean hotBean) {
		System.out.println("consumes = application/json, 1030-POST");
		hotService.insertHotel(hotBean);
		return "redirect: hotels";
	}

	// 以HTML格式顯示單筆hotel資料
	@RequestMapping(value = "hotels/{hotId}.html", method = RequestMethod.GET, produces = "text/html")
	public String displayHotelJSP(@PathVariable Integer hotId, Model model) {
		HotelBean hotBean = hotService.qryHotelById(hotId);
		model.addAttribute(hotBean);
		return "_08/displayHotel";
	}

	// 以JSON格式顯示單筆hotel資料
	@RequestMapping(value = "hotels/{hotId}.json", method = RequestMethod.GET, produces = "application/json")
	public String displayHotelJSON(@PathVariable Integer hotId, Model model) {
		HotelBean hotBean = hotService.qryHotelById(hotId);
		model.addAttribute(hotBean);
		return "_08/displayHotel";
	}

	// 顯示單筆hotel資料，然後導向更新畫面
	@RequestMapping(value = "/hotels/{hotId}", method = RequestMethod.GET)
	public String findHotels(@PathVariable Integer hotId, Model model) {
		HotelBean hotBean = hotService.qryHotelById(hotId);
		model.addAttribute(hotBean);
		return "_08/updateHotel";
	}

	// 刪除單筆hotel資料
	@RequestMapping(value = "/hotels/{hotId}", method = RequestMethod.DELETE)
	public String deleteHotels(@RequestBody HotelBean hotBean, Model model, HttpServletRequest req) {
		hotService.deleteHotel(hotBean);
		return "redirect: " + req.getContextPath() + "/_08/hotels";
	}

	// 修改單筆hotel資料
	@RequestMapping(value = "/hotels/{hotId}", method = RequestMethod.POST)
	public String updateHotels(@PathVariable Integer hotId, HotelBean hotBean, HttpServletRequest req) {
		hotService.updateHotel(hotBean, hotId);
		return "redirect: " + req.getContextPath() + "/_08/hotels";
	}

//------	Hotel Table Controller End	-----//

//------	Restaurant Table Controller Start	-----//

	// URL為 /restaurants, 搭配 GET方法可以傳回所有Res紀錄。
	// produces屬性說明產生之資料的格式: produces = "application/json"
	// 本方法可以JSON格式傳回所有restaurants紀錄
	@RequestMapping(value = "/restaurants", method = RequestMethod.GET, produces = "application/json")
	public String queryAllResJSON(Model model, HttpServletRequest req) {
		System.out.println("GET, application/json");
		List<RestaurantBean> restaurants = resService.qryAllRestaurant();
		model.addAttribute("allrestaurants", restaurants);
		return "_08/restaurants";
	}

	// URL為 /restaurants, 搭配 GET方法可以傳回所有restaurants紀錄。
	// produces屬性說明產生之資料的格式: produces ="text/html"
	// 本方法可以html格式傳回所有restaurants紀錄
	@RequestMapping(value = "/restaurants", method = RequestMethod.GET, produces = "text/html")
	public String queryAllResJSP(Model model, HttpServletRequest req) {
		List<RestaurantBean> restaurants = resService.qryAllRestaurant();
		model.addAttribute("allrestaurants", restaurants);
		return "_08/restaurants";
	}

	// URL為 /restaurants, 搭配 GET方法可以傳回所有restaurants紀錄。
	// produces屬性說明產生之資料的格式: produces ="text/html"
	// 本方法可以html格式傳回所有restaurants紀錄
	@RequestMapping(value = "/resFront", method = RequestMethod.GET, produces = "text/html")
	public String queryAllResFront(Model model, HttpServletRequest req) {
		List<RestaurantBean> restaurants = resService.qryAllRestaurant();
		model.addAttribute("allrestaurants", restaurants);
		return "_08/showRes";
	}
	@RequestMapping(value = "/resFront2", method = RequestMethod.GET, produces = "text/html")
	public String queryAllResFront2(Model model, HttpServletRequest req) {
//		List<RestaurantBean> restaurants = resService.qryAllRestaurant();
//		model.addAttribute("allrestaurants", restaurants);
		return "_08/showRes";
	}

	// 送回可以新增restaurants資料的空白表單
	@RequestMapping(value = "/getEmptyResForm", method = RequestMethod.GET)
	public String inputRes(Model model) {
		model.addAttribute("res", new RestaurantBean());
		return "_08/addRestaurant";
	}

	// URL為 /restaurants, 搭配 POST方法可以新增一筆紀錄
	// 儲存瀏覽器送來的restaurants資料
	@RequestMapping(value = "/restaurants", method = RequestMethod.POST)
	public String saveRes1(RestaurantBean resBean) {
		resService.insertRestaurant(resBean);
		return "redirect: restaurants";
	}

	// consumes屬性說明產生之資料的格式: consumes = "application/json"
	// 本方法可將json格式的輸入資料，並將其轉換為Res物件
	@RequestMapping(value = "/restaurants", method = RequestMethod.POST, consumes = "application/json")
	public String saveRes2(@RequestBody RestaurantBean resBean) {
		System.out.println("consumes = application/json, 1030-POST");
		resService.insertRestaurant(resBean);
		return "redirect: restaurants";
	}

	// 以HTML格式顯示單筆Res資料
	@RequestMapping(value = "restaurants/{resId}.html", method = RequestMethod.GET, produces = "text/html")
	public String displayResJSP(@PathVariable Integer resId, Model model) {
		RestaurantBean resBean = resService.qryRestaurantById(resId);
		model.addAttribute(resBean);
		return "_08/displayRes";
	}

	// 以JSON格式顯示單筆Res資料
	@RequestMapping(value = "restaurants/{resId}.json", method = RequestMethod.GET, produces = "application/json")
	public String displayResJSON(@PathVariable Integer resId, Model model) {
		RestaurantBean resBean = resService.qryRestaurantById(resId);
		model.addAttribute(resBean);
		return "_08/displayRes";
	}

	// 顯示單筆Res資料，然後導向更新畫面
	@RequestMapping(value = "/restaurants/{resId}", method = RequestMethod.GET)
	public String findrestaurants(@PathVariable Integer resId, Model model) {
		RestaurantBean resBean = resService.qryRestaurantById(resId);
		model.addAttribute(resBean);
		return "_08/updateRes";
	}

	// 刪除單筆Res資料
	@RequestMapping(value = "/restaurants/{resId}", method = RequestMethod.DELETE)
	public String deleterestaurants(@RequestBody RestaurantBean resBean, Model model, HttpServletRequest req) {
		resService.deleteRestaurant(resBean);
		return "redirect: " + req.getContextPath() + "/_08/restaurants";
	}

	// 修改單筆Res資料
	@RequestMapping(value = "/restaurants/{resId}", method = RequestMethod.POST)
	public String updaterestaurants(@PathVariable Integer resId, RestaurantBean resBean, HttpServletRequest req) {
		resService.updateRestaurant(resBean, resId);
		return "redirect: " + req.getContextPath() + "/_08/restaurants";
	}

//------	Restaurant Table Controller End	-----//

}
