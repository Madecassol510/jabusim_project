package kr.co.jabusim.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jabusim.mapper.LicenseMapper;

@Repository
public class LicenseDao {
	@Autowired
    private LicenseMapper licenseMapper;
	

}
