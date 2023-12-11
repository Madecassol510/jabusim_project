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
		= examResultMapper.examResultTableSearch(name, examName, examSubject, examStart, examEnd, resultStart, resultEnd, examType, resultStatus);
		ArrayList<ExamResultBean> examResultBeanList = new ArrayList<ExamResultBean>();
		

		
		for(int i=0; i<tempExamResultBeanList.size(); i++) {		
			if(processStatus.size()>0) {
				for(int y=0; y<processStatus.size(); y++) {
					if(tempExamResultBeanList.get(i).getExamResult_processStatus().equals(processStatus.get(y))) {
						examResultBeanList.add(tempExamResultBeanList.get(i));
					}
				}
			}
			else {
				examResultBeanList.add(tempExamResultBeanList.get(i));
			}		
		}
		return examResultBeanList;
	}
}
