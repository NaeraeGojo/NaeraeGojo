package kr.or.ddit.position.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.position.dao.IPositionDao;
import kr.or.ddit.vo.PositionVO;

@Service
public class IPositionServiceImpl implements IPositionService{

	@Autowired
	private IPositionDao dao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public PositionVO positionInfo(Map<String, String> params)
			throws SQLException {
		return dao.positionInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public List<PositionVO> positionList() throws SQLException {
		return dao.positionList();
	}

//	@Override
//	public void insertPositionInfo(PositionVO positionInfo) throws SQLException {
//		
//	}
//	
//	@Override
//	public void deletePositionInfo(Map<String, String> params)
//			throws SQLException {
//		
//	}
//
//	@Override
//	public void updatePositionInfo(PositionVO positionInfo) throws SQLException {
//		
//	}

	
}
