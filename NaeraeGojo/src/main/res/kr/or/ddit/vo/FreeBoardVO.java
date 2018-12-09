package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;


@Data
public class FreeBoardVO {
	
	// 자유게시판
	
	private String freeboard_code;
	private String freeboard_title;
	private String freeboard_content;
	private String freeboard_date;
	private String freeboard_delete;
	private String emp_code;
	private String emp_nick;
	private String project_code;
	private String rnum;
	private String freeboard_hit;
	
	//파일
	private List<ProjectAllFileVO> items;
	

}
