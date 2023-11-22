package kr.co.jabusim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jabusim.beans.UserBean;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@GetMapping("/chk_schedule")
	public String chk_schedule() {
		return "mypage/chk_schedule";
	}

	@GetMapping("/modify_info")
	public String modify_info() {
		return "mypage/modify_info";
	}
	
	@GetMapping("/main")
	public String main(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		return "mypage/main";
	}
	
	@GetMapping("/valid_passwd")
	public String valid_passwd() {
		return "mypage/valid_passwd";
	}
	
	@GetMapping("/registered_certificate")
	public String registered_certificate() {
		return "mypage/registered_certificate";
	}
	
	@GetMapping("/compledted_modify")
	public String compledted_modify() {
		return "mypage/compledted_modify";
	}
}

