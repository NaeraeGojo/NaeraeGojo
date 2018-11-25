package kr.or.ddit.computation.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.computation.dao.IComputationDao;
import kr.or.ddit.vo.ComputationVO;

@Service
public class IComputationServiceImpl implements IComputationService {

	@Autowired
	private IComputationDao computationDao;
	
	@Override
	public ComputationVO computationInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComputationVO> computationList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertComputationInfo(ComputationVO computationInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComputationInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComputationInfo(ComputationVO computationInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
}
