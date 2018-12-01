package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class RecsRoomVO {
	
	// 자료실
	private String recsroom_code;
	private String recsroom_writer;
	private String recsroom_title;
	private String recsroom_content;
	private String recsroom_date;
	private String recsroom_delete;
	private String project_code;
	private String emp_nick;
	private String rnum;
	private String recsroom_hit;
	
	//파일
	private List<ProjectAllFileVO> items;
}
