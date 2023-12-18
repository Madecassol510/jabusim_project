package kr.co.jabusim.beans;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class ExamPlaceBean {
	
	   
	private int examPlace_idx;
	private String examPlace_name;
	private String examPlace_region;
	private String examPlace_address;
	private int examPlace_maximum;
	
	//해당장소 접수인원수
	private int currentRegistrations;
	
	
	
	public int getExamPlace_idx() {
		return examPlace_idx;
	}
	public void setExamPlace_idx(int examPlace_idx) {
		this.examPlace_idx = examPlace_idx;
	}
	public String getExamPlace_name() {
		return examPlace_name;
	}
	public void setExamPlace_name(String examPlace_name) {
		this.examPlace_name = examPlace_name;
	}
	public String getExamPlace_region() {
		return examPlace_region;
	}
	public void setExamPlace_region(String examPlace_region) {
		this.examPlace_region = examPlace_region;
	}
	public String getExamPlace_address() {
		return examPlace_address;
	}
	public void setExamPlace_address(String examPlace_address) {
		this.examPlace_address = examPlace_address;
	}
	public int getExamPlace_maximum() {
		return examPlace_maximum;
	}
	public void setExamPlace_maximum(int examPlace_maximum) {
		this.examPlace_maximum = examPlace_maximum;
	}
	public int getCurrentRegistrations() {
		return currentRegistrations;
	}
	public void setCurrentRegistrations(int currentRegistrations) {
		this.currentRegistrations = currentRegistrations;
	}
	
	
	
}
