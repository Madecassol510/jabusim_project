package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.beans.UserEduBean;

public interface LicenseMapper {

	
	
	@Select("select DISTINCT licenseField From license ORDER BY licensefield")
	List<String> getLicenseCode();
	
	@Select("select distinct license_mainCategory from license_table")
	List<String> getLicenseType();
	
	
	
	
	
	//모든 유저의 학력 리스트
	@Select("select * from license_table")
	ArrayList<LicenseBean> allLicenseInfo();
	
	
	//ajax 유저테이블 가져오기
	ArrayList<LicenseBean> licenseTableSearch (
			@Param("licenseName") String licenseName,
			@Param("licenseType") List<String> licenseType,
			@Param("licenseMainCategory") String licenseMainCategory,		
			@Param("licenseSubCategory") String licenseSubCategory
	);
	
	
}
