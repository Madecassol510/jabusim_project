package kr.co.jabusim.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.service.UserService;
import kr.co.jabusim.validator.UserValidator;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
		
	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
			@RequestParam(value="fail", defaultValue = "false") boolean fail, // �ӽ� ����
			Model model) {
		
		
		model.addAttribute("fail", fail);
		return "user/login";
	}
	
	@PostMapping("/login_pro")
	public String login_pro(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
			Model model) {
		

		// �α��� ���ɿ���
		userService.getLoginUserInfo(tempLoginUserBean);

		// �α��� ��������
		if (loginUserBean.isUserLogin() == true) {
			userService.raiseVisitCount(loginUserBean.getUser_idx());
			return "user/login_success";
		} else {
			boolean fail = true;
			
			tempLoginUserBean = new UserBean();
			model.addAttribute("fail", fail);
			model.addAttribute("tempLoginUserBean", tempLoginUserBean);
			return "user/login";
		}	
	}

	
	//회원가입
	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		return "user/join";
	}
	
	@PostMapping("/join_pro")
	public String join_pro (@Valid @ModelAttribute("joinUserBean") UserBean joinUserBean, BindingResult result) {
		
		if(result.hasErrors()) {
			
			return "user/join";
		}
		
		userService.addUserInfo(joinUserBean);
		
		return "user/join_success";
	}
	
	
	
	@GetMapping("/logout")
	public String logout() {
		
		loginUserBean.setUserLogin(false);
		
		return "user/logout";
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserValidator Vaildator1 = new UserValidator();
		binder.addValidators(Vaildator1);
	}
}

