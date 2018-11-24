package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class PblancBoardVO {

	private String rnum;
	private String pblanc_board_code;
	private String pblanc_board_title;
	private String pblanc_board_com;
	private String pblanc_board_com_date;
	private String pblanc_board_link;
	private String pblanc_board_budget;
	private String pblanc_board_end_proposal;
	private String pblanc_board_hit;
	private String emp_code;
	private List<AllFileVO> items;

}
