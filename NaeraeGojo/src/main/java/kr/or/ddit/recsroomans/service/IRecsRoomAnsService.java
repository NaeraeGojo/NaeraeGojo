package kr.or.ddit.recsroomans.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RecsRoomAnsVO;

public interface IRecsRoomAnsService {
	public void insertRecsRoomAns(Map<String, String> params) throws SQLException;
	
	public void updateRecsRoomAns(RecsRoomAnsVO rrav) throws SQLException;
	
	public void deleteRecsRoomAns(Map<String, String> params) throws SQLException;
	
	public List<RecsRoomAnsVO> getRecsRoomAnsList(Map<String, String> params) throws SQLException;
	
	public RecsRoomAnsVO getRecsRoomAns(Map<String, String> params) throws SQLException;
}
