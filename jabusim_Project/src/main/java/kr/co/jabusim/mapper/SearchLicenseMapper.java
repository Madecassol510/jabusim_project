package kr.co.jabusim.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import kr.co.jabusim.beans.SearchLicenseBean;
import kr.co.jabusim.dao.SearchLicenseDao;

public interface SearchLicenseMapper {
	
	List<SearchLicenseBean> selectMajorCode(@Param("majorCode") List<String> majorCode);
	List<SearchLicenseBean> selectFullCode(@Param("fullCode") List<String> fullCode);
	List<SearchLicenseBean> selectLicenseType(@Param("licenseType") List<String> licenseType);
	/*
	 * List<SearchLicenseBean> selectSchedule(@Param("schedule") List<String>
	 * schedule);
	 */

	List<SearchLicenseBean> selectAnyCategories(@Param("selectAnyParmas") Map<String, List<String>> anyParams);
	
	
	
	@Select("SELECT \r\n"
			+ "    L.licenseID,\r\n"
			+ "    L.licenseName,\r\n"
			+ "    (SELECT DISTINCT SUBSTR(L.licenseField, 1, 2) FROM License WHERE License.licenseID = L.licenseID) AS majorCode,\r\n"
			+ "    L.licenseField AS fullCode,\r\n"
			+ "    L.licenseType,\r\n"
			+ "    E.examName,\r\n"
			+ "    TO_CHAR(ED.registrationStartDate, 'YYYY-MM-DD') || ' ~ ' || TO_CHAR(ED.registrationEndDate, 'YYYY-MM-DD') AS registrationPeriod,\r\n"
			+ "    TO_CHAR(ED.examDate, 'YYYY-MM-DD') AS examDate\r\n"
			+ "FROM \r\n"
			+ "    License L\r\n"
			+ "JOIN \r\n"
			+ "    Exam E ON L.licenseID = E.licenseID\r\n"
			+ "JOIN \r\n"
			+ "    ExamDate ED ON E.examID = ED.examID")
	List<SearchLicenseBean> getAllLicenseList();
	

	/*
	 * @Select("SELECT \r\n" + "    L.licenseID,\r\n" + "    L.licenseName,\r\n" +
	 * "    L.licenseField,\r\n" + "    L.licenseType,\r\n" + "    E.examName,\r\n"
	 * +
	 * "    TO_CHAR(ED.registrationStartDate, 'YYYY-MM-DD') || ' ~ ' || TO_CHAR(ED.registrationEndDate, 'YYYY-MM-DD') AS registrationPeriod,\r\n"
	 * + "    TO_CHAR(ED.examDate, 'YYYY-MM-DD') AS examDate \r\n" + "FROM \r\n" +
	 * "    License L\r\n" + "JOIN \r\n" +
	 * "    Exam E ON L.licenseID = E.licenseID\r\n" + "JOIN \r\n" +
	 * "    ExamDate ED ON E.examID = ED.examID " +
	 * "where L.licenseName like '%' || #{query} || '%'") List<SearchLicenseBean>
	 * searchLicenseName(String query);
	 */
	
	/*
	 * List<SearchLicenseBean> selectAnyCategories(@Param("categoryList")
	 * List<String> categoryList);
	 */
	
}
