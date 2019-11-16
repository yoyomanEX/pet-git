package com.web.controller._08;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("_08")
public class IndexController {
	
	@RequestMapping(value = "/admin0123")
	public String backstage() {
		return "_08/AdminBackstage";
	}
	

}
