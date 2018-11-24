package kr.or.ddit.videochatjoin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.VideoChatJoinVO;

public interface IVideoChatJoinService {
	public void insertVideoChatJoin(Map<String, String> params) throws SQLException;
	
	public void updateVideoChatJoin(VideoChatJoinVO vcrv) throws SQLException;
	
	public void deleteVideoChatJoin(Map<String, String> params) throws SQLException;
	
	public List<VideoChatJoinVO> getVideoChatJoinList(Map<String, String> params) throws SQLException;
	
	public VideoChatJoinVO getVideoChatJoin(Map<String, String> params) throws SQLException;
}
