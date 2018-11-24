package kr.or.ddit.vo;

import java.util.List;

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
	
	public String getMeeting_code() {
		return meeting_code;
	}
	public void setMeeting_code(String meeting_code) {
		this.meeting_code = meeting_code;
	}
	public String getMeeting_title() {
		return meeting_title;
	}
	public void setMeeting_title(String meeting_title) {
		this.meeting_title = meeting_title;
	}
	public String getMeeting_content() {
		return meeting_content;
	}
	public void setMeeting_content(String meeting_content) {
		this.meeting_content = meeting_content;
	}
	public String getMeeting_date() {
		return meeting_date;
	}
	public void setMeeting_date(String meeting_date) {
		this.meeting_date = meeting_date;
	}
	public String getMeeting_delete() {
		return meeting_delete;
	}
	public void setMeeting_delete(String meeting_delete) {
		this.meeting_delete = meeting_delete;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getPw_code() {
		return pw_code;
	}
	public void setPw_code(String pw_code) {
		this.pw_code = pw_code;
	}
	public String getMeeting_hit() {
		return meeting_hit;
	}
	public void setMeeting_hit(String meeting_hit) {
		this.meeting_hit = meeting_hit;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public List<MeetFileVO> getItems() {
		return items;
	}
	public void setItems(List<MeetFileVO> items) {
		this.items = items;
	}
	
	

}
