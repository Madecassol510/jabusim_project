package kr.co.jabusim.dao;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jabusim.beans.SearchLicenseBean;
import kr.co.jabusim.mapper.SearchLicenseMapper;

@Repository
public class SearchLicenseDao {

	@Autowired
	SearchLicenseMapper searchLicenseMapper;

	public List<SearchLicenseBean> getAllLicenseList() { 
		return searchLicenseMapper.getAllLicenseList(); 
	}

	
	public List<SearchLicenseBean> selectMajorCode(List<String> majorCode) {
		return searchLicenseMapper.selectMajorCode(majorCode);
	}
	public List<SearchLicenseBean> selectMinorCode(List<String> minorCode) {
		return searchLicenseMapper.selectMinorCode(minorCode);
	}
	public List<SearchLicenseBean> selectSchedule(List<String> schedule) {
		return searchLicenseMapper.selectSchedule(schedule); 
	}
	

	public List<SearchLicenseBean> selectAnyCategories(Map<String, List<String>> anyParms) {
		return searchLicenseMapper.selectAnyCategories(anyParms);
	}

	/*
	 * public String selectAnyCategories(Map<String, List<String>> params) { }
	 */

	/*
	 * public List<SearchLicenseBean> searchLicenseName(String query) { return
	 * searchLicenseMapper.searchLicenseName(query); }
	 */

}
