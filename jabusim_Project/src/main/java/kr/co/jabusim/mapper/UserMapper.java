package kr.co.jabusim.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.jabusim.beans.UserBean;

public interface UserMapper {

	
	
	//아이디중복확인
	@Select("select user_name from user_table where user_id=#{user_id}")
	String checkUserIdExist(String user_id);
	
	//회원가입
	@Insert("insert into user_table(user_idx, user_name, user_id, user_pw, user_birthdate, user_gender, user_phoneNum) " 
			+ " values(user_seq.nextval, #{user_name}, #{user_id}, #{user_pw}, #{user_birthdate}, #{user_gender}, #{user_phoneNum})")
	void addUserInfo(UserBean joinUserBean);
	
	//로그인 정보 가져오기
	@Select("select user_idx, user_name "
			+ "from user_table "
			+ "where user_id= #{user_id} and user_pw=#{user_pw}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);
}