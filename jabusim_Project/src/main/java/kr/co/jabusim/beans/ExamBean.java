package kr.co.jabusim.beans;



import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Calendar;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;


public class ExamBean {

	private int exam_idx;
	private String exam_name;
	private String exam_type; // 필기, 실기
	private String exam_licenseType; // 기사, 기능사. 기술사
	private int exam_year;
	private int exam_round;
	private String exam_receiptStartDate;
	private String exam_receiptEndDate;
	private String exam_date;
	private String exam_resultDate;

	// db에 없는 컬럼
	private String exam_status;

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

	public int getExam_year() {
		return exam_year;
	}

	public void setExam_year(int exam_year) {
		this.exam_year = exam_year;
	}

	public int getExam_round() {
		return exam_round;
	}

	public void setExam_round(int exam_round) {
		this.exam_round = exam_round;
	}

	public String getExam_receiptStartDate() {
		return exam_receiptStartDate.replace(" 00:00:00", "");
	}

	public void setExam_receiptStartDate(String exam_receiptStartDate) {
		this.exam_receiptStartDate = exam_receiptStartDate;
	}

	public String getExam_receiptEndDate() {
		return exam_receiptEndDate.replace(" 00:00:00", "");
	}

	public void setExam_receiptEndDate(String exam_receiptEndDate) {
		this.exam_receiptEndDate = exam_receiptEndDate;
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

	public String getExam_status() {
		Date currentDate = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        try {
        	Date receiptStartDate = formatter.parse(exam_receiptStartDate);
            Date receiptEndDate = formatter.parse(exam_receiptEndDate);
            Date examDate = formatter.parse(exam_date);

            // Calendar 객체 생성
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(receiptStartDate);

            // receiptStartDate에서 7일 전의 날짜 계산
            calendar.add(Calendar.DATE, -20);
            Date BeforeDate = calendar.getTime();
            
            if (currentDate.compareTo(receiptStartDate) >= 0 && currentDate.compareTo(receiptEndDate) <= 0) {
                exam_status = "접수중";
            }
            else if(currentDate.compareTo(BeforeDate) >= 0 &&  currentDate.compareTo(receiptStartDate) < 0) {
            	exam_status = "접수예정";
            }
            else if (currentDate.compareTo(receiptEndDate) > 0 && currentDate.compareTo(examDate) < 0) {
                exam_status = "시험예정";
            } else if (currentDate.compareTo(examDate) == 0) {
                exam_status = "시험일";
            } else if (currentDate.compareTo(examDate) > 0) {
                exam_status = "시험마감";
            } else {
                exam_status = "일반";
            }
        } catch (Exception e) {
            // Handle the exception or log it if the date parsing fails
            e.printStackTrace();
            exam_status = "날짜 형식 오류";
        }
        
        return exam_status;
	}
	public void setExam_status(String exam_status) {
		this.exam_status = exam_status;
	}

	
	
	
	

}
