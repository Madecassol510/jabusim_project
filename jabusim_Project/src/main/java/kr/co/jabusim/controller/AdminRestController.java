package kr.co.jabusim.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.beans.UserEduBean;
import kr.co.jabusim.mapper.UserEduMapper;
import kr.co.jabusim.mapper.UserMapper;

	

@RestController
public class AdminRestController {

	
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserEduMapper userEduMapper;
	
	@GetMapping("/admin/userTableSearch")
	public ResponseEntity<List<UserBean>> userTableSearch(
			@RequestParam("name") String name,
            @RequestParam("interests") String interests,
            @RequestParam("joinStart") String joinStart,
			@RequestParam("joinEnd") String joinEnd
			){
		
		List<UserBean> searchList = userMapper.userTableSearch(name, interests, joinStart, joinEnd);

		return ResponseEntity.ok(searchList);
	}
	
	
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
	
}
