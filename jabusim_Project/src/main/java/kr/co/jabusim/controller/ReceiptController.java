package kr.co.jabusim.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.ExamPlaceBean;
import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.beans.PageBean;
import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.mapper.ExamMapper;
import kr.co.jabusim.mapper.ExamPlaceMapper;
import kr.co.jabusim.mapper.ReceiptMapper;
import kr.co.jabusim.service.ExamPlaceService;
import kr.co.jabusim.service.ReceiptService;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/receipt")
public class ReceiptController {
	
	@Autowired
	ExamMapper examMapper;
	@Autowired
	ReceiptService receiptService;
	@Autowired
	ExamPlaceMapper examPlaceMapper; 
	@Autowired
	ReceiptMapper receiptMapper; 
	@Autowired
	UserBean loginUserBean;
	
	

	@GetMapping("/main")
	public String main(Model model) {
		ArrayList<ExamBean> getRegisting = examMapper.getRegisting();
		model.addAttribute("getRegisting", getRegisting);
		return "receipt/main";
	}
	@PostMapping("/receipt_select_subject")
	public String receipt_select_subject(@RequestParam String examName, @RequestParam String examType,
										@RequestParam String licenseType, @RequestParam String examDate,
										@RequestParam String examResultDate,
										@RequestParam(value="page", defaultValue = "1")int page,
										HttpServletRequest request , Model model) {
		HttpSession session = request.getSession();
		
		//로그인정보 저장
		session.setAttribute("userName", loginUserBean.getUser_name());
		session.setAttribute("userId", loginUserBean.getUser_id());
		
		//시험테이블컬럼 세션 저장
		session.setAttribute("examName", examName);
		session.setAttribute("examType", examType);
		session.setAttribute("licenseType", licenseType);
		session.setAttribute("examResultDate", examResultDate);
		session.setAttribute("examDate", examDate);
		
		List<String> getMajorCodes = receiptService.getMajorCodes(licenseType);
		model.addAttribute("getMajorCodes", getMajorCodes);
		//해당 type 반환
		List<LicenseBean> getSelectedLicenseType = receiptService.selectedLicenseType(licenseType, page);
		model.addAttribute("getSelectedLicenseType", getSelectedLicenseType);
		
		PageBean pageBean = receiptService.getContentCnt(licenseType, page);
		model.addAttribute("pageBean", pageBean);
		return "receipt/receipt_select_subject";
		
	}
	
	@GetMapping("/receipt_searchInput")
	@ResponseBody
	public ResponseEntity<?> searchLicenseName(@RequestParam(value = "searchName") String searchInput,
	                                           @RequestParam(value = "licenseType", required = false) String licenseType,
	                                           @RequestParam(value = "page", defaultValue = "1") int page) {
	    // 페이지에 맞는 검색 결과 조회
	    List<LicenseBean> searchResults = receiptService.searchLicenseName(searchInput, licenseType, page);

	    // 해당 검색 결과에 대한 페이지 정보 조회
	    PageBean pageBean = receiptService.getContentCnt_search(searchInput, licenseType, page);

	    // JSON 형식의 응답 생성
	    Map<String, Object> response = new HashMap<>();
	    response.put("pageBean", pageBean);
	    response.put("data", searchResults);

	    return ResponseEntity.ok(response);
	}
	
	@GetMapping("/receipt_searchOption")
    @ResponseBody
    public ResponseEntity<?> optionLicenseName(@RequestParam(value = "major") String major, 
    											@RequestParam(value = "licenseType", required = false) String licenseType, 
									            @RequestParam(value = "minor", required = false) String minor, 
									            @RequestParam(value = "page", defaultValue = "1") int page) { 
	    // 해당 옵션 조회
	    List<LicenseBean> optionsResults = receiptService.getOptionsResults(major, minor, licenseType, page);

	    // 해당 검색 결과에 대한 페이지 정보 조회
	    PageBean pageBean = receiptService.getContentCnt_option(major, minor, licenseType, page);

	    // JSON 형식의 응답 생성
	    Map<String, Object> response = new HashMap<>();
	    response.put("pageBean", pageBean);
	    response.put("data", optionsResults);

	    return ResponseEntity.ok(response);
		
		
		//return receiptService.optionLicenseName(major, minor, licenseType);
		
	}
	
	@GetMapping("/ajax_paging")
	public ResponseEntity<?> getPageContent(@RequestParam(value="page", defaultValue = "1")int page,
											@RequestParam(value = "licenseType",required = false) String licenseType) {
	    // 페이지 정보를 조회하기 위해 서비스 레이어 호출
	    PageBean pageBean = receiptService.getContentCnt(licenseType, page);

	    // 해당 licenseType과 page에 맞는 데이터 검색
	    List<LicenseBean> getSelectedLicenseType = receiptService.selectedLicenseType(licenseType, page);

	    // JSON 형식의 응답 생성
	    Map<String, Object> response = new HashMap<>();
	    response.put("pageBean", pageBean);
	    response.put("data", getSelectedLicenseType);

	    return ResponseEntity.ok(response);
	}

	@GetMapping("/ajax_paging_name")
	public ResponseEntity<?> getPageContent(@RequestParam(value="page")int page,
											@RequestParam(value = "licenseType",required = false) String licenseType,
											@RequestParam(value = "searchInput",required = false) String searchInput) {
		// 페이지 정보를 조회하기 위해 서비스 레이어 호출
		PageBean pageBean = receiptService.getContentCnt_search(searchInput, licenseType, page);
		
		// 해당 licenseType과 page에 맞는 데이터 검색
		List<LicenseBean> getSelectedLicenseName = receiptService.searchLicenseName(searchInput, licenseType, page);
		
		// JSON 형식의 응답 생성
		Map<String, Object> response = new HashMap<>();
		response.put("pageBean", pageBean);
		response.put("data", getSelectedLicenseName);
		
		return ResponseEntity.ok(response);
	}

	@GetMapping("/ajax_paging_option")
	public ResponseEntity<?> getPageContent(@RequestParam(value="page")int page,
											@RequestParam(value = "licenseType",required = false) String licenseType,
											@RequestParam(value = "searchInput",required = false) String searchInput,
											@RequestParam(value = "major",required = false) String major,
											@RequestParam(value = "minor",required = false) String minor) {
		// 페이지 정보를 조회하기 위해 서비스 레이어 호출
		PageBean pageBean = receiptService.getContentCnt_option(major, minor, licenseType, page);
		
		// 해당 licenseType과 page에 맞는 데이터 검색
		List<LicenseBean> getSelectedLicenseName = receiptService.getOptionsResults(major, minor, licenseType, page);
		
		// JSON 형식의 응답 생성
		Map<String, Object> response = new HashMap<>();
		response.put("pageBean", pageBean);
		response.put("data", getSelectedLicenseName);
		
		return ResponseEntity.ok(response);
	}

	
	/************3번째 페이지*************/
	@PostMapping("/selectPlace")
	public String selectPlace(@RequestParam String licenseName, 
							@RequestParam(value="page", defaultValue = "1")int page,
							HttpServletRequest request , Model model) {
		//자격증이름 세션저장
		HttpSession session = request.getSession();
		session.setAttribute("licenseName", licenseName);
		
		//시험장소 db에서 가져오기
		List<String> getReceiptRegions = receiptMapper.getReceiptRegions();
		model.addAttribute("getReceiptRegions", getReceiptRegions);
		
		
		//페이징
		List<ExamPlaceBean> getExamPlace = receiptService.getExamPlace(page);
		model.addAttribute("getExamPlace", getExamPlace);

		
		PageBean pageBean = receiptService.getContentCnt_examPlace(page);
		model.addAttribute("pageBean", pageBean);
		
		return "receipt/selectPlace";
	}
	
	
	@GetMapping("/ajax_paging_place")
	public ResponseEntity<?> getPageContent(@RequestParam(value="page", defaultValue = "1")int page) {
	    // 페이지 정보를 조회하기 위해 서비스 레이어 호출
	    PageBean pageBean = receiptService.getContentCnt_examPlace(page);

	    // 해당 licenseType과 page에 맞는 데이터 검색
	    List<ExamPlaceBean> getExamPlace = receiptService.getExamPlace(page);

	    // JSON 형식의 응답 생성
	    Map<String, Object> response = new HashMap<>();
	    response.put("pageBean", pageBean);
	    response.put("data", getExamPlace);

	    return ResponseEntity.ok(response);
	}
	
	@GetMapping("/ajax_paging_region")
	public ResponseEntity<?> getPageContent_region(@RequestParam(value = "page", defaultValue = "1") int page,
											@RequestParam(value = "region",required = false) String region) {
		// 페이지 정보를 조회하기 위해 서비스 레이어 호출
		PageBean pageBean = receiptService.getContentCnt_region(region, page);
		
		// 해당 licenseType과 page에 맞는 데이터 검색
		List<ExamPlaceBean> getExamPlace = receiptService.getExamPlace_region(region, page);
		
		// JSON 형식의 응답 생성
		Map<String, Object> response = new HashMap<>();
		response.put("pageBean", pageBean);
		response.put("data", getExamPlace);
		
		return ResponseEntity.ok(response);
	}
	
	@GetMapping("/receipt_selectRegion")
	@ResponseBody
	public ResponseEntity<?> getSelectedRegion(@RequestParam("region") String region,
												@RequestParam(value = "page", defaultValue = "1") int page) {
		
		// 페이지 정보를 조회하기 위해 서비스 레이어 호출
		PageBean pageBean = receiptService.getContentCnt_region(region, page);
		
		// 해당 licenseType과 page에 맞는 데이터 검색
		List<ExamPlaceBean> getSelectedRegion = receiptService.getExamPlace_region(region, page);
		
		// JSON 형식의 응답 생성
		Map<String, Object> response = new HashMap<>();
		response.put("pageBean", pageBean);
		response.put("data", getSelectedRegion);
		
		return ResponseEntity.ok(response);
	}

	
	/*insert*/
	@PostMapping("/receipt_pro")
	public String receipt_pro(@RequestParam String examPlaceName, HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    
	    String userName = (String) session.getAttribute("userName");
	    String userId = (String) session.getAttribute("userId");
	    String examName = (String) session.getAttribute("examName");
	    String examType = (String) session.getAttribute("examType");
	    String licenseName = (String) session.getAttribute("licenseName");
	    Date examDate = parseDate((String) session.getAttribute("examDate"));
	    Date examResultDate = parseDate((String) session.getAttribute("examResultDate"));
	    Date currentDate = new Date();

	    receiptService.insertReceipt(userName, userId, examName, examType, licenseName, currentDate, examDate, examResultDate, examPlaceName);
	    
	    return "receipt/receipt_success";
	}
	
	
	/*컨트롤러 메서드*/
	private Date parseDate(String dateString) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    try {
	        return dateFormat.parse(dateString);
	    } catch (ParseException e) {
	        // 날짜 변환 실패 처리
	        e.printStackTrace();
	        return null;
	    }
	}
	
}
