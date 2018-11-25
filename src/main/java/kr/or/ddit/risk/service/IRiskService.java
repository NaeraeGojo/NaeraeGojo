package kr.or.ddit.risk.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RiskVO;

public interface IRiskService {
	public void insertRisk(Map<String, String> params) throws SQLException;
	
	public void updateRisk(RiskVO rv) throws SQLException;
	
	public void deleteRisk(Map<String, String> params) throws SQLException;
	
	public List<RiskVO> getRiskList(Map<String, String> params) throws SQLException;
	
	public RiskVO getRisk(Map<String, String> params) throws SQLException;
}
