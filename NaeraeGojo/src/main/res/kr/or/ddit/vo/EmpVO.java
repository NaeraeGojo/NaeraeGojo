package kr.or.ddit.vo;

import lombok.Data;

@Data
public class EmpVO {
	
	// 직원 관리
	
	private String emp_code; 	// 직원코드
	private String emp_pass; 	// 비밀번호(초기에는 본인의 입사일 예>20150411)
	private String emp_name; 	// 직원이름
	private String emp_email; 	// 직원 이메일(@naver.com / @google.com)
	private String emp_encpn; 	// 직원 입사일
	private String emp_major;	// 전공
	private String emp_gender;	// 성별
	private String emp_marriage;	// 결혼여부(기혼(y)미혼(n))
	private String emp_level;	//레벨(숫자)
	private String emp_army;	//병역여부(해당사항없음or군필(y)미필(n))
	private String emp_delete;	// 퇴사(탈퇴)여부(퇴사(y))
	private String emp_role;	// 직원 권한(개발자:DEP/ PM:PM/ PL:PL/ 관리자:MANAGER)
	private String emp_phone;	// 직원 전화번호
	private String part_code;	// 직원부서
	private String part_name;	// 직원부서
	private String emp_nick;
	private String rnum;
	
	
	
	
}
