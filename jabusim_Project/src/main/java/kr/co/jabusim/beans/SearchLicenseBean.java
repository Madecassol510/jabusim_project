package kr.co.jabusim.beans;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchLicenseBean {
	
	private int license_idx;
    private String license_name;
    private String license_type;
    private String majorCode;
    private String minorCode;
	public int getLicense_idx() {
		return license_idx;
	}
	public void setLicense_idx(int license_idx) {
		this.license_idx = license_idx;
	}
	public String getLicense_name() {
		return license_name;
	}
	public void setLicense_name(String license_name) {
		this.license_name = license_name;
	}
	public String getLicense_type() {
		return license_type;
	}
	public void setLicense_type(String license_type) {
		this.license_type = license_type;
	}
	public String getMajorCode() {
		return majorCode;
	}
	public void setMajorCode(String majorCode) {
		this.majorCode = majorCode;
	}
	public String getMinorCode() {
		return minorCode;
	}
	public void setMinorCode(String minorCode) {
		this.minorCode = minorCode;
	}
    
    
    
}
