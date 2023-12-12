package kr.co.jabusim.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;
import kr.co.jabusim.beans.UserLicenseBean;
import kr.co.jabusim.beans.CareerBean;
import kr.co.jabusim.beans.EduBean;
import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.ExamPlaceBean;
import kr.co.jabusim.beans.ExamReceiptBean;
import kr.co.jabusim.beans.ExamResultBean;
import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.mapper.ExamMapper;
import kr.co.jabusim.mapper.ExamPlaceMapper;
import kr.co.jabusim.mapper.ExamReceiptMapper;
import kr.co.jabusim.mapper.ExamResultMapper;
import kr.co.jabusim.mapper.LicenseMapper;
import kr.co.jabusim.mapper.UserCareerMapper;
import kr.co.jabusim.mapper.UserEduMapper;
import kr.co.jabusim.mapper.UserMapper;
import kr.co.jabusim.service.ExamReceiptService;
import kr.co.jabusim.service.ExamResultService;
import kr.co.jabusim.service.ExamService;
import kr.co.jabusim.service.UserService;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

	

@RestController
public class AdminRestController {

	
	
	@Autowired
	private UserMapper userMapper;
	
	
	@Autowired
	private UserEduMapper userEduMapper;
	
	
	
	@Autowired
	private UserCareerMapper userCareerMapper;
	
	@Autowired
	private LicenseMapper licenseMapper;
	
	@Autowired
	private ExamMapper examMapper;
	
	@Autowired
	private ExamService examService;
	
	
	@Autowired
	private ExamPlaceMapper examPlaceMapper;
	
	@Autowired
	private ExamReceiptMapper examReceiptMapper;
	
	@Autowired
	private ExamReceiptService examReceiptService;
	
	@Autowired
	private ExamResultMapper examResultMapper;
	
	@Autowired
	private ExamResultService examResultService;
	
	
	
	//==========================================================================================================
	//회원관리 검색
	@GetMapping("/admin/userTableSearch")
	public ResponseEntity<List<UserBean>> userTableSearch(
			@RequestParam("name") String name,
            @RequestParam("interests") String interests,
            @RequestParam("joinStart") String joinStart,
			@RequestParam("joinEnd") String joinEnd
			){
		
		ArrayList<UserBean> searchList = userMapper.userTableSearch(name, interests, joinStart, joinEnd);

		
		return ResponseEntity.ok(searchList);
	}
	
	//회원관리 삭제
	@GetMapping("/admin/userTableDelete")
	public ResponseEntity<Void> userTableDelete(
			@RequestParam("checkedList") List<String> checkedList         
			){
	
		
		for(int i=0; i<checkedList.size(); i++) {
			userMapper.userTableDelete(checkedList.get(i));
		}
		

		return ResponseEntity.noContent().build();
	}
	
	
	//==========================================================================================================
	//학력문의 검색
	@GetMapping("/admin/userEduTableSearch")
	public ResponseEntity<List<UserEduBean>> userEduTableSearch( 
			@RequestParam("name") String name,
            @RequestParam("inquriyStart") String inquriyStart,
            @RequestParam("inquriyEnd") String inquriyEnd,
            @RequestParam("processStatus") List<String> processStatus,
			@RequestParam("eudList") List<String> eudList){
		
		System.out.println(name);
		System.out.println(inquriyStart);
		System.out.println(inquriyEnd);
		System.out.println(processStatus);		
		System.out.println("hello");
		
		ArrayList<UserEduBean> searchList 
		= userEduMapper.userEduTableSearch(name, inquriyStart, inquriyEnd, processStatus, eudList);

		return ResponseEntity.ok(searchList);
	}
	
	//학력문의 삭제
	@GetMapping("/admin/userEduTableDelete")
	public ResponseEntity<Void> userEduTableDelete(@RequestParam("checkedList") List<String> checkedList) {
		
		for(int i=0; i<checkedList.size(); i++) {
			userEduMapper.userEduTableDelete(checkedList.get(i));
		}
		
		return ResponseEntity.noContent().build();
	}
		
	//학력문의 업데이트
	@GetMapping("/admin/userEduTableUpdate")
	public ResponseEntity<Void> userEduTableUpdate(
			@RequestParam("checkedList") List<String> checkedList,
			@RequestParam("status") String status
			) {
		
		System.out.println(checkedList);
		System.out.println(status);
		System.out.println("===============================");
		for(int i=0; i<checkedList.size(); i++) {	
			
			UserEduBean userEduBean = userEduMapper.getUserEdu(checkedList.get(i));	
			System.out.println(userEduBean.getUserEdu_processStatus());
			
			if(userEduBean.getUserEdu_processStatus().equals("대기")){
				if(status.equals("수락완료")) {
					String user_id = userEduBean.getUser_id();
					String edu_type = userEduBean.getUserEdu_type();
					String edu_academy = userEduBean.getUserEdu_academy();
					String edu_major = userEduBean.getUserEdu_major();
				
					EduBean eduBean = new EduBean();
					
					eduBean.setUser_id(user_id);
					eduBean.setEdu_type(edu_type);
					eduBean.setEdu_academy(edu_academy);
					eduBean.setEdu_major(edu_major);
					
					userEduMapper.insertUserEdu(eduBean);	
					userEduMapper.updateUserEduStatus(userEduBean.getUserEdu_idx(), status);						
				}
				else if(status.equals("거절완료")) {
					userEduMapper.updateUserEduStatus(userEduBean.getUserEdu_idx(), status);
				}
			}
		}
			
		return ResponseEntity.noContent().build();
	}
		
	//==========================================================================================================
	//경력문의 검색
	@GetMapping("/admin/userCareerTableSearch")
	public ResponseEntity<List<UserCareerBean>> userCareerTableSearch( 
			@RequestParam("name") String name,
            @RequestParam("inquriyStart") String inquriyStart,
            @RequestParam("inquriyEnd") String inquriyEnd,          
            @RequestParam("careerField")  String careerField,      
            @RequestParam("careerType") List<String> careerType, 
            @RequestParam("processStatus") List<String> processStatus
            ){
		
		
		System.out.println(name);
		System.out.println(inquriyStart);
		System.out.println(inquriyEnd);
		System.out.println(careerField);
		System.out.println(careerType);
		System.out.println(processStatus);
		System.out.println("world");
		
	    ArrayList<UserCareerBean> searchList = userCareerMapper.userCareerTableSearch(
	            name, inquriyStart, inquriyEnd, careerField, careerType, processStatus);

	  
		
		return ResponseEntity.ok(searchList);
	}
	

	//경력문의 삭제
	@GetMapping("/admin/userCareerTableDelete")
	public ResponseEntity<Void> userCareerTableDelete(@RequestParam("checkedList") List<String> checkedList) {
		
		for(int i=0; i<checkedList.size(); i++) {
			userCareerMapper.userCareerTableDelete(checkedList.get(i));
		}
		
		return ResponseEntity.noContent().build();
	}
	
	
	//경력문의 업데이트
		@GetMapping("/admin/userCareerTableUpdate")
		public ResponseEntity<Void> userCareerTableUpdate(
				@RequestParam("checkedList") List<String> checkedList,
				@RequestParam("status") String status
				) {
			
			System.out.println(checkedList);
			System.out.println(status);
			System.out.println("===============================");
			for(int i=0; i<checkedList.size(); i++) {	
				
				UserCareerBean userCareerBean = userCareerMapper.getUserCareer(checkedList.get(i));	
				System.out.println(userCareerBean.getUserCareer_status());
				
				if(userCareerBean.getUserCareer_status().equals("대기")){
					if(status.equals("수락완료")) {
						String user_id = userCareerBean.getUser_id();
						String career_field = userCareerBean.getUserCareer_field();
						String career_type = userCareerBean.getUserCareer_type();
						String career_company = userCareerBean.getUserCareer_company();
					
						CareerBean careerBean = new CareerBean();
						
						careerBean.setUser_id(user_id);
						careerBean.setCareer_field(career_field);
						careerBean.setCareer_type(career_type);
						careerBean.setCareer_company(career_company);
						
						userCareerMapper.insertUserCareer(careerBean);	
						userCareerMapper.updateUserCareerStatus(userCareerBean.getUserCareer_idx(), status);						
					}
					else if(status.equals("거절완료")) {
						userCareerMapper.updateUserCareerStatus(userCareerBean.getUserCareer_idx(), status);
					}
				}
			}
				
			return ResponseEntity.noContent().build();
		}
		
			
	//==========================================================================================================
	
		
	//자격증관리 검색
	@GetMapping("/admin/licenseTableSearch")
	public ResponseEntity<List<LicenseBean>> licenseTableSearch(
			@RequestParam("licenseName") String licenseName,
			@RequestParam("licenseType") List<String> licenseType,
			@RequestParam("licenseMainCategory") String licenseMainCategory,		
			@RequestParam("licenseSubCategory") String licenseSubCategory
			) {

		System.out.println(licenseName);
		System.out.println(licenseType);
		System.out.println(licenseMainCategory);
		System.out.println(licenseSubCategory);
		System.out.println("world");
				
		ArrayList<LicenseBean> searchList = licenseMapper.licenseTableSearch
				(licenseName, licenseType, licenseMainCategory, licenseSubCategory);

		
		
		return ResponseEntity.ok(searchList);
	}
	
	//자격증 삭제
	@GetMapping("/admin/LicenseTableDelete")
	public ResponseEntity<Void> LicenseTableDelete(@RequestParam("checkedList") List<String> checkedList) {

		
		for(int i=0; i<checkedList.size(); i++) {
			licenseMapper.licenseTableDelete(checkedList.get(i));
		}
		
		return ResponseEntity.noContent().build();
	}
				
	//==========================================================================================================
	
	
	//시험관리
	@GetMapping("/admin/examTableSearch")
	public ResponseEntity<List<ExamBean>> examTableSearch(
			@RequestParam("examName") String examName,
			@RequestParam("examYear") String examYear,
			
			@RequestParam("examType") List<String> examType,
			@RequestParam("exmaLicenseType") List<String> exmaLicenseType,
			@RequestParam("examRound") List<String> examRound,

			@RequestParam("receiptStart") String receiptStart,
	        @RequestParam("receiptEnd") String receiptEnd,
	        @RequestParam("examStart") String examStart,
	        @RequestParam("examEnd") String examEnd ,
						
			@RequestParam("examStatus") List<String> examStatus
			){

		System.out.println(examName);
		System.out.println(examType);
		System.out.println(exmaLicenseType);
		System.out.println(examYear);
		System.out.println(examRound);
		System.out.println(receiptStart);
		System.out.println(receiptEnd);
		System.out.println(examStart);
		System.out.println(examEnd);
		System.out.println(examStatus);
		
		System.out.println("world");
		
		
		ArrayList<ExamBean> searchList = examService.examTableSearch(examName, examYear, examType, exmaLicenseType, examRound, receiptStart, receiptEnd, examStart, examEnd, examStatus);

		return ResponseEntity.ok(searchList);
		
	}
	
	//시험 삭제
	@GetMapping("/admin/examTableDelete")
	public ResponseEntity<Void> examTableDelete(@RequestParam("checkedList") List<String> checkedList) {
			
			for(int i=0; i<checkedList.size(); i++) {
				examMapper.examTableDelete(checkedList.get(i));
			}
			
			return ResponseEntity.noContent().build();
		}
	
			
	//==========================================================================================================
	
	
	//시험장소 검색
	@GetMapping("/admin/examPlaceTableSearch")
	public ResponseEntity<List<ExamPlaceBean>> examPlaceTableSearch(
			@RequestParam("placeName") String placeName,
			@RequestParam("placeRegion") String placeRegion,
			@RequestParam("placeAddress") String placeAddress		

			) {
		
		System.out.println(placeName);
		System.out.println(placeRegion);
		System.out.println(placeAddress);
		
		ArrayList<ExamPlaceBean> searchList = examPlaceMapper.examPlaceTableSearch
				(placeName, placeRegion, placeAddress);

		return ResponseEntity.ok(searchList);
	}
	
	
	//시험장소 삭제
	@GetMapping("/admin/examPlaceTableDelete")
	public ResponseEntity<Void> examPlaceTableDelete(@RequestParam("checkedList") List<String> checkedList) {
				
				for(int i=0; i<checkedList.size(); i++) {
					examPlaceMapper.examPlaceTableDelete(checkedList.get(i));
				}
				
				return ResponseEntity.noContent().build();
			}

	
	//==========================================================================================================
	
	
	// 시험접수 검색
	@GetMapping("/admin/examReceiptTableSearch")
	public ResponseEntity<List<ExamReceiptBean>> examReceiptTableSearch(@RequestParam("examName") String examName,
			@RequestParam("examSubject") String examSubject, @RequestParam("examPlace") String examPlace,

			@RequestParam("examStart") String examStart, @RequestParam("examEnd") String examEnd,
			@RequestParam("resultStart") String resultStart, @RequestParam("resultEnd") String resultEnd,

			@RequestParam("examType") List<String> examType,

			@RequestParam("receiptStatus") List<String> receiptStatus) {

		System.out.println(examName);
		System.out.println(examSubject);
		System.out.println(examPlace);

		System.out.println(examStart);
		System.out.println(examEnd);
		System.out.println(resultStart);
		System.out.println(resultEnd);

		System.out.println(examType);
		System.out.println(receiptStatus);

		ArrayList<ExamReceiptBean> searchList = examReceiptService.examReciptTableSearch(examName, examSubject,
				examPlace, examStart, examEnd, resultStart, resultEnd, examType, receiptStatus);

		return ResponseEntity.ok(searchList);
	}
	
	
	//시험접수 삭제
	@GetMapping("/admin/examReceiptTableDelete")
	public ResponseEntity<Void> examReceiptTableDelete(@RequestParam("checkedList") List<String> checkedList) {					
			for(int i=0; i<checkedList.size(); i++) {			
				ExamReceiptBean examReceiptBean = examReceiptMapper.getExamReceipt(checkedList.get(i));			
				System.out.println(examReceiptBean.getExamReceipt_status());
				
				if(examReceiptBean.getExamReceipt_status().equals("삭제예정")) {	
					examReceiptMapper.examReceiptTableDelete(checkedList.get(i));					
				}
				
			}
					
			return ResponseEntity.noContent().build();
	}
	
	
	//시험접수 업데이트
	@GetMapping("/admin/examReceiptTableUpdate")
	public ResponseEntity<Void> examReceiptTableUpdate(
			@RequestParam("checkedList") List<String> checkedList,
			@RequestParam("status") String status
			) {
							
		for(int i=0; i<checkedList.size(); i++) {
			ExamReceiptBean examReceiptBean = examReceiptMapper.getExamReceipt(checkedList.get(i));
			System.out.println(examReceiptBean.getExamReceipt_status());
			
			if(examReceiptBean.getExamReceipt_status().equals("처리대기")) {
				if(status.equals("접수완료")) {
					
					String user_name = examReceiptBean.getUser_name();
					String user_id = examReceiptBean.getUser_id();
					String exam_name = examReceiptBean.getExam_name();
					String exam_subject = examReceiptBean.getExam_subject();
					String exam_type = examReceiptBean.getExam_type();
					String exam_date = examReceiptBean.getExam_date();
					String exam_resultDate = examReceiptBean.getExam_resultDate();
					String examResult_status = "미입력";
					String examResult_processStatus = "미처리";
					
					ExamResultBean examResultBean = new ExamResultBean();
					
					examResultBean.setUser_name(user_name);
					examResultBean.setUser_id(user_id);
					examResultBean.setExam_name(exam_name);
					examResultBean.setExam_subject(exam_subject);
					examResultBean.setExam_type(exam_type);
					examResultBean.setExam_date(exam_date);
					examResultBean.setExam_resultDate(exam_resultDate);
					examResultBean.setExamResult_status(examResult_status);
					examResultBean.setExamResult_processStatus(examResult_processStatus);
					
					
					examResultMapper.insertExamResult(examResultBean);
					
					examReceiptMapper.examReceiptTableUpdate(examReceiptBean.getExamReceipt_idx(), status);	
						
				}
				else if(status.equals("접수거부")) {
					examReceiptMapper.examReceiptTableUpdate(examReceiptBean.getExamReceipt_idx(), status);
				}
			}											
		}
		return ResponseEntity.noContent().build();
	}	
	//==========================================================================================================
	
	//시험결과 검색
	@GetMapping("/admin/examResultTableSearch")
	public ResponseEntity<List<ExamResultBean>> examResultTableSearch(
			@RequestParam("name") String name, 
			@RequestParam("examName") String examName,
			@RequestParam("examSubject") String examSubject,

			@RequestParam("examStart") String examStart, 
			@RequestParam("examEnd") String examEnd,
			@RequestParam("resultStart") String resultStart, 
			@RequestParam("resultEnd") String resultEnd,

			@RequestParam("examType") List<String> examType,
			@RequestParam("resultStatus") List<String> resultStatus,
			@RequestParam("processStatus") List<String> processStatus			
			){

		System.out.println(name);
		System.out.println(examName);
		System.out.println(examSubject);
		System.out.println(examStart);
		System.out.println(examEnd);
		System.out.println(resultStart);
		System.out.println(resultEnd);
		System.out.println(examType);
		System.out.println(resultStatus);
		System.out.println(processStatus);

		//ArrayList<ExamResultBean> searchList=examResultMapper.examResultTableSearch(name, examName, examSubject, examStart, examEnd, resultStart, resultEnd, examType, resultStatus);
		ArrayList<ExamResultBean> searchList=examResultService.examResultTableSearch(name, examName, examSubject, examStart, examEnd, resultStart, resultEnd, examType, resultStatus, processStatus);
		return ResponseEntity.ok(searchList);
	}
	
	//시험결과 삭제
	@GetMapping("/admin/examResultTableDelete")
	public ResponseEntity<Void> examResultTableDelete(@RequestParam("checkedList") List<String> checkedList) {
						
						for(int i=0; i<checkedList.size(); i++) {
							examResultMapper.examResultTableDelete(checkedList.get(i));
						}
						
						return ResponseEntity.noContent().build();
					}
	
	
	//시험결과 업데이트
	@GetMapping("/admin/examResultTableUpdate")
	public ResponseEntity<Void> examResultTableUpdate(
			@RequestParam("checkedList") List<String> checkedList,
			@RequestParam("status") String status
			) {
			
		for(int i=0; i<checkedList.size(); i++) {
			ExamResultBean examResultBean = examResultMapper.getExamResult(checkedList.get(i));
			System.out.println(examResultBean.getExamResult_status());
			System.out.println(examResultBean.getExamResult_processStatus());
			
			if(!examResultBean.getExamResult_processStatus().equals("처리완료") && !(status.equals("처리완료"))) {			
				examResultMapper.examResultTableUpdate(examResultBean.getExamResult_idx(), status);
			}
		}	
		return ResponseEntity.noContent().build();
	}
	
	
	@GetMapping("/admin/examResultTableProcess")
	public ResponseEntity<Void> examResultTableProcess(
			@RequestParam("checkedList") List<String> checkedList,
			@RequestParam("status") String status
			) {
			
		for(int i=0; i<checkedList.size(); i++) {
			ExamResultBean examResultBean = examResultMapper.getExamResult(checkedList.get(i));
			System.out.println(examResultBean.getExamResult_status());
			System.out.println(examResultBean.getExamResult_processStatus());
			
			if(!examResultBean.getExamResult_status().equals("미입력")) {
				if(examResultBean.getExamResult_processStatus().equals("처리가능")){
					if(examResultBean.getExamResult_status().equals("합격예정") && examResultBean.getExam_type().equals("실기")) {
						
						String user_id = examResultBean.getUser_id();
						String license_name = examResultBean.getExam_subject();
						
						int license_idx = licenseMapper.getLicenseidx(license_name);
						
						
						UserLicenseBean userLicenseBean = new UserLicenseBean();
						userLicenseBean.setUser_id(user_id);
						userLicenseBean.setLicense_idx(license_idx);
						
						licenseMapper.insertUserLicense(userLicenseBean);
						
					}
					examResultMapper.examResultTableProcess(examResultBean.getExamResult_idx(), status);			
				}
			}
		}
		
		return ResponseEntity.noContent().build();
	}
	
	//==========================================================================================================
}










































