package kr.co.jabusim.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.mapper.ExamMapper;

@Controller
@RequestMapping("/receipt")
public class ReceiptController {
	
	@Autowired
	ExamMapper examMapper;

	@GetMapping("/main")
	public String main(Model model) {
		ArrayList<ExamBean> getRegisting = examMapper.getRegisting();
		model.addAttribute("getRegisting", getRegisting);
		return "receipt/main";
	}

	@PostMapping("/receipt_select_subject")
	public String receipt_select_subject() {
		return "receipt/receipt_select_subject";
		
	}
	@PostMapping("/selectPlace")
	public String selectPlace() {
		return "receipt/selectPlace";
		
	}
}
