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
	
	public List<SearchLicenseBean> selectOneCategories(Map<String, List<String>> params) {
	    if (params.containsKey("majorCode")) {
	        List<String> majorCodes = params.get("majorCode");
	        return searchLicenseDao.selectMajorCode(majorCodes);
	    } else if (params.containsKey("fullCode")) {
	        List<String> fullCodes = params.get("fullCode");
	        return searchLicenseDao.selectFullCode(fullCodes);
	    } else if (params.containsKey("licenseType")) {
	        List<String> licenseTypes = params.get("licenseType");
	        return searchLicenseDao.selectLicenseType(licenseTypes);
	    } 
		/*
		 * else if (params.containsKey("schedule")) { List<String> schedule =
		 * params.get("schedule"); return searchLicenseDao.selectSchedule("schedule"); }
		 */

	    return new ArrayList<>();
	}

	public List<SearchLicenseBean> selectAnyCategories(Map<String, List<String>> params) {
		
		Map<String, List<String>> anyParams = new HashMap<String, List<String>>();
			
			List<String> majorCodes = params.get("majorCode");
			List<String> fullCodes = params.get("fullCode");
			List<String> licenseTypes = params.get("licenseType");
			List<String> schedule = params.get("schedule");
			
			anyParams.put("majorCode", majorCodes);
			anyParams.put("fullCode", fullCodes);
			anyParams.put("licenseType", licenseTypes);
			anyParams.put("schedule", schedule);
			
			return searchLicenseDao.selectAnyCategories(anyParams);
	}
	
	/*
	 * public List<SearchLicenseBean> selectAnyCategories(Map<String, List<String>>
	 * params) { List<SearchLicenseBean> result = new ArrayList<>();
	 * 
	 * 
	 * return searchLicenseDao }
	 */
}
