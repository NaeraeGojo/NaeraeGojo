package kr.or.ddit.position.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PositionVO;

public interface IPositionService {
	public PositionVO positionInfo(Map<String,String> params) throws SQLException;
	public List<PositionVO> positionList() throws SQLException;
//	public void insertPositionInfo(PositionVO positionInfo) throws SQLException;
//	public void deletePositionInfo(Map<String,String> params) throws SQLException;
//	public void updatePositionInfo(PositionVO positionInfo) throws SQLException;
	
	
}
