package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.CareerBean;
import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.ExamReceiptBean;
import kr.co.jabusim.beans.ExamResultBean;
import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;

public interface ExamReceiptMapper {


	
	//모든 시험 테이블 가져오기		
	@Select("select * from examReceipt_table ORDER BY examReceipt_idx DESC")
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
	
	
	
	//ajax 시험접수 조회
	@Select("select * from examReceipt_table where examReceipt_idx = #{examReceipt_idx}")
	ExamReceiptBean getExamReceipt(String examReceipt_idx);
	
	//ajax 시험접수 삭제
	@Delete("Delete from examReceipt_table where examReceipt_idx = #{examReceipt_idx}")
	void examReceiptTableDelete (String examReceipt_idx);
	
	//ajax 시험 상태 변환
	@Update("update examReceipt_table set  examReceipt_status = #{status} where examReceipt_idx = #{examReceipt_idx}")
	void  examReceiptTableUpdate(@Param("examReceipt_idx") int examReceipt_idx, @Param("status") String status);
	
	
	//유저의 시험접수 가져오기(마이페이지)
	@Select("select * from examReceipt_table where user_id = #{user_id} ORDER BY examReceipt_idx DESC")
	ArrayList<ExamReceiptBean> getUserExamReceiptList(String user_id);
	
	
	//유저의 접수 삭제
	@Delete("delete from examReceipt_table where user_id = #{user_id}")
	void deleteUserReceipt(String user_id);
}








