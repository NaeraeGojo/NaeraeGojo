package kr.or.ddit.videoFile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.VideoChatRoomVO;
import kr.or.ddit.vo.ChatListTempVO;
import kr.or.ddit.vo.VideoFileVO;

public interface IVideoFileService {

	public void insertChatFile(String video_chat_room_code, MultipartFile files) throws SQLException;

	public VideoFileVO getVideoFile(Map<String, String> params) throws SQLException;

	public void updateMeetingFile(MultipartFile files, String video_chat_room_code) throws SQLException;

	public String getVideoFileCode(String video_chat_room_code) throws SQLException;
	
}
