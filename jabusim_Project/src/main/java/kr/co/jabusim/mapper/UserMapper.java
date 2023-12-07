package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.SearchLicenseBean;
import kr.co.jabusim.beans.UserBean;

public interface UserMapper {
	
	//아이디중복확인
	@Select("select user_name from user_table where user_id=#{user_id}")
	String checkUserIdExist(String user_id);
	
	//회원가입
	@Insert("insert into user_table(user_idx, user_role, user_name, user_id, user_pw, user_birthdate, user_phoneNum, user_joinDate, user_visitCount) " 
			+ " values(user_seq.nextval, #{user_role}, #{user_name}, #{user_id}, #{user_pw}, #{user_birthdate}, #{user_phoneNum}, #{user_joinDate}, #{user_visitCount})")
	void addUserInfo(UserBean joinUserBean);
	
	
	
	//로그인 정보 가져오기
	@Select("select user_idx, user_name "
			+ "from user_table "
			+ "where user_id= #{user_id} and user_pw=#{user_pw}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);
	
	//로그인 할떄 방문 횟수 올리기
	@Update("update user_table SET user_visitCount = user_visitCount + 1 WHERE user_idx = #{user_idx}")
	void raiseVisitCount(int user_idx);
	
	
	//로그인한 유저의 정보 가져오기
	@Select("select * "
			+ "from user_table "
			+ "where user_idx= #{user_idx}")
	UserBean getUserAllInfo(int user_idx);

	
	
	@Update("update user_table set user_pw=#{user_pw} where user_idx=#{user_idx}")
    void modifyUserInfo(UserBean modifyUserBean);
	

	
	//모든 유저의 정보 가져오기
	@Select("select * from user_table")
	ArrayList<UserBean> getAllUserInfo();
	
	//ajax 유저테이블 가져오기
	List<UserBean> userTableSearch (@Param("name") String name, 
			@Param("interests") String interests,
			@Param("joinStart") String joinStart,
			@Param("joinEnd") String joinEnd);
	
	
	
	
}
