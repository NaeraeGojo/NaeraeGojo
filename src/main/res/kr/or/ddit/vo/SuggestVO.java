package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class SuggestVO {
	
	// 제안서

	private String suggest_code;
	private String suggest_title;
	private String suggest_start_date;
	private String suggest_end_date;
	private String suggest_cost;
	private String suggest_content;
	private String suggest_result;
	private String suggest_delete;
	private List<SuggestFileVO> items;
	private String suggest_reg_date;
	private String rqpps_code;
	
	
	
	//temp
	private String rqpps_nickname;
	

}
