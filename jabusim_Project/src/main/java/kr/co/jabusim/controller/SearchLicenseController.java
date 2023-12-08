package kr.co.jabusim.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jabusim.service.SearchLicenseService;

@SuppressWarnings({ "unchecked", "rawtypes" })
@RestController
public class SearchLicenseController {
	
	@Autowired
	SearchLicenseService searchLicenseService;
	
	@GetMapping("/getAllLicenseList")
	public List getAllLicenseList() {
		System.out.println("getAllLicenseList 성공");
		return searchLicenseService.getAllLicenseList();
	}
	
	/*
	 * @GetMapping("/searchLicenseName") public List searchLicenseName(@RequestParam
	 * String query) { System.out.println("검색어: " + query); return
	 * searchLicenseService.searchLicenseName(query); }
	 */
	
	@PostMapping("/selectAnyCategories")
	public ResponseEntity<?> selectAnyCategories(@RequestBody Map<String, List<String>> dataToSend) {
	    // 실제 값이 있는 키의 개수를 세기
	    long nonEmptyKeyCount = dataToSend.values().stream()
	        .filter(list -> !list.isEmpty())
	        .count();

	    if (nonEmptyKeyCount == 1) {
	        // 값이 있는 키가 하나일 때
	    	System.out.println(nonEmptyKeyCount);
	        return ResponseEntity.ok(searchLicenseService.selectOneCategories(dataToSend));
	    } else {
	    	System.out.println(nonEmptyKeyCount);
	    	return ResponseEntity.ok(searchLicenseService.selectAnyCategories(dataToSend));
	    }
	    
	    // 모든 키의 값이 비어있는 경우 혹은 다른 경우 처리
	    //return ResponseEntity.badRequest().build();
	}
}
