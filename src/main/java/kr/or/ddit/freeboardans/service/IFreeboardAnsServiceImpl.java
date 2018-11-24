package kr.or.ddit.freeboardans.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.freeboardans.dao.IFreeboardAnsDao;
import kr.or.ddit.vo.FreeBoardAnsVO;

@Service
public class IFreeboardAnsServiceImpl implements IFreeboardAnsService{

	@Autowired
	private IFreeboardAnsDao freeboardAnsDao;
	
	@Override
	public FreeBoardAnsVO freeboardAnsInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeBoardAnsVO> freeboardAnsList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFreeboardAnsInfo(FreeBoardAnsVO freeboardAnsInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFreeboardAnsInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFreeboardAnsInfo(FreeBoardAnsVO freeboardAnsInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
