package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.ExamReceiptBean;
import kr.co.jabusim.beans.ExamResultBean;
import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;

public interface ExamResultMapper {

	// 모든 시험 테이블 가져오기
	@Select("select * from examReceipt_table")
	ArrayList<ExamResultBean> allExamReceiptInfo();

	ArrayList<ExamResultBean> examResultTableSearch(
			@Param("name") String name, 
			@Param("examName") String examName,
			@Param("examSubject") String examSubject,

			@Param("examStart") String examStart, 
			@Param("examEnd") String examEnd,
			@Param("resultStart") String resultStart, 
			@Param("resultEnd") String resultEnd,

			@Param("examType") List<String> examType, 
			@Param("resultStatus") List<String> resultStatus
			);
}
