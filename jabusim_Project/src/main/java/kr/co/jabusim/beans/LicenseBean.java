package kr.co.jabusim.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LicenseBean {
    private int license_id;
    private String type;
    private int type_code;
    private String license_name;
    private int name_code;
    private String div_code;
    private String div_name;
    
	public LicenseBean(int license_id, String type, int type_code, String license_name, int name_code, String div_code,
			String div_name) {
		super();
		this.license_id = license_id;
		this.type = type;
		this.type_code = type_code;
		this.license_name = license_name;
		this.name_code = name_code;
		this.div_code = div_code;
		this.div_name = div_name;
	}
    
    
}