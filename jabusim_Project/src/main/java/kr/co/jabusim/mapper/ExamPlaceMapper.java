package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;
import kr.co.jabusim.beans.ExamPlaceBean;

public interface ExamPlaceMapper {
	
	
	//모든 시험장소 select
	@Select("select * from examPlace_table")
	ArrayList<ExamPlaceBean> allExamPlaceInfo();
	
	//ajax 시험장소테이블 가져오기
	ArrayList<ExamPlaceBean> examPlaceTableSearch (
			@Param("placeName") String placeName,
			@Param("placeRegion") String placeRegion,
			@Param("placeAddress") String placeAddress
			);
}
