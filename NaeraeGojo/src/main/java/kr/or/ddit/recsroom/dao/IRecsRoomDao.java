package kr.or.ddit.recsroom.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RecsRoomVO;

public interface IRecsRoomDao {
	public String insertRecsRoom(RecsRoomVO rrv) throws SQLException;
	
	public void updateRecsRoom(RecsRoomVO rv) throws SQLException;
	
	public void deleteRecsRoom(Map<String, String> params) throws SQLException;
	
	public List<RecsRoomVO> getRecsRoomList(Map<String, String> params) throws SQLException;
	
	public RecsRoomVO getRecsRoom(Map<String, String> params) throws SQLException;

	public int totalCount(Map<String, String> params) throws SQLException;
	
}
