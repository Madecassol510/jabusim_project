package kr.co.jabusim.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jabusim.mapper.LicenseMapper;
import kr.co.jabusim.service.LicenseService;

@SuppressWarnings({ "unchecked", "rawtypes" })
@RestController
public class LicenseController {

   @Autowired
   private LicenseMapper licenseMapper;

   @Autowired
   private LicenseService licenseService;
   

   @GetMapping("/getLicenseCode")
   public List getLicenseCode() {
      System.out.println("getLicenseCode 성공");
      return licenseMapper.getLicenseCode();
   }

   @GetMapping("/getLicenseType")
   public List getLicenseType() {
	   System.out.println("getLicenseType 성공");
	   return licenseMapper.getLicenseType();
   }
   
}