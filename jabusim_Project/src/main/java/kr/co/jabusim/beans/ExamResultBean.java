package kr.co.jabusim.beans;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ExamResultBean {

	   
	 private int examResult_idx;
	 private String user_name;
	 private String user_id;
	 private String exam_name;
	 private String exam_subject;
	 private String exam_type;
	 private String exam_date;
	 private String exam_resultDate;
	 private String examResult_status;
	 private String examResult_processStatus;
	 
	 
	 
	public int getExamResult_idx() {
		return examResult_idx;
	}
	public void setExamResult_idx(int examResult_idx) {
		this.examResult_idx = examResult_idx;
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
	public String getExam_date() {
		return exam_date.replace(" 00:00:00", "");
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public String getExam_resultDate() {
		return exam_resultDate.replace(" 00:00:00", "");
	}
	public void setExam_resultDate(String exam_resultDate) {
		this.exam_resultDate = exam_resultDate;
	}
	public String getExamResult_status() {
				
		if(examResult_processStatus.equals("처리가능") || examResult_processStatus.equals("미처리")) {
			if(examResult_status.equals("합격")) {
				examResult_status = "합격예정";
			}
			else if(examResult_status.equals("불합격")) {
				examResult_status = "불합격예정";
			}
		}
        
		return examResult_status;
		
	}
	public void setExamResult_status(String examResult_status) {
		this.examResult_status = examResult_status;
	}
	
	public String getExamResult_processStatus() {
		
		Date currentDate = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        
       
	        try {
	            Date examResultDate = formatter.parse(exam_resultDate);
	
	            if(currentDate.compareTo(examResultDate) >= 0) {
	            	if(examResult_processStatus.equals("미처리")) {
	            		examResult_processStatus = "처리가능";
	            	}	            		
	            }            
	        } catch (Exception e) {
	            // Handle the exception or log it if the date parsing fails
	            e.printStackTrace();
	            examResult_processStatus = "날짜 형식 오류";
	        }
	
		return examResult_processStatus;
	}
	public void setExamResult_processStatus(String examResult_processStatus) {
		this.examResult_processStatus = examResult_processStatus;
	}
}










