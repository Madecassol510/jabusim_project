package kr.co.jabusim.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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

	@PostMapping("/selectAnyCategories")
	public ResponseEntity<?> selectAnyCategories(@RequestBody Map<String, Object> requestData) {
	    // 각 키의 존재 여부를 확인
	    boolean hasMajorCategories = requestData.containsKey("majorCategories") && !isEmpty(requestData.get("majorCategories"));
	    boolean hasMinorCodes = requestData.containsKey("minorCodes") && !isEmpty(requestData.get("minorCodes"));
	    boolean hasKind = requestData.containsKey("kind") && !isEmpty(requestData.get("kind"));

	    System.out.println(requestData);
	    Map<String, List<String>> majorCategories = (Map<String, List<String>>) requestData.get("majorCategories");
	    // 비즈니스 로직
	    if (hasMajorCategories && !hasMinorCodes && !hasKind) {
	    	return ResponseEntity.ok(searchLicenseService.selectMajorCategories(majorCategories));
	    } else if (!hasMajorCategories && hasMinorCodes && !hasKind) {
	    	System.out.println(2);
	    	return ResponseEntity.ok(searchLicenseService.selectMinorCategories(requestData));
	    } else if (!hasMajorCategories && !hasMinorCodes && hasKind) {
	    	System.out.println(3);
	    	return ResponseEntity.ok(searchLicenseService.selectKindCategories(requestData));
	    } else {
	    	System.out.println(requestData);
	    	System.out.println(4);
	    	return ResponseEntity.ok(searchLicenseService.selectAnyCategories(requestData));
	    }
	}

	private boolean isEmpty(Object value) {
	    if (value == null) {
	        return true;
	    }
	    if (value instanceof Collection) {
	        return ((Collection<?>) value).isEmpty();
	    }
	    if (value instanceof Map) {
	        return ((Map<?, ?>) value).isEmpty();
	    }
	    if (value instanceof String) {
	        return ((String) value).isEmpty();
	    }
	    return false; // 기타 타입에 대한 처리
	}	
	/*
	@PostMapping("/selectAnyCategories")
	public ResponseEntity<?> selectAnyCategories(@RequestBody Map<String, Object> requestData) {
	    Map<String, Map<String, List<String>>> majorCategories = (Map<String, Map<String, List<String>>>) requestData.get("majorCategories");
	    List<String> minorCodes = (List<String>) requestData.get("minorCodes");
	    String kind = (String) requestData.get("kind");

	    return ResponseEntity.ok(searchLicenseService.selectAnyCategories(majorCategories, minorCodes, kind));
	}
	*/
	@GetMapping("/searchLicenseName")
	public ResponseEntity<?> getSearchLicenseName(@RequestParam String searchInput) {
		return ResponseEntity.ok(searchLicenseService.getSearchLicenseName(searchInput));
	}
}
