package kr.co.jabusim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jabusim.dao.LicenseDao;

@Service
public class LicenseService {

    @Autowired
    private LicenseDao licenseDao;

}
