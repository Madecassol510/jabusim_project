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
import kr.co.jabusim.service.ExamService;

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
		
		userMapper.userTableDelete(checkedList);

		return ResponseEntity.noContent().build();
	}
	
	
	//==========================================================================================================
	//학력문의 검색
	@GetMapping("/admin/userEduTableSearch")
	public ResponseEntity<List<UserEduBean>> userEduTableSearch( 
			@RequestParam("name") String name,
            @RequestParam("inquriyStart") String inquriyStart,
            @RequestParam("inquriyEnd") String inquriyEnd,
            @RequestParam("processStart") String processStart,
            @RequestParam("processEnd") String processEnd,
            @RequestParam("processStatus") List<String> processStatus,
			@RequestParam("eudList") List<String> eudList){
		
		System.out.println(name);
		System.out.println(inquriyStart);
		System.out.println(inquriyEnd);
		System.out.println(processStart);
		System.out.println(processEnd);
		System.out.println(processStatus);		
		System.out.println("hello");
		
		ArrayList<UserEduBean> searchList 
		= userEduMapper.userEduTableSearch(name, inquriyStart, inquriyEnd, processStart,processEnd, processStatus, eudList);

		return ResponseEntity.ok(searchList);
	}
	
	
	//경력문의 검색
	@GetMapping("/admin/userCareerTableSearch")
	public ResponseEntity<List<UserCareerBean>> userCareerTableSearch( 
			@RequestParam("name") String name,
            @RequestParam("inquriyStart") String inquriyStart,
            @RequestParam("inquriyEnd") String inquriyEnd,
            @RequestParam("processStart") String processStart,
            @RequestParam("processEnd") String processEnd,           
            @RequestParam("careerField")  String careerField,      
            @RequestParam("careerType") List<String> careerType, 
            @RequestParam("processStatus") List<String> processStatus
            ){
		
		
		System.out.println(name);
		System.out.println(inquriyStart);
		System.out.println(inquriyEnd);
		System.out.println(processStart);
		System.out.println(processEnd);
		System.out.println(careerField);
		System.out.println(careerType);
		System.out.println(processStatus);
		System.out.println("world");
		
	    ArrayList<UserCareerBean> searchList = userCareerMapper.userCareerTableSearch(
	            name, inquriyStart, inquriyEnd, processStart, processEnd, careerField, careerType, processStatus);

	  
		
		return ResponseEntity.ok(searchList);
	}
	
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

	// 시험접수 검색
	@GetMapping("/admin/examReciptTableSearch")
	public ResponseEntity<List<ExamReceiptBean>> examReciptTableSearch(@RequestParam("examName") String examName,
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
			@RequestParam("resultStatus") List<String> resultStatus){

		System.out.println(name);
		System.out.println(examName);
		System.out.println(examSubject);
		System.out.println(examStart);
		System.out.println(examEnd);
		System.out.println(resultStart);
		System.out.println(resultEnd);
		System.out.println(examType);
		System.out.println(resultStatus);

		ArrayList<ExamResultBean> searchList=examResultMapper.examResultTableSearch(name, examName, examSubject, examStart, examEnd, resultStart, resultEnd, examType, resultStatus);

		return ResponseEntity.ok(searchList);
	}
}



















