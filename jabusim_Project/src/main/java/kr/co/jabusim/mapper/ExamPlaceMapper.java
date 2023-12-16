package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.UserCareerBean;
import kr.co.jabusim.beans.UserEduBean;
import kr.co.jabusim.beans.ExamPlaceBean;

public interface ExamPlaceMapper {
	
	
	//모든 시험장소 select
	@Select("select * from examPlace_table ORDER BY examPlace_idx")
	ArrayList<ExamPlaceBean> allExamPlaceInfo();
	
	//ajax 시험장소테이블 가져오기
	ArrayList<ExamPlaceBean> examPlaceTableSearch (
			@Param("placeName") String placeName,
			@Param("placeRegion") String placeRegion,
			@Param("placeAddress") String placeAddress
			);
	
	
	//ajax 유저학력 삭제
	@Delete("Delete from examPlace_table where examPlace_idx = #{examPlace_idx}")
	void examPlaceTableDelete (String examPlace_idx);
}
