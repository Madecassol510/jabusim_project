package kr.co.jabusim.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.dao.UserDao;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
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
		
		userDao.addUserInfo(joinUserBean);
	}
	
	
	public UserBean getLoginUserInfo(UserBean tempLoginUserBean) {
		
		UserBean userBean = userDao.getLoginUserInfo(tempLoginUserBean);
		
		if(userBean != null) {
			loginUserBean.setUser_idx(userBean.getUser_idx());
			loginUserBean.setUser_name(userBean.getUser_name());
			loginUserBean.setUserLogin(true);	
		}
		
		return userDao.getLoginUserInfo(tempLoginUserBean);
	}			
}
