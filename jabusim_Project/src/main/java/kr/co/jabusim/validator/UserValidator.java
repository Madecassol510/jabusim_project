package kr.co.jabusim.validator;


import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.jabusim.beans.UserBean;


public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
	   return UserBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		UserBean userBean = (UserBean) target;
		String beanName = errors.getObjectName();
		
		System.out.println(beanName);
		
		
		if(beanName.equals("joinUserBean")==true || beanName.equals("modifyUserBean")==true) {		
			if (userBean.getUser_pw().equals(userBean.getUser_pw2()) == false) {
	            errors.rejectValue("user_pw", "NotEquals");
	            errors.rejectValue("user_pw2", "NotEquals");
	        }		
			if(beanName.equals("joinUserBean")==true && beanName.equals("modifyUserBean")==false) {
				if(userBean.getUser_birthdate().isEmpty()) {
					errors.rejectValue("user_birthdate", "NotNull");
				}
				if(userBean.getUser_gender().isEmpty()) {
					errors.rejectValue("user_gender", "NotNull");
				}
				if(userBean.getUser_phoneNum().isEmpty()) {
					errors.rejectValue("user_phoneNum", "NotNull");
				}
				if (userBean.isUserIdExist() == false) {
		               errors.rejectValue("user_id", "DontCheckUserIdExist");
		        }
			}		
		}
	}
}
