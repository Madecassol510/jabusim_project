package kr.co.jabusim.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.ContentBean;
import kr.co.jabusim.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/main")
	public String main() {
		return "board/main";
	}

	@GetMapping("/read")
	public String read(@RequestParam("content_idx") int content_idx,
			Model model) {

		model.addAttribute("content_idx", content_idx);

		ContentBean readContentBean = boardService.getContentInfo(content_idx);
		model.addAttribute("readContentBean", readContentBean);

		return "board/read";
	}

	@GetMapping("/write")
	public String write(@ModelAttribute("writeContentBean") ContentBean writeContentBean) {

		return "board/write";
	}

	@PostMapping("/write_pro")
	public String write_pro(@Valid @ModelAttribute("writeContentBean") ContentBean writeContentBean, BindingResult result) {
		if(result.hasErrors()) {
			return "board/write";
		}

		boardService.addContentInfo(writeContentBean);

		return "board/write_success";
	}

	@GetMapping("/not_writer")
	public String not_writer() {
		return "board/not_writer";
	}

	@GetMapping("/modify")
	public String modify(@RequestParam("content_idx") int content_idx,
			@ModelAttribute("modifyContentBean") ContentBean modifyContentBean,
			Model model) {

		model.addAttribute("content_idx", content_idx);

		//게시글 하나의 정보 가져오기
		ContentBean tempContentBean = boardService.getContentInfo(content_idx);

		modifyContentBean.setContent_writer_name(tempContentBean.getContent_writer_name());
		modifyContentBean.setContent_date(tempContentBean.getContent_date());
		modifyContentBean.setContent_subject(tempContentBean.getContent_subject());
		modifyContentBean.setContent_text(tempContentBean.getContent_text());
		modifyContentBean.setContent_file(tempContentBean.getContent_file());
		modifyContentBean.setContent_writer_idx(tempContentBean.getContent_writer_idx());
		modifyContentBean.setContent_idx(content_idx); //param값 그대로 가져오기

		return "board/modify";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyContentBean") ContentBean modifyContentBean, 
			BindingResult result) {
		if(result.hasErrors()) {
			return "board/modify";
		}

		/*boardService.modifyContentInfo(modifyContentBean);*/

		return "board/modify_success";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("content_idx") int content_idx,
			Model model) {

		boardService.deleteContentInfo(content_idx);

		return "board/delete";
	}
}
