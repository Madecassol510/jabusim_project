package kr.co.jabusim.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.mapper.UserMapper;

@Repository
public class UserDao {
	
	@Autowired
	private UserMapper userMapper;
	
	public void addUserInfo(UserBean joinUserBean) {
		
		userMapper.addUserInfo(joinUserBean);
	}
	
	public UserBean getLoginUserInfo(UserBean tempLoginUserBean) {
		
		return userMapper.getLoginUserInfo(tempLoginUserBean);
	}	
}
