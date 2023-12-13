package kr.co.jabusim.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.SearchLicenseBean;
import kr.co.jabusim.mapper.SearchLicenseMapper;
import kr.co.jabusim.service.SearchLicenseService;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	SearchLicenseMapper searchLicenseMapper;
	
	@GetMapping("/main")
	public String main(Model model) {
		List<SearchLicenseBean> getAllLicenseList = searchLicenseMapper.getAllLicenseList();
		model.addAttribute("getAllLicenseList", getAllLicenseList);
		return "search/main";
	}
}
