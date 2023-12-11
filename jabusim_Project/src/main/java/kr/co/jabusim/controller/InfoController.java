package kr.co.jabusim.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.mapper.ExamMapper;
import kr.co.jabusim.mapper.LicenseMapper;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	@Autowired
	private LicenseMapper licenseMapper;
	
	@Autowired
	private ExamMapper examMapper;
	
	@GetMapping("/main")
	public String main(@RequestParam("licenseIdx") int licenseIdx, Model model) {
		
		LicenseBean infoLicenseBean = licenseMapper.getLicenseBean(licenseIdx);
		
		ArrayList<ExamBean> infoExamBeanList = examMapper.licenseExamInfo(infoLicenseBean.getLicense_type());
		
		model.addAttribute("infoLicenseBean",infoLicenseBean);
		model.addAttribute("infoExamBeanList",infoExamBeanList);
		
		return "info/main";
	}
}








