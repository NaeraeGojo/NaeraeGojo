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
//	public String getFreeboard_code() {
//		return freeboard_code;
//	}
//	public void setFreeboard_code(String freeboard_code) {
//		this.freeboard_code = freeboard_code;
//	}
//	public String getFreeboard_title() {
//		return freeboard_title;
//	}
//	public void setFreeboard_title(String freeboard_title) {
//		this.freeboard_title = freeboard_title;
//	}
//	public String getFreeboard_content() {
//		return freeboard_content;
//	}
//	public void setFreeboard_content(String freeboard_content) {
//		this.freeboard_content = freeboard_content;
//	}
//	public String getFreeboard_date() {
//		return freeboard_date;
//	}
//	public void setFreeboard_date(String freeboard_date) {
//		this.freeboard_date = freeboard_date;
//	}
//	public String getFreeboard_delete() {
//		return freeboard_delete;
//	}
//	public void setFreeboard_delete(String freeboard_delete) {
//		this.freeboard_delete = freeboard_delete;
//	}
//	
	

}
