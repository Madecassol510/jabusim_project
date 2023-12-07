package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;



public interface UserCareerMapper {
	
	//모든 유저의 경력 리스트
	@Select("select * from userCareer_table")
	ArrayList<UserCareerBean> allUserCareerInfo();
	
	//로그인한 유저의 경력 리스트
	@Select("select * from userCareer_table where user_idx = #{user_idx}")
	ArrayList<UserCareerBean> getUserCareerInfo(String user_idx);
	
	
	//ajax 유저테이블 가져오기
		ArrayList<UserCareerBean> userCareerTableSearch (
				@Param("name") String name,
	            @Param("inquriyStart") String inquriyStart,
	            @Param("inquriyEnd") String inquriyEnd,
	            @Param("processStart") String processStart,
	            @Param("processEnd") String processEnd,     
	            @Param("careerField") String careerField,
	            @Param("careerType") List<String> careerType,        
	            @Param("processStatus") List<String> processStatus
				);
	
}
