package kr.co.jabusim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.jabusim.beans.LicenseBean;

public interface LicenseMapper {

	@Select("select * from license")
	List<LicenseBean> getAllLicenseList();
	
	@Select("select * from license where license_name like '%' || #{query} || '%'")
	List<LicenseBean> searchLicenseName(String query);
	
	@Select("select DISTINCT licenseField From license ORDER BY licensefield")
	List<String> getLicenseCode();
}
