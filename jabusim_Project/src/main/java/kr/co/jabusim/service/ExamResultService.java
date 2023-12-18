package kr.co.jabusim.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.ExamBean;
import kr.co.jabusim.beans.ExamResultBean;
import kr.co.jabusim.mapper.ExamResultMapper;

@Service
public class ExamResultService {
	
	@Autowired
	private ExamResultMapper examResultMapper;
	
	public ArrayList<ExamResultBean> examResultTableSearch (
			@Param("name") String name, 
			@Param("examName") String examName,
			@Param("examSubject") String examSubject,

			@Param("examStart") String examStart, 
			@Param("examEnd") String examEnd,
			@Param("resultStart") String resultStart, 
			@Param("resultEnd") String resultEnd,

			@Param("examType") List<String> examType,
			@Param("resultStatus") List<String> resultStatus,
			@Param("processStatus") List<String> processStatus
	      
			){
		
		ArrayList<ExamResultBean> tempExamResultBeanList
		= examResultMapper.examResultTableSearch(name, examName, examSubject, examStart, examEnd, resultStart, resultEnd, examType);
		ArrayList<ExamResultBean> examResultBeanList = new ArrayList<ExamResultBean>();
		
		
			if (resultStatus.size() <= 0 &&  processStatus.size()<=0) {
		         for(int i=0; i<tempExamResultBeanList.size(); i++) {
		            examResultBeanList.add(tempExamResultBeanList.get(i));
		         }
		      }
		      else if(resultStatus.size() > 0 && processStatus.size()<=0) {
		         
		         for(int i=0; i<tempExamResultBeanList.size(); i++) {
		            for(int y=0; y<resultStatus.size(); y++) {
		               if(tempExamResultBeanList.get(i).getExamResult_status().equals(resultStatus.get(y))) {
		                  examResultBeanList.add(tempExamResultBeanList.get(i));      
		               }
		            }      
		         }   
		      }
		      else if(resultStatus.size() <= 0 && processStatus.size()>0) {
		         for(int i=0; i<tempExamResultBeanList.size(); i++) {
		            for(int z=0; z<processStatus.size(); z++) {
		               if(tempExamResultBeanList.get(i).getExamResult_processStatus().equals(processStatus.get(z))) {
		                  examResultBeanList.add(tempExamResultBeanList.get(i));      
		               }
		            }   
		         }   
		      }
		      else if(resultStatus.size() > 0 && processStatus.size() >0){
		         for(int i=0; i<tempExamResultBeanList.size(); i++) {
		            for(int z=0; z<processStatus.size(); z++) {
		               if(tempExamResultBeanList.get(i).getExamResult_processStatus().equals(processStatus.get(z))) {               
		                  for(int y=0; y<resultStatus.size(); y++) {
		                     if(tempExamResultBeanList.get(i).getExamResult_status().equals(resultStatus.get(y))) {
		                        examResultBeanList.add(tempExamResultBeanList.get(i));      
		                     }
		                  }                  
		               }
		            }   
		         }      
		      }
		
		
		return examResultBeanList;
	}
}
