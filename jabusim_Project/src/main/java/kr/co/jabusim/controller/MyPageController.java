package kr.co.jabusim.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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

import kr.co.jabusim.beans.CareerBean;
import kr.co.jabusim.beans.EduBean;
import kr.co.jabusim.beans.ExamReceiptBean;
import kr.co.jabusim.beans.ExamResultBean;
import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;
import kr.co.jabusim.mapper.ExamMapper;
import kr.co.jabusim.mapper.ExamReceiptMapper;
import kr.co.jabusim.mapper.ExamResultMapper;
import kr.co.jabusim.mapper.LicenseMapper;
import kr.co.jabusim.mapper.UserCareerMapper;
import kr.co.jabusim.mapper.UserEduMapper;
import kr.co.jabusim.mapper.UserMapper;
import kr.co.jabusim.service.UserService;
import kr.co.jabusim.validator.UserValidator;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LicenseMapper licenseMapper;
	
	@Autowired
	private ExamResultMapper examResultMapper;
	
	@Autowired
	private ExamReceiptMapper examReceiptMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserEduMapper userEduMapper;
	
	@Autowired
	private UserCareerMapper userCareerMapper;
	
	//마이페이지
	@GetMapping("/main")
	public String main(Model model) {
		
			
		UserBean myPageUserBean = userService.getUserAllInfo();
		
		ArrayList<LicenseBean> userOwnLicenseBeans = licenseMapper.getUserOwnLicenseBeans(myPageUserBean.getUser_id());
		
		
		//나의 정보
		model.addAttribute("myPageUserBean", myPageUserBean);
		
		
		//활동정보
		// 방문수
		
		// 문의 개수
		int inquiryCount =
		userEduMapper.getUserEduInfo(myPageUserBean.getUser_id()).size() + userCareerMapper.getUserCareerInfo(myPageUserBean.getUser_id()).size();
	
		System.out.println(inquiryCount);
				
		// 최근 시험		
		ExamResultBean examResultBean = examResultMapper.getUserLastExam(myPageUserBean.getUser_id());
		
		// 자격증 개수
		int licenseCount = userOwnLicenseBeans.size();
		
		model.addAttribute("inquiryCount", inquiryCount);
		model.addAttribute("licenseCount", licenseCount);
		model.addAttribute("userOwnLicenseBeans", userOwnLicenseBeans);
		model.addAttribute("examResultBean", examResultBean);
		
		return "mypage/main";
	}
	

	
	//--------------------------------myDetailManage------------------------------------
	
	//시험결과
	@GetMapping("/myDetailManage/exam_result")
	public String exam_result(Model model) {
		
		UserBean myPageUserBean = userService.getUserAllInfo();
		
		ArrayList<ExamResultBean> userExamResultBeans =  examResultMapper.getUserExamResultList(myPageUserBean.getUser_id());

		model.addAttribute("userExamResultBeans", userExamResultBeans);
		
		System.out.println(userExamResultBeans);
		
		return "mypage/myDetailManage/exam_result";
	}
	
	//자격증 접수 내역
	@GetMapping("/myDetailManage/receiptDetail")
	public String receiptDetail(Model model) {
		UserBean myPageUserBean = userService.getUserAllInfo();
		
		ArrayList<ExamReceiptBean> userExamReceiptBeans = examReceiptMapper.getUserExamReceiptList(myPageUserBean.getUser_id());
		
		model.addAttribute("userExamReceiptBeans", userExamReceiptBeans);	
		
		System.out.println(userExamReceiptBeans);
		
		return "mypage/myDetailManage/receiptDetail";	
	}
	
	//문의 내역
	@GetMapping("/myDetailManage/eduInquiryDetail")
	public String eduInquiryDetail(Model model) {
		
		UserBean myPageUserBean = userService.getUserAllInfo();
		
		
		ArrayList<UserEduBean> userEduBeans = userEduMapper.getUserEduInfo(myPageUserBean.getUser_id());
		
		model.addAttribute("userEduBeans", userEduBeans);
		
		return "mypage/myDetailManage/eduInquiryDetail";		
	}
	
	@GetMapping("/myDetailManage/careerInquiryDetail")
	public String careerInquiryDetail(Model model) {
		
		UserBean myPageUserBean = userService.getUserAllInfo();
		
		ArrayList<UserCareerBean> userCareerBeans = userCareerMapper.getUserCareerInfo(myPageUserBean.getUser_id());
		
		model.addAttribute("userCareerBeans", userCareerBeans);
		
		return "mypage/myDetailManage/careerInquiryDetail";		
	}
	

	//--------------------------------myInfoManage------------------------------------

	
	
	@GetMapping("/myInfoManage/checkPw")
	public String checkPw(@ModelAttribute("checkPwUserBean") UserBean checkPwUserBean,
						  @RequestParam("myInfoManagePage") int myInfoManagePage,
						  @RequestParam(value="fail", defaultValue = "false") boolean fail,
						  Model model) {
		
		model.addAttribute("fail", fail);
		
		model.addAttribute("myInfoManagePage",myInfoManagePage);
		userService.checkUserIdInfo(checkPwUserBean);

		
		return "mypage/myInfoManage/checkPw";
	}
	
	
	@PostMapping("/myInfoManage/checkPw_pro")
	public String checkPw_pro(@ModelAttribute("checkPwUserBean") UserBean checkPwUserBean,
						  @RequestParam("myInfoManagePage") int myInfoManagePage,
						  Model model) {
		
			
		if(!userService.loginPwCheck(checkPwUserBean)) {
			System.out.println("비밀번호 틀림");
			model.addAttribute("myInfoManagePage",myInfoManagePage);
			
			boolean fail = true;
			model.addAttribute("fail", fail);
			
			checkPwUserBean = new UserBean();
			userService.checkUserIdInfo(checkPwUserBean);
			
			model.addAttribute("checkPwUserBean", checkPwUserBean);
			
			return "mypage/myInfoManage/checkPw";
		}
		
		
		if(myInfoManagePage==1) {
			System.out.println("이동");
			return "redirect:/mypage/myInfoManage/userInfoModify";
		}
		
		if(myInfoManagePage==2) {
			System.out.println("이동");
			return "redirect:/mypage/myInfoManage/careerModify";
		}
		else {
			System.out.println("이동");
			return "redirect:/mypage/myInfoManage/liceseAttestation";
		}
	}
	
	//개인정보 수정
	@GetMapping("/myInfoManage/userInfoModify")
	public String userInfoModify(@ModelAttribute("modifyUserBean") UserBean modifyUserBean, Model model) {
			
		userService.getModifyUserInfo(modifyUserBean); 
		model.addAttribute(modifyUserBean);
		
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
	public String careerModify(Model model) {
		
		UserBean myPageUserBean = userService.getUserAllInfo();
		
		ArrayList<EduBean> userEduBeans = userMapper.getEduBeans(myPageUserBean.getUser_id());
		ArrayList<CareerBean> userCareerBeans = userMapper.getCareerBeans(myPageUserBean.getUser_id());
		
		model.addAttribute("userEduBeans",userEduBeans);
		model.addAttribute("userCareerBeans",userCareerBeans);
		
		return "mypage/myInfoManage/careerModify";		
	}
	
	
	//학력 신청
	@PostMapping("/myInfoManage/eduInquiry_pro")
	public String eduInquiry_pro(
			@RequestParam("edu_type") String edu_type,
			@RequestParam("edu_academy") String edu_academy,
			@RequestParam("edu_major") String edu_major
			) {
		
		UserBean myPageUserBean = userService.getUserAllInfo();
		
		UserEduBean tempUserEduBean = new UserEduBean();
	
		tempUserEduBean.setUserEdu_type(edu_type);
		
		if(edu_type.equals("") || edu_type==null) {
			return "mypage/myInfoManage/inquiry_fail";
		}
		
		
		if(tempUserEduBean.getUserEdu_type().equals("고등학교 졸업 이하") || 
				tempUserEduBean.getUserEdu_type().equals("고졸 검정고시") ||
				tempUserEduBean.getUserEdu_type().equals("평생교육진흥원 인정학점(81학점 이상)") ||
				tempUserEduBean.getUserEdu_type().equals("평생교육진흥원 인정학점(106학점 이상)") ) {
			
			Date currentDate = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = dateFormat.format(currentDate);
			    
		    
			tempUserEduBean.setUser_name(myPageUserBean.getUser_name());
			tempUserEduBean.setUser_id(myPageUserBean.getUser_id());
			tempUserEduBean.setUserEdu_major("없음");
			tempUserEduBean.setUserEdu_academy("없음");
			tempUserEduBean.setUserEdu_processStatus("대기");
			tempUserEduBean.setUserEdu_inquiryDate(formattedDate);
			
			userEduMapper.insertUserEduInquiry(tempUserEduBean);
			
		}
		else if(tempUserEduBean.getUserEdu_type().equals("2년제대학")||
				tempUserEduBean.getUserEdu_type().equals("4년제대학")||
				tempUserEduBean.getUserEdu_type().equals("석학학위")||
				tempUserEduBean.getUserEdu_type().equals("박사학위")){
			
			if(edu_academy==null || edu_academy.equals("") || edu_major==null || edu_major.equals("")) {
				return "mypage/myInfoManage/inquiry_fail";
			}
			
			
			 Date currentDate = new Date();
			 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			 String formattedDate = dateFormat.format(currentDate);
			
		    tempUserEduBean.setUser_name(myPageUserBean.getUser_name());
		    tempUserEduBean.setUser_id(myPageUserBean.getUser_id());
		    tempUserEduBean.setUserEdu_academy(edu_academy);
		    tempUserEduBean.setUserEdu_major(edu_major);
			tempUserEduBean.setUserEdu_processStatus("대기");
			tempUserEduBean.setUserEdu_inquiryDate(formattedDate);
			
			userEduMapper.insertUserEduInquiry(tempUserEduBean);		
		}
		else {
			return "mypage/myInfoManage/inquiry_fail";
		}
		
		return "mypage/myInfoManage/inquiry_success";
	}
	
	//경력 신청
	@PostMapping("/myInfoManage/careerInquiry_pro")
	public String careerInquiry_pro(@RequestParam("career_type") String career_type,
			@RequestParam("career_field") String career_field, @RequestParam("career_company") String career_company) {

		UserBean myPageUserBean = userService.getUserAllInfo();

		UserCareerBean tempUserCareerBean = new UserCareerBean();

		tempUserCareerBean.setUserCareer_type(career_type);

		if(career_type!=null || career_type.equals("")
				|| career_field!=null || career_field.equals("")
				|| career_company!=null || career_company.equals("") ) {
			
			
			
			Date currentDate = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = dateFormat.format(currentDate);

			tempUserCareerBean.setUser_name(myPageUserBean.getUser_name());
			tempUserCareerBean.setUser_id(myPageUserBean.getUser_id());
			tempUserCareerBean.setUserCareer_type(career_type);
			tempUserCareerBean.setUserCareer_field(career_field);
			tempUserCareerBean.setUserCareer_company(career_company);
			
			tempUserCareerBean.setUserCareer_inquiryDate(formattedDate);
			tempUserCareerBean.setUserCareer_status("대기");

			userCareerMapper.insertUserCareerInquiry(tempUserCareerBean);
			
			return "mypage/myInfoManage/inquiry_success";
			
		} 			
		else {
			return "mypage/myInfoManage/inquiry_fail";
		}

	}
	
	
	//-----------------------------------------------------------------------------------
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserValidator Vaildator1 = new UserValidator();
		binder.addValidators(Vaildator1);
	}
}

