package kr.co.jabusim.controller;

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
@RequestMapping("/mypage")
public class MyPageController {

	
	@Autowired
	private UserService userService;
	
	//마이페이지
	@GetMapping("/main")
	public String main(Model model) {
		
			
		UserBean myPageUserBean = userService.getAllUserInfo();
		model.addAttribute("myPageUserBean", myPageUserBean);
		
		return "mypage/main";
	}
	
	//--------------------------------myLicense------------------------------------
	//자격증관리
	@GetMapping("/myLicense/licenseManage")
	public String licenseManage() {
		return "mypage/myLicense/licenseManage";
	}
	//자격증일정
	@GetMapping("/myLicense/licenseSchedule")
	public String licenseSchedule() {
		return "mypage/myLicense/licenseSchedule";
	}
	
	//--------------------------------myDetailManage------------------------------------
	
	//시험결과
	@GetMapping("/myDetailManage/exam_result")
	public String exam_result() {
		return "mypage/myDetailManage/exam_result";
	}
	
	//자격증 접수 내역
	@GetMapping("/myDetailManage/receiptDetail")
	public String receiptDetail() {
		return "mypage/myDetailManage/receiptDetail";
	}
	
	//문의 내역
	@GetMapping("/myDetailManage/inquiryDetail")
	public String inquiryDetail() {
		return "mypage/myDetailManage/inquiryDetail";
	}
	

	//--------------------------------myInfoManage------------------------------------

	//개인정보 수정
	@GetMapping("/myInfoManage/userInfoModify")
	public String userInfoModify(@ModelAttribute("modifyUserBean") UserBean modifyUserBean) {
		
		userService.getModifyUserInfo(modifyUserBean); 
		  
		
		return "mypage/myInfoManage/userInfoModify";
	}
	
	
	@PostMapping("/myInfoManage/userInfoModify_pro")
	public String userInfoModify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean, BindingResult result) {
		
		
		if(result.hasErrors()) {
			System.out.println("오류");
			return "mypage/myInfoManage/userInfoModify";
		}
		
		userService.modifyUserInfo(modifyUserBean);
		return "mypage/myInfoManage/userInfoModify_success";
	}
	
	
	//학력/경력 수정
	@GetMapping("/myInfoManage/careerModify")
	public String careerModify() {	
		return "mypage/myInfoManage/careerModify";
	}
	
	//학력/경력 수정
		@GetMapping("/myInfoManage/liceseAttestation")
		public String liceseAttestation() {	
			return "mypage/myInfoManage/liceseAttestation";
		}
	
	//-----------------------------------------------------------------------------------
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserValidator Vaildator1 = new UserValidator();
		binder.addValidators(Vaildator1);
	}
}

