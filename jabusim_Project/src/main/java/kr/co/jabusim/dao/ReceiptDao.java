package kr.co.jabusim.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jabusim.beans.ExamPlaceBean;
import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.mapper.ReceiptMapper;

@Repository
public class ReceiptDao {

	@Autowired
	ReceiptMapper receiptMapper;
	
	public List<String> getMajorCodes(String licenseType) {
		return receiptMapper.getMajorCodes(licenseType);
	}
	
	/*2번째페이지 - 자격증전부가져오기*/
	public List<LicenseBean> selectedLicenseType(String licenseType, RowBounds rowBounds) {
		return receiptMapper.selectedLicenseType(licenseType, rowBounds);
	}
	/*2번째페이지 - 자격증전부가져오기COUNT*/
	public int getContentCnt(String licenseType) {
		return receiptMapper.getContentCnt(licenseType);
	}
	
	
	/*2번째페이지 - 자격증이름검색*/
	public List<LicenseBean> searchLicenseName(String searchInput, String licenseType, RowBounds rowBounds) {
		return receiptMapper.searchLicenseName(searchInput, licenseType, rowBounds);
	}
	/*2번째페이지 - 자격증이름검색COUNT*/
	public int getContentCnt_search(String searchInput,String licenseType) {
		return receiptMapper.getContentCnt_search(searchInput, licenseType);
	}

	/*3번째페이지 - 자격증옵션검색*/
	public List<LicenseBean> getOptionsResults(String major, String minor, String licenseType, RowBounds rowBounds) {
		return receiptMapper.getOptionsResults(major, minor, licenseType, rowBounds);
	}
	/*3번째페이지 - 자격증옵션검색COUNT*/
	public int getContentCnt_option(String major, String minor, String licenseType) {
		return receiptMapper.getContentCnt_option(major, minor, licenseType);
	}
	
	
	/*3번째페이지 - 장소가져오기*/
	public List<ExamPlaceBean> getExamPlace(RowBounds rowBounds) {
		return receiptMapper.getExamPlace(rowBounds);
	}
	/*3번째페이지 - 장소가져오기COUNT*/
	public int getContentCnt_examPlace() {
		return receiptMapper.getContentCnt_examPlace();
	}
	
	/*3번째페이지 - 해당지역*/
	public List<ExamPlaceBean> getExamPlace_region(String region, RowBounds rowBounds) {
		return receiptMapper.getExamPlace_region(region, rowBounds);
	}
	/*3번째페이지 - 해당지역COUNT*/
	public int getContentCnt_region(String region) {
		return receiptMapper.getContentCnt_region(region);
	}	

	/*insert*/
	public void insertReceipt(String userName, String userId, String examName, String examType, String licenseName, Date formattedDate, Date examDate, Date examResultDate, String examPlaceName) {
		receiptMapper.insertReceipt(userName, userId, examName, examType, licenseName, formattedDate, examDate, examResultDate, examPlaceName);
	}
}
