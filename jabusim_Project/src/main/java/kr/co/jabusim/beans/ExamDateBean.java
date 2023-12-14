package kr.co.jabusim.beans;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExamDateBean {
	private int examID;
	private Date registrationStartDate;
	private Date examDate;
	private Date registrationEndDate;
	public int getExamID() {
		return examID;
	}
	public void setExamID(int examID) {
		this.examID = examID;
	}
	public Date getRegistrationStartDate() {
		return registrationStartDate;
	}
	public void setRegistrationStartDate(Date registrationStartDate) {
		this.registrationStartDate = registrationStartDate;
	}
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	public Date getRegistrationEndDate() {
		return registrationEndDate;
	}
	public void setRegistrationEndDate(Date registrationEndDate) {
		this.registrationEndDate = registrationEndDate;
	}
	
	
}
