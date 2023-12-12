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
	/*
	@GetMapping("/receipt_select_subject")
	public String receiptSelectSubjectForPaging(@RequestParam String licenseType,
	                                            @RequestParam(value = "page", defaultValue = "1") int page,
	                                            Model model) {
		
		List<String> getMajorCodes = receiptService.getMajorCodes(licenseType);
		model.addAttribute("getMajorCodes", getMajorCodes);
		
	    // 해당 licenseType과 page에 맞는 데이터 검색
	    List<LicenseBean> getSelectedLicenseType = receiptService.selectedLicenseType(licenseType, page);
	    model.addAttribute("getSelectedLicenseType", getSelectedLicenseType);

	    // 페이징 정보를 위한 PageBean 객체 조회
	    PageBean pageBean = receiptService.getContentCnt(licenseType, page);
	    model.addAttribute("pageBean", pageBean);

	    return "receipt/receipt_select_subject";
	}
	*/
	@PostMapping("/selectPlace")
	public String selectPlace(@RequestParam String licenseName, HttpServletRequest request , Model model) {
		//자격증이름 세션저장
		HttpSession session = request.getSession();
		session.setAttribute("licenseName", licenseName);
		
		List<String> getReceiptRegions = receiptMapper.getReceiptRegions();
		model.addAttribute("getReceiptRegions", getReceiptRegions);
		
		List<ExamPlaceBean> result = examPlaceMapper.allExamPlaceInfo();
		model.addAttribute("getExamPlace", result);
		
		return "receipt/selectPlace";
	}
	
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

	@GetMapping("/receipt_searchInput")
	@ResponseBody
	public ResponseEntity<?> searchLicenseName(@RequestParam(value = "searchInput") String searchInput,
	                                           @RequestParam(value = "licenseType", required = false) String licenseType,
	                                           @RequestParam(value = "page", defaultValue = "1") int page) {
	    // 페이지에 맞는 검색 결과 조회
	    List<LicenseBean> searchResults = receiptService.searchLicenseName(searchInput, licenseType);

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
    public List<LicenseBean> optionLicenseName(@RequestParam(value = "major") String major, 
    											@RequestParam(value = "licenseType", required = false) String licenseType, 
									            @RequestParam(value = "minor", required = false) String minor, 
									            HttpServletRequest request) { 
		return receiptService.optionLicenseName(major, minor, licenseType);
	}
	
	@GetMapping("/receipt_selectRegion")
    @ResponseBody // JSON 또는 다른 객체를 HTTP 응답의 본문으로 반환
    public List<ExamPlaceBean> selectRegion(@RequestParam("region") String region) {
        // 여기에서 region 파라미터를 사용하여 필요한 로직을 구현합니다.
        // 예를 들어, region에 따라 데이터베이스에서 데이터를 조회하거나, 비즈니스 로직을 실행할 수 있습니다.

        List<ExamPlaceBean> data = receiptMapper.selectRegion(region);

        return data; // 조회된 데이터를 JSON 형식으로 반환
    }
	
	@GetMapping("/ajax_paging")
	public ResponseEntity<?> getPageContent(@RequestParam(value = "page") int page,
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
