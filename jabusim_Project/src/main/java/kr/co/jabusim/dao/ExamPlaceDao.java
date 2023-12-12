package kr.co.jabusim.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jabusim.mapper.ExamPlaceMapper;

@Repository
public class ExamPlaceDao {
	
	@Autowired
	ExamPlaceMapper examPlaceMapper;

}
