package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;

public interface ExamMapper {

	@Select("SELECT *from exam_table\r\n"
			+ "WHERE \r\n"
			+ "    (SYSDATE+11 BETWEEN exam_receiptStartDate AND exam_receiptEndDate)")
	ArrayList<ExamBean> getRegisting();
	
	
	//모든 시험 테이블 가져오기		
	@Select("select * from exam_table")
	ArrayList<ExamBean> allExamInfo();
	
	
	ArrayList<ExamBean> examTableSearch (
			@Param("examName") String examName,
			@Param("examYear") String examYear,
			
			
			@Param("examType") List<String> examType,
			@Param("exmaLicenseType") List<String> exmaLicenseType,			
			@Param("examRound") List<String> examRound,

			@Param("receiptStart") String receiptStart,
	        @Param("receiptEnd") String receiptEnd,
	        @Param("examStart") String examStart,
	        @Param("examEnd") String examEnd
			);
}
