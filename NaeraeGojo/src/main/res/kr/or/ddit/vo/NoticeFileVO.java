package kr.or.ddit.vo;

public class NoticeFileVO {
	
	// 공지사항 게시판자료
	
	private String notice_file_code; // pk
	private String notice_file_save_name;
	private String notice_file_name;
	private String notice_file_volume;
	private String notice_file_delete;
	private String notice_code; // fk
	public String getNotice_file_code() {
		return notice_file_code;
	}
	public void setNotice_file_code(String notice_file_code) {
		this.notice_file_code = notice_file_code;
	}
	public String getNotice_file_save_name() {
		return notice_file_save_name;
	}
	public void setNotice_file_save_name(String notice_file_save_name) {
		this.notice_file_save_name = notice_file_save_name;
	}
	public String getNotice_file_name() {
		return notice_file_name;
	}
	public void setNotice_file_name(String notice_file_name) {
		this.notice_file_name = notice_file_name;
	}
	public String getNotice_file_volume() {
		return notice_file_volume;
	}
	public void setNotice_file_volume(String notice_file_volume) {
		this.notice_file_volume = notice_file_volume;
	}
	public String getNotice_file_delete() {
		return notice_file_delete;
	}
	public void setNotice_file_delete(String notice_file_delete) {
		this.notice_file_delete = notice_file_delete;
	}
	public String getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(String notice_code) {
		this.notice_code = notice_code;
	}
	
	
	
}
