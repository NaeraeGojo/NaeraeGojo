package kr.or.ddit.recsroom.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RecsRoomVO;

public interface IRecsRoomService {
	public void insertRecsRoom(Map<String, String> params) throws SQLException;
	
	public void updateRecsRoom(RecsRoomVO rv) throws SQLException;
	
	public void deleteRecsRoom(Map<String, String> params) throws SQLException;
	
	public List<RecsRoomVO> getRecsRoomList(Map<String, String> params) throws SQLException;
	
	public RecsRoomVO getRecsRoom(Map<String, String> params) throws SQLException;

}
