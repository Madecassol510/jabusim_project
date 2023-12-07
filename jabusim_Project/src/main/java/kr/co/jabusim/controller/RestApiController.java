package kr.co.jabusim.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.mapper.UserMapper;
import kr.co.jabusim.service.UserService;


@RestController
public class RestApiController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserMapper userMapper;
	
	
	@GetMapping("/user/checkUserIdExist/{user_id}")
	public String checkUserIdExist(@PathVariable String user_id) {
		boolean chk = userService.checkUserIdExist(user_id);
		return chk+"";                                             
	}
	
	
	@GetMapping("/user/userTableSearch")
	public ResponseEntity<List<UserBean>> userTableSearch( @RequestParam String name,
            @RequestParam String interests,
            @RequestParam String joinStart,
            @RequestParam String joinEnd){
		
		List<UserBean> searchList = userMapper.userTableSearch(name, interests, joinStart, joinEnd);

		return ResponseEntity.ok(searchList);
	}
	
}
