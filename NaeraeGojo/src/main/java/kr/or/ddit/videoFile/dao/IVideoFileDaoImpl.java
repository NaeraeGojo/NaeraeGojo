package kr.or.ddit.videoFile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatListTempVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.VideoChatRoomVO;
import kr.or.ddit.vo.VideoFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IVideoFileDaoImpl implements IVideoFileDao{
	
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertChatFile(VideoFileVO mfile) throws SQLException  {
		client.insert("videoFile.insertChatFile", mfile);
	}

	@Override
	public VideoFileVO getVideoFile(Map<String, String> params)
			throws SQLException {
		return (VideoFileVO) client.queryForObject("videoFile.getVideoFile", params);
	}

	@Override
	public String getfileCode(String video_chat_room_code) throws SQLException {
		return (String) client.queryForObject("videoFile.getfileCode", video_chat_room_code);
	}

	@Override
	public void updateVideoChatFile(VideoFileVO vhfile) throws SQLException {
		client.update("videoFile.updateVideoChatFile", vhfile);
	}

	@Override
	public String getVideoFileCode(String video_chat_room_code)
			throws SQLException {
		return (String) client.queryForObject("videoFile.getVideoFileCode", video_chat_room_code);
	}


}
