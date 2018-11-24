package kr.or.ddit.vo;

import lombok.Data;

@Data
public class SuggestFileVO {
	
	// 제안서 파일
	
	private String suggfi_code;
	private String suggfi_save_name;
	private String suggfi_name;
	private String suggfi_path;
	private String suggfi_volume;
	private String suggfi_delete;
	private String suggfi_doc_code;
	private String suggfi_kind_code; // 1. 제안요청서  2.공고서 3.제안서
	

}
