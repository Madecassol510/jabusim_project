package kr.co.jabusim.beans;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExamBean {


	   
	private int exam_idx;
	private String exam_name;
	private String exam_type;				//필기, 실기
	private String exam_licenseType;		// 기사, 기능사. 기술사
	
	private String exam_receiptStartDate;
	private String exam_receiptEndDate;
	private String exam_date;
	private String exam_resultDate;
	
	//db에 없는 컬럼
	private String exam_status;
	
	
	
	public ExamBean() {
		
		//현재 날짜
		LocalDate currentDate = LocalDate.now();
		
		// DateTimeFormatter를 사용하여 문자열을 LocalDate로 변환
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate receiptStartDate = LocalDate.parse(exam_receiptStartDate, formatter);
		LocalDate receiptEndDate = LocalDate.parse(exam_receiptEndDate, formatter);
		LocalDate examDate = LocalDate.parse(exam_date, formatter);
		
		if(currentDate.compareTo(receiptStartDate.minusDays(14))>=0 && currentDate.compareTo(receiptStartDate)<0) {
			exam_status = "접수예정";
		}
		else if(currentDate.compareTo(receiptStartDate)>=0 && currentDate.compareTo(receiptEndDate)<=0){
			exam_status = "접수중";
		}
		else if(currentDate.compareTo(receiptEndDate)>0 && currentDate.compareTo(examDate)<0){
			exam_status = "시험예정";
		}
		else if(currentDate.compareTo(examDate)==0){
			exam_status = "시험일";
		}
		else{
			exam_status = "일반";
		}
	}


	
	

	public int getExam_idx() {
		return exam_idx;
	}



	public void setExam_idx(int exam_idx) {
		this.exam_idx = exam_idx;
	}



	public String getExam_name() {
		return exam_name;
	}



	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}



	public String getExam_type() {
		return exam_type;
	}



	public void setExam_type(String exam_type) {
		this.exam_type = exam_type;
	}



	public String getExam_licenseType() {
		return exam_licenseType;
	}



	public void setExam_licenseType(String exam_licenseType) {
		this.exam_licenseType = exam_licenseType;
	}



	public String getExam_receiptStartDate() {
		return exam_receiptStartDate;
	}



	public void setExam_receiptStartDate(String exam_receiptStartDate) {
		this.exam_receiptStartDate = exam_receiptStartDate;
	}



	public String getExam_receiptEndDate() {
		return exam_receiptEndDate;
	}



	public void setExam_receiptEndDate(String exam_receiptEndDate) {
		this.exam_receiptEndDate = exam_receiptEndDate;
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



	public String getExam_status() {
		return exam_status;
	}

	public void setExam_status(String exam_status) {
		this.exam_status = exam_status;
	}
}



