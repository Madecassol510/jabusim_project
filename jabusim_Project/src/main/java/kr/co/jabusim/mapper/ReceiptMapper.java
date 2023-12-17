package kr.co.jabusim.mapper;

import java.util.List;
import java.util.Date;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import kr.co.jabusim.beans.ExamPlaceBean;
import kr.co.jabusim.beans.LicenseBean;

public interface ReceiptMapper {
	
	
	/*******2번째페이지*******/
	@Select("SELECT distinct license_maincategory from license_table where license_type = #{licenseType}")
	List<String> getMajorCodes(@Param("licenseType") String liceseType);
	
	@Select("SELECT * FROM license_table WHERE license_type = #{licenseType}")
	List<LicenseBean> selectedLicenseType(String licenseType, RowBounds rowBounds);
	@Select("SELECT count(*) FROM license_table WHERE license_type = #{licenseType}")
	int getContentCnt(String licenseType);
	
	@Select("SELECT * FROM license_table WHERE license_type = #{licenseType} AND license_name LIKE '%' || #{searchInput} || '%'")
	List<LicenseBean> searchLicenseName(@Param("searchInput") String searchInput, @Param("licenseType") String licenseType,  RowBounds rowBounds);
	@Select("SELECT count(*) from license_table WHERE license_type = #{licenseType} AND license_name LIKE '%' || #{serchLicenseName} || '%'")
	int getContentCnt_search(@Param("serchLicenseName") String searchInput, @Param("licenseType") String licenseType);
	
	List<LicenseBean> getOptionsResults(@Param("major") String major, @Param("minor") String minor, @Param("licenseType") String licenseType, RowBounds rowBounds);
	int getContentCnt_option(@Param("major") String major, @Param("minor") String minor, @Param("licenseType") String licenseType);
	
	
	/*******3번째페이지*******/
	@Select("select * from examPlace_table")
	List<ExamPlaceBean> getExamPlace(RowBounds rowBounds);
	@Select("select count(*) from examPlace_table")
	int getContentCnt_examPlace();
	
	
	@Select("select distinct examplace_region from examPlace_table order by examplace_region")
	List<String> getReceiptRegions();
	
	@Select("select * from examPlace_table where examplace_region=#{selectRegion}")
	List<ExamPlaceBean> getExamPlace_region(@Param("selectRegion") String region, RowBounds rowBounds);
	
	@Select("select count(*) from examPlace_table WHERE examplace_region=#{selectRegion}")
	int getContentCnt_region(@Param("selectRegion") String region);
	
	
	
	/*******insert*******/
	@Insert("INSERT INTO examReceipt_table " +
	        "(examReceipt_idx, user_name, user_id, exam_name, exam_subject, exam_type, " +
	        "examReceipt_date, exam_date, exam_resultDate, examPlace_name, examReceipt_status) " +
	        "VALUES (examReceipt_seq.nextval, #{userName}, #{userId}, #{examName}, #{licenseName}, #{examType}, " +
	        "#{formattedDate}, #{examDate}, #{examResultDate}, #{examPlaceName}, '처리대기')")
	void insertReceipt(@Param("userName") String userName, @Param("userId") String userId, 
	                   @Param("examName") String examName, @Param("examType") String examType, 
	                   @Param("licenseName") String licenseName, @Param("formattedDate") Date formattedDate,
	                   @Param("examDate") Date examDate, @Param("examResultDate") Date examResultDate,
	                   @Param("examPlaceName") String examPlaceName);
	
	
	
	
	
}





