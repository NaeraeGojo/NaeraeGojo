package kr.or.ddit.vo;

public class UserFileVO {

	// 유저파일
	
	private String user_file_code;
	private String user_file_name;
	private String user_file_volume;
	private String user_file_delete;
	private String user_file_save_name;
	private String emp_code;

	
	
	
	
	
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getUser_file_save_name() {
		return user_file_save_name;
	}
	public void setUser_file_save_name(String user_file_save_name) {
		this.user_file_save_name = user_file_save_name;
	}
	public String getUser_file_code() {
		return user_file_code;
	}
	public void setUser_file_code(String user_file_code) {
		this.user_file_code = user_file_code;
	}
	public String getUser_file_name() {
		return user_file_name;
	}
	public void setUser_file_name(String user_file_name) {
		this.user_file_name = user_file_name;
	}
	public String getUser_file_volume() {
		return user_file_volume;
	}
	public void setUser_file_volume(String user_file_volume) {
		this.user_file_volume = user_file_volume;
	}
	public String getUser_file_delete() {
		return user_file_delete;
	}
	public void setUser_file_delete(String user_file_delete) {
		this.user_file_delete = user_file_delete;
	}
}
