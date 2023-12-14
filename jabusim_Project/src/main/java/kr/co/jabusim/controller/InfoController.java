package kr.co.jabusim.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.ExamPassingBean;
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
	public String main(@RequestParam("licenseID") int licenseID, Model model) {
		
		LicenseBean infoLicenseBean = licenseMapper.getLicenseBean(licenseID);
		
		ArrayList<ExamBean> infoExamBeanList = examMapper.licenseExamInfo(infoLicenseBean.getLicense_type());
		
		ExamPassingBean infoExamPassingBean = examMapper.getLicenseExamPassingInfo(infoLicenseBean.getLicense_name());
		
		System.out.println(infoLicenseBean.getLicense_name());
		
		
		if(infoExamPassingBean==null) {
			System.out.println("시험합격률이 없습니다 ");
		}
		else {
			System.out.println(infoExamPassingBean.getEtyprate());
			String examPassingJson = new Gson().toJson(infoExamPassingBean);
			model.addAttribute("examPassingJson", examPassingJson);
		}
		
		
		model.addAttribute("infoLicenseBean",infoLicenseBean);
		model.addAttribute("infoExamBeanList",infoExamBeanList);
		
		return "info/main";
	}
}








