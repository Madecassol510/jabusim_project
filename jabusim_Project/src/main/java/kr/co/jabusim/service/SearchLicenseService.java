package kr.co.jabusim.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jabusim.beans.SearchLicenseBean;
import kr.co.jabusim.dao.SearchLicenseDao;

@Service
public class SearchLicenseService {

	@Autowired
	SearchLicenseDao searchLicenseDao;
	
	public List<SearchLicenseBean> getAllLicenseList() {
		return searchLicenseDao.getAllLicenseList();
	}
	/*
	public List<SearchLicenseBean> selectOneCategories(Map<String, List<String>> params) {
	    if (params.containsKey("majorCode")) {
	        List<String> majorCodes = params.get("majorCode");
	        return searchLicenseDao.selectMajorCode(majorCodes);
	    } else if (params.containsKey("minorCode")) {
	        List<String> minorCodes = params.get("minorCode");
	        return searchLicenseDao.selectMinorCode(minorCodes);
	    } else if (params.containsKey("schedule")) {
	        List<String> schedules = params.get("schedule");
	        return searchLicenseDao.selectSchedule(schedules);
	    } 

	    return new ArrayList<>();
	}
	*/
	/*
	public List<SearchLicenseBean> selectAnyCategories(Map<String, Map<String, List<String>>> majorCategories,
														List<String> minorCodes, String kind) {
		return searchLicenseDao.selectAnyCategories(majorCategories, minorCodes, kind);
	}
	*/
	
    public List<SearchLicenseBean> selectMajorCategories(Map<String, List<String>> majorCategories) {
        // requestData에서 majorCategories 데이터 추출
        return searchLicenseDao.selectMajorCategories(majorCategories);
    }
    public List<SearchLicenseBean> selectMinorCategories(Map<String, Object> requestData) {
    	List<String> minorCategories = (List<String>) requestData.get("minorCodes");
    	return searchLicenseDao.selectMinorCategories(minorCategories);
    }
    public List<SearchLicenseBean> selectKindCategories(Map<String, Object> requestData) {
    	String kindCategories = (String) requestData.get("kind");
    	return searchLicenseDao.selectKindCategories(kindCategories);
    }
    public List<SearchLicenseBean> selectAnyCategories(Map<String, Object> requestData) {
    	Map<String, List<String>> majorCategories = (Map<String, List<String>>) requestData.get("majorCategories");
    	List<String> minorCategories = (List<String>) requestData.get("minorCodes");
    	String kindCategories = (String) requestData.get("kind");
    	return searchLicenseDao.selectAnyCategories(majorCategories, minorCategories, kindCategories);
    }
    
    
	
	public List<SearchLicenseBean> getSearchLicenseName(String searchInput) {
		return searchLicenseDao.getSearchLicenseName(searchInput);
	}
	
}
