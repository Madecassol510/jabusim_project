package kr.co.jabusim.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jabusim.beans.UserBean;

@Controller
public class MainController {

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	
	@GetMapping("/main")
	public String main() {
		System.out.println(loginUserBean.isUserLogin());
		
		return "main";
	}
}
