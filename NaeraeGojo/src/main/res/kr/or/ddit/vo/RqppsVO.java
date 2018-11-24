package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class RqppsVO {

	// 제안요청서 관리
		
	private String rqpps_code;
	private String rqpps_notice_agency;
	private String rqpps_name;
	private String rqpps_contents;
	private String rqpps_end_date;
	private String rqpps_date;
	private String rqpps_budget;
	private String rqpps_qualification;
	private String rqpps_now_condition;		// 1: 신규등록(제안요청서만 o)				2: 인력투입까지 (제안요청서, 인력투입)
											// 3: 제안서까지(제안요청서,인력투입,제안서)	4: 프로젝트 등록까지
	private String rqpps_delete;
	private String emp_code;
	private String mp_code;
	private String rnum;
	private String rqpps_nickname;
	private List<SuggestFileVO> items;

}
