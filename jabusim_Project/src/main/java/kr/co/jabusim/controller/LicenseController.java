package kr.co.jabusim.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jabusim.mapper.LicenseMapper;

@SuppressWarnings({ "unchecked", "rawtypes" })
@RestController
public class LicenseController {

   @Autowired
   private LicenseMapper licenseMapper;
   
   @GetMapping("/licenses")
   public List getAllLicenseList() {
      System.out.println("getAllLicenseList 성공");
      return licenseMapper.getAllLicenseList();
   }
   
   @GetMapping("/searchLicenseName")
   public List searchLicenseName(@RequestParam String query) {
       System.out.println("검색어: " + query);
       return licenseMapper.searchLicenseName(query);
   }
}