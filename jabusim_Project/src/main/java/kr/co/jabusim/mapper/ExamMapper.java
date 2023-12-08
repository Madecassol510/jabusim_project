package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.jabusim.beans.ExamBean;

public interface ExamMapper {

	@Select("SELECT *from exam_table\r\n"
			+ "WHERE \r\n"
			+ "    (SYSDATE+11 BETWEEN exam_receiptStartDate AND exam_receiptEndDate)")
	ArrayList<ExamBean> getRegisting();
	
}
