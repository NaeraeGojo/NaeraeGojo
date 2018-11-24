package kr.or.ddit.rqpps.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.RqppsVO;

public interface IRqppsService {
	public void updateRqpps(RqppsVO rqv) throws SQLException;
	
	public void deleteRqpps(Map<String, String> params) throws SQLException;
	
	public List<RqppsVO> getRqppsList(Map<String, String> params) throws SQLException;
	
	public RqppsVO getRqpps(Map<String, String> params) throws SQLException;

	public void insertRqpps(RqppsVO rqv, MultipartFile[] files) throws SQLException;

	public int totalCount(Map<String, String> params) throws SQLException;

	public List<RqppsVO> getMyRfp(Map<String, String> params) throws SQLException;
	
	/**
	 * rqpps_code를 가진 제안요청서의 now_condition을 rqpps_now_condition으로 업데이트
	 * rqpps_now_condition 1:신규		2:인력투입		3:제안서		4:프로젝트
	 * @author 박희태
	 * @param params rqpps_now_condition ,rqpps_code
	 * @throws SQLException
	 */
	public void updateRfpCondition(Map<String, String> params) throws SQLException;
}
