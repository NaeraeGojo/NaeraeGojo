package kr.or.ddit.computationoutdoc.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.computationoutdoc.dao.IComputationOutDocDao;
import kr.or.ddit.vo.ComputationOutDocVO;

@Service
public class IComputationOutDocServiceImpl implements IComputationOutDocService{

	@Autowired
	private IComputationOutDocDao computationOutDocDao;
	
	@Override
	public ComputationOutDocVO computationOutDocInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComputationOutDocVO> computationOutDocList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertComputationOutDocInfo(
			ComputationOutDocVO computationOutDocInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComputationOutDocInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComputationOutDocInfo(
			ComputationOutDocVO computationOutDocInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
