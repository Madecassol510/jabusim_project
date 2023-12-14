package kr.co.jabusim.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import kr.co.jabusim.beans.SearchLicenseBean;
import kr.co.jabusim.dao.SearchLicenseDao;

public interface SearchLicenseMapper {
	
	List<SearchLicenseBean> selectMajorCategories(@Param("selectMajorCategories") Map<String, List<String>> selectMajorCategories);
	List<SearchLicenseBean> selectMinorCategories(@Param("selectMinorCategories") List<String> selectMinorCategories);
	List<SearchLicenseBean> selectKindCategories(@Param("selectKindCategories") String selectKindCategories);
	List<SearchLicenseBean> selectAnyCategories(@Param("majorCategories") Map<String, List<String>> majorCategories,
			@Param("minorCodes") List<String> minorCodes, @Param("kind") String kind);
	
	@Select("SELECT distinct\r\n"
			+ "    l.license_idx,\r\n"
			+ "    l.license_name,\r\n"
			+ "    l.license_type,\r\n"
			+ "    l.license_maincategory AS majorCode,\r\n"
			+ "    l.license_subcategory AS minorCode\r\n"
			+ "FROM license_table l\r\n"
			+ "ORDER BY l.license_name")
	List<SearchLicenseBean> getAllLicenseList();
	
	@Select("SELECT distinct\r\n"
			+ "    l.license_idx,\r\n"
			+ "    l.license_name,\r\n"
			+ "    l.license_type,\r\n"
			+ "    l.license_maincategory AS majorCode,\r\n"
			+ "    l.license_subcategory AS minorCode\r\n"
			+ "FROM license_table l\r\n"
			+ "WHERE l.license_name like '%' || #{searchInput} || '%'\r\n"
			+ "ORDER BY l.license_name")
	List<SearchLicenseBean> getSearchLicenseName(@Param("searchInput") String searchInput);
}
