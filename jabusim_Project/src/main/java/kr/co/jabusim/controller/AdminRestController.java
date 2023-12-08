package kr.co.jabusim.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;
import kr.co.jabusim.beans.ExamPlaceBean;
import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.mapper.ExamPlaceMapper;
import kr.co.jabusim.mapper.LicenseMapper;
import kr.co.jabusim.mapper.UserCareerMapper;
import kr.co.jabusim.mapper.UserEduMapper;
import kr.co.jabusim.mapper.UserMapper;

	

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
	private ExamPlaceMapper examPlaceMapper;
	
	
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
            @RequestParam("careerField") String careerField,
            
            @RequestParam("careerType") List<String> careerType, 
            @RequestParam("processStatus") List<String> processStatus){
		
		ArrayList<UserCareerBean> searchList 
		= userCareerMapper.userCareerTableSearch
		(name, inquriyStart, inquriyEnd,
				processStart,processEnd,
				careerField, careerType, processStatus);

		return ResponseEntity.ok(searchList);
	}
	
	//자격증관리 검색
	@GetMapping("/admin/licenseTableSearch")
	public ResponseEntity<List<LicenseBean>> licenseTableSearch(
			@RequestParam("licenseName") String licenseName,
			@RequestParam("licenseType") String licenseType,
			@RequestParam("licenseMainCategory") String licenseMainCategory,		
			@RequestParam("licenseSubCategory") String licenseSubCategory
			) {

		ArrayList<LicenseBean> searchList = licenseMapper.licenseTableSearch
				(licenseName, licenseType, licenseMainCategory, licenseSubCategory);

		return ResponseEntity.ok(searchList);
	}
	
	
	// 시험관리 검색
//	@GetMapping("/admin/examTableSearch")
//	public ResponseEntity<List<ExamPlaceBean>> examPlaceTableSearch(@RequestParam("placeName") String placeName,
//			@RequestParam("placeRegion") String placeRegion, @RequestParam("placeAddress") String placeAddress,
//			@RequestParam("placeNumStart") int placeNumStart, @RequestParam("placeNumEnd") int placeNumEnd) {
//
//		ArrayList<ExamPlaceBean> searchList = examPlaceMapper.examPlaceTableSearch(placeName, placeRegion, placeAddress,
//				placeNumStart, placeNumEnd);
//
//		return ResponseEntity.ok(searchList);
//	}
	
	
	//시험장소 검색
	@GetMapping("/admin/examPlaceTableSearch")
	public ResponseEntity<List<ExamPlaceBean>> examPlaceTableSearch(
			@RequestParam("placeName") String placeName,
			@RequestParam("placeRegion") String placeRegion,
			@RequestParam("placeAddress") String placeAddress,		
			@RequestParam("placeNumStart") int placeNumStart,
			@RequestParam("placeNumEnd") int placeNumEnd
			) {

		ArrayList<ExamPlaceBean> searchList = examPlaceMapper.examPlaceTableSearch
				(placeName, placeRegion, placeAddress, placeNumStart, placeNumEnd);

		return ResponseEntity.ok(searchList);
	}
	
	
}
