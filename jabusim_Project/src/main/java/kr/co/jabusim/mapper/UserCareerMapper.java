package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import kr.co.jabusim.beans.CareerBean;

import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;




public interface UserCareerMapper {
	
	//모든 유저의 경력 리스트
	@Select("select * from userCareer_table ORDER BY userCareer_idx DESC")
	ArrayList<UserCareerBean> allUserCareerInfo();
	
	//로그인한 유저의 경력 리스트
	@Select("select * from userCareer_table where user_id = #{user_id} ORDER BY userCareer_idx DESC")
	ArrayList<UserCareerBean> getUserCareerInfo(String user_id);
		
	
	//ajax 유저학력 조회
	@Select("select * from userCareer_table where userCareer_idx = #{userCareer_idx} ")
	UserCareerBean  getUserCareer(String userCareer_idx);
	
	
	//ajax 유저테이블 가져오기
		ArrayList<UserCareerBean> userCareerTableSearch (
				@Param("name") String name,
	            @Param("inquriyStart") String inquriyStart,
	            @Param("inquriyEnd") String inquriyEnd,   
	            @Param("careerField") String careerField,
	            @Param("careerType") List<String> careerType,        
	            @Param("processStatus") List<String> processStatus
				);
		
	//ajax 유저학력 삭제
	@Delete("Delete from userCareer_table where userCareer_idx = #{userCareer_idx}")
	void userCareerTableDelete (String userCareer_idx);
	
	
	//UPDATE [테이블] SET [열] = '변경할값' WHERE [조건]
	//ajax 유저학력 상태 변환
	@Update("update userCareer_table set  userCareer_status = #{status} where userCareer_idx = #{userCareer_idx}")
	void  updateUserCareerStatus(@Param("userCareer_idx") int userCareer_idx, @Param("status") String status);
	
	
	//ajax 유저에게 학력 등록
	@Insert("INSERT INTO career_table (career_idx, user_id, career_field, career_type, career_company) " +
		   "VALUES (career_seq.nextval, #{user_id}, #{career_field}, #{career_type}, #{career_company})")
	void insertUserCareer(CareerBean careerBean);
	
	
	@Insert("INSERT INTO userCareer_table (userCareer_idx, user_name, user_id, userCareer_field, userCareer_type, userCareer_company, userCareer_inquiryDate, userCareer_status) " +
	        "VALUES (userCareer_seq.nextval, #{user_name}, #{user_id}, #{userCareer_field}, #{userCareer_type}, "
	        + "#{userCareer_company}, TO_DATE(#{userCareer_inquiryDate}, 'YYYY-MM-DD'), #{userCareer_status})")
	void insertUserCareerInquiry(UserCareerBean userCareerBean);
	
	
	
	//==============================================
	
	
	// 유저의 경력문의 삭제
	@Delete("delete from userCareer_table where user_id = #{user_id}")
	void deleteUserCareerInquiry(String user_id);
		
	// 유저의 경력 삭제
	@Delete("delete from career_table where user_id = #{user_id}")
	void deleteUserCareer(String user_id);
	
	
}









