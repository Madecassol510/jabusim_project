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




public interface UserCareerMapper {
	
	//모든 유저의 경력 리스트
	@Select("select * from userCareer_table")
	ArrayList<UserCareerBean> allUserCareerInfo();
	
	//로그인한 유저의 경력 리스트
	@Select("select * from userCareer_table where user_idx = #{user_idx}")
	ArrayList<UserCareerBean> getUserCareerInfo(String user_idx);
	
	
	//ajax 유저학력 검색
	@Select("select * from userCareer_table where userCareer_idx = #{userCareer_idx}")
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
}









