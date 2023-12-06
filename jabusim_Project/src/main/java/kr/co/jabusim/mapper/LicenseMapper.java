package kr.co.jabusim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.jabusim.beans.LicenseBean;

public interface LicenseMapper {

	@Select("select * from license")
	List<LicenseBean> getAllLicense();
	
	@Select("select DISTINCT licenseField From license ORDER BY licensefield")
	List<String> getLicenseCode();
	
	@Select("select DISTINCT licenseType From license")
	List<String> getLicenseType();
	
	
}
