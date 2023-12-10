package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.ExamReceiptBean;
import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;

public interface ExamReceiptMapper {


	
	//모든 시험 테이블 가져오기		
	@Select("select * from examReceipt_table")
	ArrayList<ExamReceiptBean> allExamReceiptInfo();
	
	
	ArrayList<ExamReceiptBean> examReceiptTableSearch (
			@Param("examName") String examName,
			@Param("examSubject") String examSubject,
			@Param("examPlace") String examPlace,
			
	        @Param("examStart") String examStart,
	        @Param("examEnd") String examEnd,
	        @Param("resultStart") String resultStart,
	        @Param("resultEnd") String resultEnd,
	        
	        @Param("examType") List<String> examType
			);
	
	//ajax 유저학력 삭제
	@Delete("Delete from examReceipt_table where examReceipt_idx = #{examReceipt_idx}")
	void examReceiptTableDelete (String examReceipt_idx);
	
}
