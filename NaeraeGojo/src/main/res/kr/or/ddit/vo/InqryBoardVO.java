package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class InqryBoardVO {
	
	
	// 문의게시판
	
	private String inqry_board_code;
	private String inqry_board_title;
	private String inqry_board_content;
	private String inqry_board_date;
	private String inqry_board_delete;
	private String inqry_board_hit;
	private String rnum;
	private String emp_code; 
	private String emp_nick; 
	
	private List<AllFileVO> items;
	
}
