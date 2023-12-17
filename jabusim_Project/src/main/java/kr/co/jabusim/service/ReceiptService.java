package kr.co.jabusim.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.ExamPlaceBean;
import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.beans.PageBean;
import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.dao.ReceiptDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ReceiptService {
	
	@Value("${page.listcnt}")
	private int page_listcnt;

	@Value("${page.paginationcnt}")
	private int page_paginationcnt;

	@Autowired
	ReceiptDao receiptDao;
	
	
	public List<String> getMajorCodes(String licenseType) {
		return receiptDao.getMajorCodes(licenseType);
	}
	
	/*첫페이지-게시물*/
	public List<LicenseBean> selectedLicenseType(String licenseType, int page) {
		
		int start=(page-1)*page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return receiptDao.selectedLicenseType(licenseType, rowBounds);
	}
	/*첫페이지-게시물 COUNT*/
	public PageBean getContentCnt(String licenseType, int currentPage) {
		
		int content_cnt = receiptDao.getContentCnt(licenseType);
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}
	
	
	/*ajax- 검색*/
	public List<LicenseBean> searchLicenseName(String searchInput, String licenseType, int page) {
		
		int start=(page-1)*page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return receiptDao.searchLicenseName(searchInput, licenseType, rowBounds);
	}
	/*ajax- 검색 COUNT*/
	public PageBean getContentCnt_search(String searchInput,String licenseType, int currentPage) {
		
		int content_cnt = receiptDao.getContentCnt_search(searchInput, licenseType);
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}

	
	/*ajax-옵션검색*/
	public List<LicenseBean> getOptionsResults(String major, String minor, String licenseType, int page) {
		
		int start=(page-1)*page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return receiptDao.getOptionsResults(major, minor, licenseType, rowBounds);
	}
	/*ajax-옵션검색 COUNT*/
	public PageBean getContentCnt_option(String major, String minor, String licenseType, int currentPage) {
		
		int content_cnt = receiptDao.getContentCnt_option(major, minor, licenseType);
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}

	
	/*장소접수-페이징*/
	public List<ExamPlaceBean> getExamPlace(int page) {
		
		int start=(page-1)*page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return receiptDao.getExamPlace(rowBounds);
	}
	/*장소접수-페이징 COUNT*/
	public PageBean getContentCnt_examPlace(int currentPage) {
		
		int content_cnt = receiptDao.getContentCnt_examPlace();
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}
	
	/*장소접수-페이징*/
	public List<ExamPlaceBean> getExamPlace_region(String region ,int page) {
		
		int start=(page-1)*page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return receiptDao.getExamPlace_region(region, rowBounds);
	}
	/*장소접수-페이징 COUNT*/
	public PageBean getContentCnt_region(String region,int currentPage) {
		
		int content_cnt = receiptDao.getContentCnt_region(region);
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}
	
	
	
	/*insert 메서드*/
	public void insertReceipt(String userName, String userId, String examName, String examType, String licenseName, Date formattedDate, Date examDate, Date examResultDate, String examPlaceName) {
		receiptDao.insertReceipt(userName, userId, examName, examType, licenseName, formattedDate, examDate, examResultDate, examPlaceName);
	}
	
	
}
