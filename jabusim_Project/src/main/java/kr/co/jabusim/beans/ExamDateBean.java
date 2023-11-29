package kr.co.jabusim.beans;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExamDateBean {
	private int examID;
	private Date registrationStartDate;
	private Date examDate;
	private Date registrationEndDate;
}
