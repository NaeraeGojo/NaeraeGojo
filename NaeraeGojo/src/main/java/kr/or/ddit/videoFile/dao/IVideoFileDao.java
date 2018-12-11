package kr.or.ddit.videoFile.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.vo.VideoFileVO;

public interface IVideoFileDao {

	public void insertChatFile(VideoFileVO mfile) throws SQLException;

	public VideoFileVO getVideoFile(Map<String, String> params) throws SQLException;

	public String getfileCode(String video_chat_room_code) throws SQLException;

	public void updateVideoChatFile(VideoFileVO vhfile) throws SQLException;

	public String getVideoFileCode(String video_chat_room_code) throws SQLException;
	
}
