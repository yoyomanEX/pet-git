//package com.web.controller._02;
//
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//public class HomeController {
//	@RequestMapping("/")
//	public String welcome(Model model) {
//		model.addAttribute("title", "歡迎光臨君雅網路商城!!!");
//		model.addAttribute("subtitle", "網路上獨一無二的購物天堂");
//		return "_02/welcome";
//	}
	

//	
//	@RequestMapping("/ServerTime")
//	public String abc(Model model) {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
//		Date d = new Date();  //java.util.Date
//		String timeNow = sdf.format(d);
//		model.addAttribute("now",timeNow);
//		return "serverTime";  //jsp的檔名(大小寫要注意)
//	}

//}
