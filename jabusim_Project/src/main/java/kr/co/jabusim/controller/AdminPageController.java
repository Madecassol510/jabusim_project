package kr.co.jabusim.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.ExamPlaceBean;
import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;
import kr.co.jabusim.mapper.ExamMapper;
import kr.co.jabusim.mapper.ExamPlaceMapper;
import kr.co.jabusim.mapper.LicenseMapper;
import kr.co.jabusim.mapper.UserCareerMapper;
import kr.co.jabusim.mapper.UserEduMapper;
import kr.co.jabusim.service.UserService;

@Controller
@RequestMapping("/adminPage")
public class AdminPageController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserEduMapper userEduMapper;
	
	@Autowired
	private UserCareerMapper userCareerMapper;
	
	@Autowired
	private LicenseMapper licenseMapper;
	
	@Autowired
	private ExamMapper examMapper;
	
	@Autowired
	private ExamPlaceMapper examPlaceMapper;
	
	
	
	@GetMapping("/main")
	public String main() {
		return "adminPage/main";
	}
	
	@GetMapping("/memberManage")
	public String memberManage(Model model) {
		
		ArrayList<UserBean> allUserBeans =  userService.getAllUserInfo();
		
		model.addAttribute("allUserBeans", allUserBeans);
		
		return "adminPage/memberManage";
	}
	
	//================================문의관리===================================
	
	// 학력추가
	@GetMapping("/inquiryManage/eduInquiryManage")
	public String eduInquiryManage(Model model) {
		
		ArrayList<UserEduBean> allUserEduBeans = userEduMapper.allUserEduInfo();
		model.addAttribute("allUserEduBeans", allUserEduBeans);
		
		return "adminPage/inquiryManage/eduInquiryManage";
	}
	
	// 경력추가
	@GetMapping("/inquiryManage/carrerInquiryManage")
	public String carrerInquiryManage(Model model) {
		
		ArrayList<UserCareerBean> allUserCareerBeans = userCareerMapper.allUserCareerInfo();
		
		model.addAttribute("allUserCareerBeans", allUserCareerBeans);
		
		
		return "adminPage/inquiryManage/carrerInquiryManage";
	}
	
	//================================자격증관리===================================
	
	// 자격증관리	
	@GetMapping("/licenseManage")
	public String licenseManage(Model model) {
		
		ArrayList<LicenseBean> allLicenseBeans = licenseMapper.allLicenseInfo();
		
		model.addAttribute("allLicenseBeans", allLicenseBeans);
		
		return "adminPage/licenseManage";
	}
		
	//================================시험관리====================================
	
	//시험관리
	@GetMapping("/examManage/examManage")
	public String examManage(Model model) {
		
		ArrayList<ExamBean> allExamBeans = examMapper.allExamInfo();
		
		model.addAttribute("allExamBeans", allExamBeans);
		
		return "adminPage/examManage/examManage";
	}
	
	// 시험장소
	@GetMapping("/examManage/examPlaceManage")
	public String examPlaceManage(Model model) {
			
		ArrayList<ExamPlaceBean> allExamPlaceBeans = examPlaceMapper.allExamPlaceInfo();
			
		model.addAttribute("allExamPlaceBeans", allExamPlaceBeans);
			
		return "adminPage/examManage/examPlaceManage";
	}
	
	
	// 시험접수
	@GetMapping("/examManage/examReceiptManage")
	public String examReceiptManage() {
		return "adminPage/examManage/examReceiptManage";
	}

	
	
	// 시험결과
	@GetMapping("/examManage/examResultManage")
	public String examResultManage() {
		return "adminPage/examManage/examResultManage";
	}
	
	// 시험합격률
	@GetMapping("/passingRate")
	public String passingRate() {
		return "adminPage/passingRate";
	}
}
