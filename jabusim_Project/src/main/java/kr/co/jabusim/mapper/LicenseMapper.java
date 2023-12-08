package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.beans.UserBean;

public interface LicenseMapper {

	@Select("select * from license")
	List<LicenseBean> getAllLicense();
	
	@Select("select DISTINCT licenseField From license ORDER BY licensefield")
	List<String> getLicenseCode();
	
	@Select("select distinct license_mainCategory from license_table")
	List<String> getLicenseType();
	
	
	
	
	
	
	//ajax 유저테이블 가져오기
	ArrayList<LicenseBean> licenseTableSearch (
			@Param("licenseName") String licenseName,
			@Param("licenseType") String licenseType,
			@Param("licenseMainCategory") String licenseMainCategory,		
			@Param("licenseSubCategory") String licenseSubCategory
			);
	
	
}
