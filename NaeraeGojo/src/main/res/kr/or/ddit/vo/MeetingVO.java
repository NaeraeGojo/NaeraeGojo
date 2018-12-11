package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class MeetingVO {
	
	// 회의록
	
	private String meeting_code;
	private String meeting_title;
	private String meeting_content;
	private String meeting_date;
	private String meeting_delete;
	private String emp_code;
	private String pw_code; //프로젝트 업무 코드가 왜 필요한지는 모르겟음
	private String meeting_hit;
	private String rnum;
	private String project_name;
	private List<MeetFileVO> items;
	private String project_code;
	

}
