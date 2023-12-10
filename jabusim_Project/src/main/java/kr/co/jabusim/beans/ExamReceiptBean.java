package kr.co.jabusim.beans;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ExamReceiptBean {
		   
	private int examReceipt_idx;
	private String user_name;
	private String user_id;
	private String exam_name;
	private String exam_subject;
	private String exam_type;
	private String examReceipt_date;
	private String exam_date;
	private String exam_resultDate;
	
	private String examPlace_name;
	private String examReceipt_status;
	
	
	
	public int getExamReceipt_idx() {
		return examReceipt_idx;
	}
	public void setExamReceipt_idx(int examReceipt_idx) {
		this.examReceipt_idx = examReceipt_idx;
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
	public String getExam_name() {
		return exam_name;
	}
	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}
	public String getExam_subject() {
		return exam_subject;
	}
	public void setExam_subject(String exam_subject) {
		this.exam_subject = exam_subject;
	}
	public String getExam_type() {
		return exam_type;
	}
	public void setExam_type(String exam_type) {
		this.exam_type = exam_type;
	}
	public String getExamReceipt_date() {
		return examReceipt_date;
	}
	public void setExamReceipt_date(String examReceipt_date) {
		this.examReceipt_date = examReceipt_date;
	}
	public String getExam_date() {
		return exam_date;
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public String getExam_resultDate() {
		return exam_resultDate;
	}
	public void setExam_resultDate(String exam_resultDate) {
		this.exam_resultDate = exam_resultDate;
	}
	
	
	public String getExamPlace_name() {
		return examPlace_name;
	}
	public void setExamPlace_name(String examPlace_name) {
		this.examPlace_name = examPlace_name;
	}
	public String getExamReceipt_status() {
				
		Date currentDate = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        
       
	        try {
	            Date examDate = formatter.parse(exam_date);
	
	            
	            if (currentDate.compareTo(examDate) >= 0) {
	            	examReceipt_status = "삭제예정";
	            }
	            
	        } catch (Exception e) {
	            // Handle the exception or log it if the date parsing fails
	            e.printStackTrace();
	            examReceipt_status = "날짜 형식 오류";
	        }
        
        
		return examReceipt_status;
	}
	public void setExamReceipt_status(String examReceipt_status) {
		this.examReceipt_status = examReceipt_status;
	}
}
