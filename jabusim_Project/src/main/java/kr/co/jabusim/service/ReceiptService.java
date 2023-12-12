package kr.co.jabusim.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

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
	
	public List<LicenseBean> selectedLicenseType(String licenseType, int page) {
		
		int start=(page-1)*page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return receiptDao.selectedLicenseType(licenseType, rowBounds);
	}
	
	public PageBean getContentCnt(String licenseType, int currentPage) {
		
		int content_cnt = receiptDao.getContentCnt(licenseType);
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}
	
	public List<LicenseBean> searchLicenseName(String searchInput, String licenseType) {
		return receiptDao.searchLicenseName(searchInput, licenseType);
	}
	
	public PageBean getContentCnt_search(String searchInput,String licenseType, int currentPage) {
		
		int content_cnt = receiptDao.getContentCnt_search(searchInput, licenseType);
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}

	public List<LicenseBean> optionLicenseName(String major, String minor, String licenseType) {
		return receiptDao.optionLicenseName(major, minor, licenseType);
	}
	
	public void insertReceipt(String userName, String userId, String examName, String examType, String licenseName, Date formattedDate, Date examDate, Date examResultDate, String examPlaceName) {
		receiptDao.insertReceipt(userName, userId, examName, examType, licenseName, formattedDate, examDate, examResultDate, examPlaceName);
	}
	
}
