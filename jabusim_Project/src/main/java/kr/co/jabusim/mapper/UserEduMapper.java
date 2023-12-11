package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.EduBean;
import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.beans.UserEduBean;

public interface UserEduMapper {
	
	
	//모든 유저의 학력 리스트
	@Select("select * from userEdu_table")
	ArrayList<UserEduBean> allUserEduInfo();
	
	//로그인한 유저의 학력 리스트
	@Select("select * from userEdu_table where user_idx = #{user_idx}")
	ArrayList<UserEduBean> getUserEduInfo(String user_idx);

	//ajax 유저테이블 가져오기
	ArrayList<UserEduBean> userEduTableSearch (
			@Param("name") String name,
            @Param("inquriyStart") String inquriyStart,
            @Param("inquriyEnd") String inquriyEnd,
            @Param("processStatus") List<String> processStatus,
			@Param("eudList") List<String> eudList
			);
	
	
	//ajax 유저학력 삭제
	@Delete("Delete from userEdu_table where userEdu_idx = #{userEdu_idx}")
	void userEduTableDelete (String userEdu_idx);
	
	
	//ajax 유저학력 검색
	@Select("select * from userEdu_table where userEdu_idx = #{userEdu_idx}")
	UserEduBean  getUserEdu(String userEdu_idx);
	

	//UPDATE [테이블] SET [열] = '변경할값' WHERE [조건]
	//ajax 유저학력 상태 변환
	@Update("update userEdu_table set  userEdu_processStatus = #{status} where userEdu_idx = #{userEdu_idx}")
	void  updateUserEduStatus(@Param("userEdu_idx") int userEdu_idx, @Param("status") String status);
	
	
	//ajax 유저에게 학력 등록
	@Insert("INSERT INTO edu_table (edu_idx, user_id, edu_type, edu_academy, edu_major) " +
	        "VALUES (edu_seq.nextval, #{user_id}, #{edu_type}, #{edu_academy}, #{edu_major})")
	void insertUserEdu( EduBean eduBean);

	
}







