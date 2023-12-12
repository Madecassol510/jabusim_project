package kr.co.jabusim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jabusim.dao.ExamPlaceDao;

@Service
public class ExamPlaceService {
	
	@Autowired
	ExamPlaceDao examPlaceDao;

}
