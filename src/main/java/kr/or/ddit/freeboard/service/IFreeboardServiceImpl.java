package kr.or.ddit.freeboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.freeboard.dao.IFreeboardDao;
import kr.or.ddit.vo.FreeBoardVO;

@Service
public class IFreeboardServiceImpl implements IFreeboardService{

	@Autowired
	private IFreeboardDao freeboardDao;
	
	@Override
	public FreeBoardVO freeboardInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeBoardVO> freeboardList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFreeboardInfo(FreeBoardVO freeboardInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFreeboardInfo(FreeBoardVO freeboardInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
