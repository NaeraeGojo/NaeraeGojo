package kr.or.ddit.videoFile.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.vo.VideoFileVO;

public interface IVideoFileDao {

	public void insertChatFile(VideoFileVO mfile) throws SQLException;

	public VideoFileVO getVideoFile(Map<String, String> params) throws SQLException;
	
}
