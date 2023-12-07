package kr.co.jabusim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recept")
public class ReceptController {

	@GetMapping("/main")
	public String main() {
		return "recept/main";
		
	}
	@PostMapping("/recept_select_subject")
	public String recept_select_subject() {
		return "recept/recept_select_subject";
		
	}
	@PostMapping("/selectPlace")
	public String selectPlace() {
		return "recept/selectPlace";
		
	}
}
