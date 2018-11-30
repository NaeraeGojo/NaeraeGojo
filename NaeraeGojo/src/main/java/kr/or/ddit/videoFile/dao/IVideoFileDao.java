package kr.or.ddit.videoFile.dao;

import java.sql.SQLException;

import kr.or.ddit.vo.VideoFileVO;

public interface IVideoFileDao {

	public void insertChatFile(VideoFileVO mfile) throws SQLException;
	
}
