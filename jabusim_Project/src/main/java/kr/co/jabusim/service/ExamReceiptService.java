package kr.co.jabusim.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jabusim.beans.ExamReceiptBean;
import kr.co.jabusim.mapper.ExamReceiptMapper;

@Service
public class ExamReceiptService {
	
	@Autowired
	private ExamReceiptMapper examReceiptMapper;
	

	public ArrayList<ExamReceiptBean> examReciptTableSearch (
			@Param("examName") String examName,
			@Param("examSubject") String examSubject,
			@Param("examPlace") String examPlace,
			
	        @Param("examStart") String examStart,
	        @Param("examEnd") String examEnd,
	        @Param("resultStart") String resultStart,
	        @Param("resultEnd") String resultEnd,
	        
	        @Param("examType") List<String> examType,
	        
	        @Param("receiptStatus") List<String> receiptStatus
			){
		
		ArrayList<ExamReceiptBean> tempExamReceiptBeanList = examReceiptMapper.examReciptTableSearch(examName, examSubject, examPlace, examStart, examEnd, resultStart, resultEnd, examType);
		
		
		ArrayList<ExamReceiptBean> exaReceiptBeanList = new ArrayList<ExamReceiptBean>();  
	
		
		for (int i = 0; i < tempExamReceiptBeanList.size(); i++) {

			if (receiptStatus.size() > 0) {
				for (int y = 0; y < receiptStatus.size(); y++) {
					if (tempExamReceiptBeanList.get(i).getExamReceipt_status().equals(receiptStatus.get(y))) {
						exaReceiptBeanList.add(tempExamReceiptBeanList.get(i));
					}
				}
			} 
			else {
				exaReceiptBeanList.add(tempExamReceiptBeanList.get(i));
			}
		}
		
		return exaReceiptBeanList;
	}
}
