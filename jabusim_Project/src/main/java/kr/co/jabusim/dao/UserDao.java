package kr.co.jabusim.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.mapper.UserMapper;

@Repository
public class UserDao {
	
	@Autowired
	private UserMapper userMapper;
	
	
	public String checkUserIdExist(String user_id) {
		return userMapper.checkUserIdExist(user_id);
	}
	
	
	public void addUserInfo(UserBean joinUserBean) {
		
		userMapper.addUserInfo(joinUserBean);
	}
	
	
	//로그인 시도
	public UserBean getLoginUserInfo(UserBean tempLoginUserBean) {
		
		return userMapper.getLoginUserInfo(tempLoginUserBean);
	}
	
	public UserBean getUserAllInfo(int user_idx){
		return userMapper. getUserAllInfo(user_idx);
	}
	
	public void modifyUserInfo(UserBean modifyUserBean){
		userMapper.modifyUserInfo(modifyUserBean);
	}
	
	
	//로그인 시 방문횟수 업
	public void raiseVisitCount(int user_idx) {
		userMapper.raiseVisitCount(user_idx);
	}
	
	
	//=======================================================================
	//관리자페이지 회원관리에 모든 회원 정보 가져오기
	public ArrayList<UserBean> getAllUserInfo(){
		return userMapper.getAllUserInfo();
	};
}
