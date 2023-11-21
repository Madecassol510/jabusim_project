package kr.co.jabusim.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.jabusim.beans.UserBean;

public interface UserMapper {

	@Insert("insert into user_table(user_idx, user_name, user_id, user_pw, user_birthdate, user_gender, user_phoneNum) " 
			+ " values(user_seq.nextval, #{user_name}, #{user_id}, #{user_pw}, #{user_birthdate}, #{user_gender}, #{user_phoneNum})")
	void addUserInfo(UserBean joinUserBean);
	
	@Select("select user_idx, user_name "
			+ "from user_table "
			+ "where user_id= #{user_id} and user_pw=#{user_pw}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);
}
