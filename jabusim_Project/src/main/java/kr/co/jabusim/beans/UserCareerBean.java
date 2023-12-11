package kr.co.jabusim.beans;

public class UserCareerBean {
	   
	private int userCareer_idx;
	private String user_name;
	private String user_id;
	private String userCareer_field;
	private String userCareer_type;
	private String userCareer_company;
	private String userCareer_inquiryDate;
	private String userCareer_status;
	
	
	
	public int getUserCareer_idx() {
		return userCareer_idx;
	}
	public void setUserCareer_idx(int userCareer_idx) {
		this.userCareer_idx = userCareer_idx;
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
	public String getUserCareer_field() {
		return userCareer_field;
	}
	public void setUserCareer_field(String userCareer_field) {
		this.userCareer_field = userCareer_field;
	}
	public String getUserCareer_type() {
		return userCareer_type;
	}
	public void setUserCareer_type(String userCareer_type) {
		this.userCareer_type = userCareer_type;
	}
	public String getUserCareer_company() {
		return userCareer_company;
	}
	public void setUserCareer_company(String userCareer_company) {
		this.userCareer_company = userCareer_company;
	}
	public String getUserCareer_inquiryDate() {
		return userCareer_inquiryDate.replace(" 00:00:00", "");
	}
	public void setUserCareer_inquiryDate(String userCareer_inquiryDate) {
		this.userCareer_inquiryDate = userCareer_inquiryDate;
	}
	public String getUserCareer_status() {
		return userCareer_status;
	}
	public void setUserCareer_status(String userCareer_status) {
		this.userCareer_status = userCareer_status;
	}
	
	
	
}


