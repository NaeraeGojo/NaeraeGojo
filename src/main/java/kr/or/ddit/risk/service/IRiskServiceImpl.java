package kr.or.ddit.risk.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.risk.dao.IRiskDao;
import kr.or.ddit.vo.RiskVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IRiskServiceImpl implements IRiskService{
	@Autowired
	private IRiskDao dao;

	@Override
	public void insertRisk(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateRisk(RiskVO rv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRisk(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<RiskVO> getRiskList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RiskVO getRisk(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
