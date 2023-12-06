package kr.co.jabusim.beans;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchLicenseBean {
	
	private int licenseID;
    private String licenseName;
    private String majorCode;
    private String fullCode;
    private String licenseType;
    private String examName;
    private String registrationPeriod;
    private String examDate;
    
}
