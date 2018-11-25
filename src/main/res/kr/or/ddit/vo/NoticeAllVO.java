package kr.or.ddit.vo;

import java.util.List;

public class NoticeAllVO {

	// 공지사항(전체)
	
	private String notice_all_code;
	private String notice_all_title;
	private String notice_all_content;
	private String notice_all_date;
	private String notice_all_delete;
	private String notice_all_hit;
	private String notice_all_pass;
	private String rnum;
	private String emp_code;
	private List<AllFileVO> items;
	
	
	
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getNotice_all_pass() {
		return notice_all_pass;
	}
	public void setNotice_all_pass(String notice_all_pass) {
		this.notice_all_pass = notice_all_pass;
	}
	public List<AllFileVO> getItems() {
		return items;
	}
	public void setItems(List<AllFileVO> items) {
		this.items = items;
	}
	public String getNotice_all_hit() {
		return notice_all_hit;
	}
	public void setNotice_all_hit(String notice_all_hit) {
		this.notice_all_hit = notice_all_hit;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getNotice_all_code() {
		return notice_all_code;
	}
	public void setNotice_all_code(String notice_all_code) {
		this.notice_all_code = notice_all_code;
	}
	public String getNotice_all_title() {
		return notice_all_title;
	}
	public void setNotice_all_title(String notice_all_title) {
		this.notice_all_title = notice_all_title;
	}
	public String getNotice_all_content() {
		return notice_all_content;
	}
	public void setNotice_all_content(String notice_all_content) {
		this.notice_all_content = notice_all_content;
	}
	public String getNotice_all_date() {
		return notice_all_date;
	}
	public void setNotice_all_date(String notice_all_date) {
		this.notice_all_date = notice_all_date;
	}
	public String getNotice_all_delete() {
		return notice_all_delete;
	}
	public void setNotice_all_delete(String notice_all_delete) {
		this.notice_all_delete = notice_all_delete;
	}
	
	
	
	
	

}
