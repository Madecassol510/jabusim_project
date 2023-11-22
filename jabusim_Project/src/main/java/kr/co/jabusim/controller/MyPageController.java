package kr.co.jabusim.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.service.UserService;
import kr.co.jabusim.validator.UserValidator;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	
	@Autowired
	private UserService userService;
	

	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyUserBean") UserBean modifyUserBean) {
		
		userService.getModifyUserInfo(modifyUserBean);
		return "mypage/modify";
	}
		
	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean, BindingResult result) {
		
		System.out.println("수정");
		
		if(result.hasErrors()) {
			return "mypage/modify";
		}
		
		userService.modifyUserInfo(modifyUserBean);
		return "mypage/modify_success";
	}
	
	
	@GetMapping("/main")
	public String main(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		return "mypage/main";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserValidator Vaildator1 = new UserValidator();
		binder.addValidators(Vaildator1);
	}
}

