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

public interface ExamResultMapper {

	// 모든 시험 테이블 가져오기
	@Select("select * from examResult_table")
	ArrayList<ExamResultBean> allExamReceiptInfo();

	ArrayList<ExamResultBean> examResultTableSearch(
			@Param("name") String name, 
			@Param("examName") String examName,
			@Param("examSubject") String examSubject,

			@Param("examStart") String examStart, 
			@Param("examEnd") String examEnd,
			@Param("resultStart") String resultStart, 
			@Param("resultEnd") String resultEnd,

			@Param("examType") List<String> examType
			);
	
	//ajax 시험결과 삭제(관리자페이지)
	@Delete("Delete from examResult_table where examResult_idx = #{examResult_idx}")
	void examResultTableDelete (String examResult_idx);
	
	//ajax 시험접수완료해 시험결과 등록(관리자페이지)
	@Insert("INSERT INTO examResult_table (examResult_idx, user_name, user_id, exam_name, exam_subject, exam_type, exam_date, exam_resultDate, examResult_status, examResult_processStatus) " +
		"VALUES (examResult_seq.nextval, #{user_name}, #{user_id}, #{exam_name}, #{exam_subject}, #{exam_type}, #{exam_date}, #{exam_resultDate}, #{examResult_status}, #{examResult_processStatus})")
	void insertExamResult(ExamResultBean examResultBean);
	
	
	//ajax 시험결과 조회(관리자페이지)
	@Select("select * from examResult_table where examResult_idx = #{examResult_idx}")
	ExamResultBean getExamResult(String examResult_idx);
	
	
	//ajax 시험결과 변환(관리자페이지)
	@Update("update examResult_table set  examResult_status = #{status} where examResult_idx = #{examResult_idx}")
	void  examResultTableUpdate(@Param("examResult_idx") int examReceipt_idx, @Param("status") String status);
	
	//ajax 시험결과 처리 완료(관리자페이지)
	@Update("update examResult_table set  examResult_processStatus = #{status} where examResult_idx = #{examResult_idx}")
	void  examResultTableProcess(@Param("examResult_idx") int examReceipt_idx, @Param("status") String status);
	
	
	
	//유저의 시험결과 가져오기(마이페이지)
	@Select("select * from examResult_table where user_id = #{user_id}")
	ArrayList<ExamResultBean> getUserExamResultList(String user_id);
	
}






