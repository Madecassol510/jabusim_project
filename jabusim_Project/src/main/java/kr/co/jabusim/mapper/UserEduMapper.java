package kr.co.jabusim.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.beans.UserEduBean;

public interface UserEduMapper {
	
	
	//모든 유저의 학력 리스트
	@Select("select * from userEdu_table")
	ArrayList<UserEduBean> allUserEduInfo();
	
	//로그인한 유저의 학력 리스트
	@Select("select * from userEdu_table where user_idx = #{user_idx}")
	ArrayList<UserEduBean> getUserEduInfo(String user_idx);

	//ajax 유저테이블 가져오기
	ArrayList<UserEduBean> userEduTableSearch (
			@Param("name") String name,
            @Param("inquriyStart") String inquriyStart,
            @Param("inquriyEnd") String inquriyEnd,
            @Param("processStart") String processStart,
            @Param("processEnd") String processEnd,
            @Param("processStatus") List<String> processStatus,
			@Param("eudList") List<String> eudList
			);
	
}
