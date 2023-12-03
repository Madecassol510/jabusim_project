package kr.co.jabusim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adminPage")
public class AdminPageController {
	
	@GetMapping("/main")
	public String main() {
		return "adminPage/main";
	}
	
	@GetMapping("/memberManage")
	public String memberManage() {
		return "adminPage/memberManage";
	}
	
	@GetMapping("/examManage")
	public String examManage() {
		return "adminPage/examManage";
	}
	
	@GetMapping("/licenseManage")
	public String licenseManage() {
		return "adminPage/licenseManage";
	}
	
	@GetMapping("/inquiryManage")
	public String inquiryManage() {
		return "adminPage/inquiryManage";
	}
}
