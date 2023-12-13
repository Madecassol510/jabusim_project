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

	/*
	public List<SearchLicenseBean> selectMajorCode(List<String> majorCode) {
		return searchLicenseMapper.selectMajorCode(majorCode);
	}
	public List<SearchLicenseBean> selectMinorCode(List<String> minorCode) {
		return searchLicenseMapper.selectMinorCode(minorCode);
	}
	public List<SearchLicenseBean> selectSchedule(List<String> schedule) {
		return searchLicenseMapper.selectSchedule(schedule); 
	}
	*/

	public List<SearchLicenseBean> selectMajorCategories(Map<String, List<String>> majorCategories) {
        return searchLicenseMapper.selectMajorCategories(majorCategories);
    }
	public List<SearchLicenseBean> selectMinorCategories(List<String> minorCategories) {
		return searchLicenseMapper.selectMinorCategories(minorCategories);
	}
	public List<SearchLicenseBean> selectKindCategories(String kindCategories) {
		return searchLicenseMapper.selectKindCategories(kindCategories);
	}
	public List<SearchLicenseBean> selectAnyCategories(Map<String, List<String>> majorCategories,
			List<String> minorCodes, String kind) {
		System.out.println(majorCategories + "" + minorCodes + ""+ kind);
		return searchLicenseMapper.selectAnyCategories(majorCategories, minorCodes, kind);
	}
	
	public List<SearchLicenseBean> getSearchLicenseName(String searchInput) {
		return searchLicenseMapper.getSearchLicenseName(searchInput);
	}
	
	/*
	 * public String selectAnyCategories(Map<String, List<String>> params) { }
	 */

}
