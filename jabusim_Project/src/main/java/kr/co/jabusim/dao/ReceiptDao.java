package kr.co.jabusim.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.mapper.ReceiptMapper;

@Repository
public class ReceiptDao {

	@Autowired
	ReceiptMapper receiptMapper;
	
	public List<String> getMajorCodes(String licenseType) {
		return receiptMapper.getMajorCodes(licenseType);
	}
	
	public List<LicenseBean> selectedLicenseType(String licenseType, RowBounds rowBounds) {
		
		return receiptMapper.selectedLicenseType(licenseType, rowBounds);
	}
	
	public void insertReceipt(String userName, String userId, String examName, String examType, String licenseName, Date formattedDate, Date examDate, Date examResultDate, String examPlaceName) {
		receiptMapper.insertReceipt(userName, userId, examName, examType, licenseName, formattedDate, examDate, examResultDate, examPlaceName);
	}
	
	public int getContentCnt(String licenseType) {
		return receiptMapper.getContentCnt(licenseType);
	}
	
	public List<LicenseBean> searchLicenseName(String searchInput, String licenseType) {
		return receiptMapper.searchLicenseName(searchInput, licenseType);
	}
	
	public int getContentCnt_search(String searchInput,String licenseType) {
		return receiptMapper.getContentCnt_search(searchInput, licenseType);
	}
	
	public List<LicenseBean> optionLicenseName(String major, String minor, String licenseType) {
		return receiptMapper.optionLicenseName(major, minor, licenseType);
	}
}
