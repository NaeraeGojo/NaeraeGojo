package kr.or.ddit.rqpps.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RqppsVO;

public interface IRqppsDao {
	public String insertRqpps(RqppsVO rqv) throws SQLException;
	
	public void updateRqpps(RqppsVO rqv) throws SQLException;
	
	public void deleteRqpps(Map<String, String> params) throws SQLException;
	
	public List<RqppsVO> getRqppsList(Map<String, String> params) throws SQLException;
	
	public RqppsVO getRqpps(Map<String, String> params) throws SQLException;

	public int totalCount(Map<String, String> params) throws SQLException;

	public List<RqppsVO> getMyRfp(Map<String, String> params) throws SQLException;
	
	public void updateRfpCondition(Map<String, String> params) throws SQLException;
	
	
}
