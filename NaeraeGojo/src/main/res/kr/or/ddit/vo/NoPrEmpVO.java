package kr.or.ddit.vo;

import java.util.List;

public class NoPrEmpVO {
	
	private String notice_code;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private String notice_delete;
	private String notice_hit;
	private String notice_pass;
	private String rnum;
	private String emp_name;
	private String project_name;
	private List<AllFileVO> items;
	public String getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(String notice_code) {
		this.notice_code = notice_code;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_delete() {
		return notice_delete;
	}
	public void setNotice_delete(String notice_delete) {
		this.notice_delete = notice_delete;
	}
	public String getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(String notice_hit) {
		this.notice_hit = notice_hit;
	}
	public String getNotice_pass() {
		return notice_pass;
	}
	public void setNotice_pass(String notice_pass) {
		this.notice_pass = notice_pass;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public List<AllFileVO> getItems() {
		return items;
	}
	public void setItems(List<AllFileVO> items) {
		this.items = items;
	}
	
	

}
