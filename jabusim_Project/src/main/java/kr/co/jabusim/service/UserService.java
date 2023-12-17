package kr.co.jabusim.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.dao.UserDao;
import kr.co.jabusim.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserMapper userMapper;
	
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	
	
	
	public boolean checkUserIdExist(String user_id) {
		String user_name = userDao.checkUserIdExist(user_id);
		
		if(user_name==null) {
			return true;
		}else {
			return false;
		}
	}
	
	public void addUserInfo(UserBean joinUserBean) {
		
		
		//회원가입한 날짜
		Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(currentDate);		
		joinUserBean.setUser_joinDate(formattedDate);
		
		
		userDao.addUserInfo(joinUserBean);
	}
	
	//로그인 시도
	public UserBean getLoginUserInfo(UserBean tempLoginUserBean) {
		
		UserBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean);
		System.out.println(tempLoginUserBean.getUser_id());
		System.out.println(tempLoginUserBean.getUser_pw());
		
		
		//가져온 값이 있다면 세션 영역으로 데이터 이동
		if(tempLoginUserBean2 != null) {
			loginUserBean.setUser_idx(tempLoginUserBean2.getUser_idx());
			loginUserBean.setUser_role(tempLoginUserBean2.getUser_role());
			loginUserBean.setUser_id(tempLoginUserBean2.getUser_id());
			loginUserBean.setUser_name(tempLoginUserBean2.getUser_name());
			loginUserBean.setUserLogin(true);
		}
		return userDao.getLoginUserInfo(tempLoginUserBean);
	}
	
	
	//로그인 시 방문횟수 업
	public void raiseVisitCount(int user_idx) {
		userDao.raiseVisitCount(user_idx);
	}
	
	
	public UserBean getUserAllInfo() {
		
		UserBean tempModifyUserBean = userDao.getUserAllInfo(loginUserBean.getUser_idx());	
		return tempModifyUserBean;
	}
	
	
	
	public void getModifyUserInfo(UserBean modifyUserBean){
		UserBean tempModifyUserBean = userDao.getUserAllInfo(loginUserBean.getUser_idx());
		
		modifyUserBean.setUser_id(tempModifyUserBean.getUser_id());
		modifyUserBean.setUser_name(tempModifyUserBean.getUser_name());
		modifyUserBean.setUser_birthdate(tempModifyUserBean.getUser_birthdate());
		modifyUserBean.setUser_phoneNum(tempModifyUserBean.getUser_phoneNum());
		modifyUserBean.setUser_idx(tempModifyUserBean.getUser_idx());
	}
	
	
	public void modifyUserInfo(UserBean modifyUserBean){
		modifyUserBean.setUser_idx(loginUserBean.getUser_idx());
		userDao.modifyUserInfo(modifyUserBean);	
	}
	
	
	public void checkUserIdInfo(UserBean checkPwUserBean) {
		UserBean tempModifyUserBean = userDao.getUserAllInfo(loginUserBean.getUser_idx());
		
		checkPwUserBean.setUser_id(tempModifyUserBean.getUser_id());
		System.out.println(checkPwUserBean.getUser_id());
	}
	
	public boolean loginPwCheck(UserBean checkPwUserBean) {
		
		UserBean tempModifyUserBean =userDao.getUserAllInfo(loginUserBean.getUser_idx());
		
		if(tempModifyUserBean.getUser_pw().equals(checkPwUserBean.getUser_pw())){
			return true;
		}
		else {
			return false;
		}
	}
	
	// =======================================================================
	// 관리자페이지 회원관리에 모든 회원 정보 가져오기
	public ArrayList<UserBean> getAllUserInfo() {
		return userDao.getAllUserInfo();
	};
}








