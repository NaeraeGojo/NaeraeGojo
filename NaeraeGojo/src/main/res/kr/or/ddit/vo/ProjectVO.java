package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ProjectVO {
	
	// 프로젝트
	
	private String project_code;
	private String project_date;
	private String project_start;
	private String project_end;
	private String project_name;
	private String suggest_code;
	
	private String rnum;
	private String pw_percent;
	private String suggest_cost;
	private String rqpps_notice_agency;
	private String emp_code;
	
	// 최동화 추가 -- 화상채팅에 필요함
	private String position_name;
	private String emp_name;
	
	private String rqpps_code;
	private String rqpps_nickname;
	private String join_code;
}
