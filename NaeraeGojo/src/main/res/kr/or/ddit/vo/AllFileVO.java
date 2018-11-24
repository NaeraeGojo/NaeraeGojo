package kr.or.ddit.vo;

public class AllFileVO {
	
	// 전체게시판자료
	
	private String all_file_code; // pk
	private String all_file_save_name;
	private String all_file_board_code;
	private String all_file_name;
	private String all_file_volume;
	private String all_file_delete;
	private String all_file_kind_code; // fk
	
	public String getAll_file_board_code() {
		return all_file_board_code;
	}
	public void setAll_file_board_code(String all_file_board_code) {
		this.all_file_board_code = all_file_board_code;
	}
	public String getAll_file_kind_code() {
		return all_file_kind_code;
	}
	public void setAll_file_kind_code(String all_file_kind_code) {
		this.all_file_kind_code = all_file_kind_code;
	}
	public String getAll_file_code() {
		return all_file_code;
	}
	public void setAll_file_code(String all_file_code) {
		this.all_file_code = all_file_code;
	}
	public String getAll_file_delete() {
		return all_file_delete;
	}
	public void setAll_file_delete(String all_file_delete) {
		this.all_file_delete = all_file_delete;
	}
	public String getAll_file_save_name() {
		return all_file_save_name;
	}
	public void setAll_file_save_name(String all_file_save_name) {
		this.all_file_save_name = all_file_save_name;
	}
	public String getAll_file_name() {
		return all_file_name;
	}
	public void setAll_file_name(String all_file_name) {
		this.all_file_name = all_file_name;
	}
	public String getAll_file_volume() {
		return all_file_volume;
	}
	public void setAll_file_volume(String all_file_volume) {
		this.all_file_volume = all_file_volume;
	}

	
}
