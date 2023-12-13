package kr.co.jabusim.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import kr.co.jabusim.beans.SearchLicenseBean;
import kr.co.jabusim.dao.SearchLicenseDao;

public interface SearchLicenseMapper {
	/*
	List<SearchLicenseBean> selectMajorCode(@Param("majorCode") List<String> majorCode);
	List<SearchLicenseBean> selectMinorCode(@Param("minorCode") List<String> minorCode);
	List<SearchLicenseBean> selectSchedule(@Param("schedule") List<String> schedule);
	List<SearchLicenseBean> selectAnyCategories(@Param("selectAnyParams") Map<String, List<String>> anyParms);
	*/
	/*
	List<SearchLicenseBean> selectAnyCategories(@Param("selectAnyParams")Map<String, Map<String, List<String>>> majorCategories,
												@Param("majorCodes") List<String> minorCodes, @Param("kind")String kind);
												*/
	
	List<SearchLicenseBean> selectMajorCategories(@Param("selectMajorCategories") Map<String, List<String>> selectMajorCategories);
	List<SearchLicenseBean> selectMinorCategories(@Param("selectMinorCategories") List<String> selectMinorCategories);
	List<SearchLicenseBean> selectKindCategories(@Param("selectKindCategories") String selectKindCategories);
	List<SearchLicenseBean> selectAnyCategories(@Param("majorCategories") Map<String, List<String>> majorCategories,
			@Param("minorCodes") List<String> minorCodes, @Param("kind") String kind);
	
	@Select("SELECT\r\n"
			+ "    l.license_idx,\r\n"
			+ "    l.license_name,\r\n"
			+ "    l.license_maincategory AS majorCode,\r\n"
			+ "    l.license_subcategory AS minorCode,\r\n"
			+ "    e.exam_name,\r\n"
			+ "    TO_CHAR(e.exam_receiptStartDate) AS receiptStartDate,\r\n"
			+ "    TO_CHAR(e.exam_receiptEndDate) AS exam_receiptEndDate,\r\n"
			+ "    TO_CHAR(e.exam_date) AS examDate\r\n"
			+ "FROM license_table l\r\n"
			+ "JOIN exam_table e ON l.license_type = e.exam_licensetype\r\n"
			+ "WHERE \r\n"
			+ "    e.exam_date > SYSDATE\r\n"
			+ "order by e.exam_date")
	List<SearchLicenseBean> getAllLicenseList();
	
	@Select("SELECT\r\n"
			+ "    l.license_idx,\r\n"
			+ "    l.license_name,\r\n"
			+ "    l.license_maincategory AS majorCode,\r\n"
			+ "    l.license_subcategory AS minorCode,\r\n"
			+ "    e.exam_name,\r\n"
			+ "    TO_CHAR(e.exam_receiptStartDate) AS receiptStartDate,\r\n"
			+ "    TO_CHAR(e.exam_receiptEndDate) AS exam_receiptEndDate,\r\n"
			+ "    TO_CHAR(e.exam_date) AS examDate\r\n"
			+ "FROM license_table l\r\n"
			+ "JOIN exam_table e ON l.license_type = e.exam_licensetype\r\n"
			+ "WHERE \r\n"
			+ "    e.exam_date > SYSDATE\r\n"
			+ "AND\r\n"
			+ "    l.license_name like '%' || #{searchInput} || '%'\r\n"
			+ "ORDER BY e.exam_date")
	List<SearchLicenseBean> getSearchLicenseName(@Param("searchInput") String searchInput);
}
