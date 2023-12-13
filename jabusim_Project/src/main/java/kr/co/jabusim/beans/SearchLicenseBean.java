package kr.co.jabusim.beans;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchLicenseBean {
	
	private int license_idx;
    private String license_name;
    private String majorCode;
    private String minorCode;
    private String exam_name;
    private String exam_licensetype;
    private String receiptStartDate;
    private String exam_receiptEndDate;
    private String examDate;
    
}
