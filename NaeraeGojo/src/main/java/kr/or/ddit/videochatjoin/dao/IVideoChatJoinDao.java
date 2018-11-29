package kr.or.ddit.videochatjoin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.VideoChatJoinVO;

public interface IVideoChatJoinDao {
	public void insertVideoChatJoin(Map<String, String> params) throws SQLException;
	
	public void updateVideoChatJoin(VideoChatJoinVO vcrv) throws SQLException;
	
	public void deleteVideoChatJoin(Map<String, String> params) throws SQLException;
	
	public List<VideoChatJoinVO> getVideoChatJoinList(Map<String, String> params) throws SQLException;
	
	public VideoChatJoinVO getVideoChatJoin(Map<String, String> params) throws SQLException;

	public String getVideoRoomCode(String video_chat_join_code) throws SQLException;

	public String getUrlInfo(String video_chat_room_code) throws SQLException;
	
}
