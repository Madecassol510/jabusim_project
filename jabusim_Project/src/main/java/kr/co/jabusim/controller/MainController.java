package kr.co.jabusim.controller;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.mapper.LicenseMapper;

@Controller
public class MainController {
	
	@Autowired
	private LicenseMapper licenseMapper;
	
	@GetMapping("/main")
	public String main(Model model) {
		
		ArrayList<LicenseBean> licenseBeans = licenseMapper.getRandomLicenseBeans();
		
		System.out.println("-----------------------------------");
		for(LicenseBean licenseBean : licenseBeans) {
			System.out.println(licenseBean.getLicense_name());
		}
		
		return "main";
	}
}
