package kr.co.jabusim.controller;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.mapper.ExamMapper;
import kr.co.jabusim.mapper.LicenseMapper;

@Controller
public class MainController {
	
	@Autowired
	private LicenseMapper licenseMapper;
	
	@Autowired
	private ExamMapper examMapper;
	
	 @GetMapping("/main")
	    public String main(Model model) {
	        ArrayList<LicenseBean> licenseBeans = licenseMapper.getRandomLicenseBeans();
	        ArrayList<ExamBean> examBeans = examMapper.allExamInfo();
	        
	        // examBeans를 JSON 형태로 변환하여 JavaScript에 전달
	        String examBeansJson = new Gson().toJson(examBeans);
	        model.addAttribute("examBeansJson", examBeansJson);

	        // licenseBeans를 JSP에 직접 전달
	        model.addAttribute("licenseBeans", licenseBeans);
	        return "main";
	    }
	
	
}
