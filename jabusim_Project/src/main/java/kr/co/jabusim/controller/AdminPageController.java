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
	
	
	
	//================================문의관리===================================
	
	// 학력추가
	@GetMapping("/inquiryManage/eduInquiryManage")
	public String eduInquiryManage() {
		return "adminPage/inquiryManage/eduInquiryManage";
	}
	
	// 경력추가
	@GetMapping("/inquiryManage/carrerInquiryManage")
	public String carrerInquiryManage() {
		return "adminPage/inquiryManage/carrerInquiryManage";
	}
	
	//================================자격증관리===================================
	
	// 자격증관리	
	@GetMapping("/licenseManage")
	public String licenseManage() {
		return "adminPage/licenseManage";
	}
		
	//================================시험관리====================================
	
	//시험관리
	@GetMapping("/examManage/examManage")
	public String examManage() {
		return "adminPage/examManage/examManage";
	}
	
	// 시험접수
	@GetMapping("/examManage/examReceiptManage")
	public String examReceiptManage() {
		return "adminPage/examManage/examReceiptManage";
	}

	// 시험장소
	@GetMapping("/examManage/examPlaceManage")
	public String examPlaceManage() {
		return "adminPage/examManage/examPlaceManage";
	}
	
	// 시험결과
	@GetMapping("/examManage/examResultManage")
	public String examResultManage() {
		return "adminPage/examManage/examResultManage";
	}
	
	
	// 시험합격률
	@GetMapping("/examManage/examPlaceManage/examPassingRate")
	public String examPassingRate() {
		return "adminPage/examManage/examPassingRate";
	}
}
