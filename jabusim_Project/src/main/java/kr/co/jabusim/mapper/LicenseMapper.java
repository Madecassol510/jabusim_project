package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.ExamResultBean;
import kr.co.jabusim.beans.LicenseBean;
import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.beans.UserEduBean;
import kr.co.jabusim.beans.UserLicenseBean;

public interface LicenseMapper {

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
	
	//ajax 유저학력 삭제
	@Delete("Delete from license_table where license_idx = #{license_idx}")
	void licenseTableDelete (String license_idx);
	
	
	//ajax 자격증 조회
	@Select("select license_idx from license_table where license_name = #{license_name}" )
	int getLicenseidx(String license_name);
			
	//ajax 유저보유자격증에 등록
	@Insert("INSERT INTO userLicense_table (userLicense_idx, user_id, license_idx ) "
			+  "VALUES (userLicense_seq.nextval, #{user_id}, #{license_idx})")
	void insertUserLicense(UserLicenseBean userLicenseBean);
	
	
	//자격증 조회
	@Select("select * from license_table where license_idx = #{license_idx}" )
	LicenseBean getLicenseBean(int license_idx);
	
	
	//소유 자격증 조회
	@Select("select * from license_table a, userLicense_table b "
			+ "where a.license_idx = b.license_idx")
	ArrayList<LicenseBean> getUserOwnLicenseBeans(String user_id);	
}














