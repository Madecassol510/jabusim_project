package kr.co.jabusim.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value="/", method=RequestMethod.GET)
	   public String home(/*HttpServletRequest request*/) {
		/*System.out.println(request.getServletContext().getRealPath("/")); 주석처리된 부분은 파일 저장시 저장될 절대 경로 구하기 위함*/
		return "redirect:/main";
	}
}


