package kr.co.jabusim.beans;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

public class UserBean {

	private int user_idx;
	
	@Size(min=2, max=10)
	@Pattern(regexp = "[가-힣]*")
	private String user_name;
	
	@Size(min=8, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_id;
	
	@Size(min=8, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_pw;
	
	@Size(min=8, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_pw2; 
	
	@NotNull
	private String user_birthdate;
	
	@NotNull
	private String user_gender;
	
	@NotNull
	@Pattern(regexp = "^[0-9]+$")
	private String user_phoneNum;
	
	private String user_photo;
	
	private boolean userIdExist; 
	private boolean userLogin; 
	
	public UserBean() {
		this.userIdExist = false;
		this.userLogin = false;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_pw2() {
		return user_pw2;
	}

	public void setUser_pw2(String user_pw2) {
		this.user_pw2 = user_pw2;
	}

	public String getUser_birthdate() {
		return user_birthdate;
	}

	public void setUser_birthdate(String user_birthdate) {
		this.user_birthdate = user_birthdate;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_phoneNum() {
		return user_phoneNum;
	}

	public void setUser_phoneNum(String user_phoneNum) {
		this.user_phoneNum = user_phoneNum;
	}

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}

	public boolean isUserIdExist() {
		return userIdExist;
	}

	public void setUserIdExist(boolean userIdExist) {
		this.userIdExist = userIdExist;
	}

	public boolean isUserLogin() {
		return userLogin;
	}

	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
	}
	
	
	
	
}
