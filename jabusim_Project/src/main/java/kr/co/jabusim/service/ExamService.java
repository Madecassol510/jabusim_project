package kr.co.jabusim.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.mapper.ExamMapper;

@Service
public class ExamService {
	
	@Autowired
	private ExamMapper examMapper;
	
	public ArrayList<ExamBean> examTableSearch (
			@Param("examName") String examName,
			@Param("examYear") String examYear,
			
			@Param("examType") List<String> examType,
			@Param("exmaLicenseType") List<String> exmaLicenseType,
			@Param("examRound") List<String> examRound,

			@Param("receiptStart") String receiptStart,
	        @Param("receiptEnd") String receiptEnd,
	        @Param("examStart") String examStart,
	        @Param("examEnd") String examEnd,
	        @Param("examRound") List<String> examStatus
	      
			){
		
		ArrayList<ExamBean> tempExamBeanList = examMapper.examTableSearch(examName, examYear, examType, exmaLicenseType, examRound, receiptStart, receiptEnd, examStart, examEnd);
		ArrayList<ExamBean> examBeanList = new ArrayList<ExamBean>();
		
		for(int i=0; i<tempExamBeanList.size(); i++) {
			
			if(examStatus.size()>0) {
				for(int y=0; y<examStatus.size(); y++) {
					if(tempExamBeanList.get(i).getExam_status().equals(examStatus.get(y))) {
						examBeanList.add(tempExamBeanList.get(i));
					}
				}
			}
			else {
				examBeanList.add(tempExamBeanList.get(i));
			}		
		}
			
		return examBeanList;
	}
}













